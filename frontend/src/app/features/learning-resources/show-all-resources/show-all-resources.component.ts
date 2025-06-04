import { CommonModule } from '@angular/common';
import { HttpClient } from '@angular/common/http';
import { Component, Input, OnInit } from '@angular/core';
import { FormsModule } from '@angular/forms';
import { AuthService } from '../../../core/services/auth.service';
import { Router, RouterModule } from '@angular/router';
import { Resource } from '../../../core/models/resource.model';

import { MatDialog } from '@angular/material/dialog';
import { EditLearningResourceDialogComponent } from '../edit-learning-resource-dialog/edit-learning-resource-dialog.component';
import { ConfirmationDialogComponent } from '../../../shared/confirmation-dialog/confirmation-dialog.component';
import { ToastService } from '../../../core/services/toast.service';
import { PublicLearningResourceService } from '../../../core/services/public-learning-resource.service';
import { ModeratorService } from '../../../core/services/moderator.service';

@Component({
  selector: 'app-show-all-resources',
  standalone: true,
  imports: [
    CommonModule,
    FormsModule,
    RouterModule,
    EditLearningResourceDialogComponent,
    ConfirmationDialogComponent,
  ],
  templateUrl: './show-all-resources.component.html',
  styleUrl: './show-all-resources.component.css',
})
export class ShowAllResourcesComponent implements OnInit {
  @Input() showOnlyMine: boolean = false;
  @Input() currentUserEmail: string = '';

  resources: Resource[] = [];
  filteredResources: Resource[] = [];
  paginatedResources: Resource[] = [];

  // UI state
  searchTerm = '';
  currentTagFilter = 'ALL';
  currentStatusFilter = 'ALL';
  currentPage = 1;
  itemsPerPage = 5;
  totalPages = 1;
  pageSizeOptions = [5, 10, 25];

  isLoading = true;

  // For dynamic tag/status filter rendering (collect unique values)
  allTags: string[] = [];
  allStatuses: string[] = [];

  // For edit dialog
  selectedResource: any = null;

  // For delete/confirmation dialog
  showConfirmDialog = false;
  confirmMessage = '';
  resourceIdToDelete: number | null = null;

  constructor(
    private http: HttpClient,
    private authService: AuthService,
    private router: Router,
    private toastService: ToastService,
    private moderatorService: ModeratorService
  ) {}

  ngOnInit() {
    this.fetchResources();
    this.currentUserEmail = this.authService.getCurrentUserEmail() ?? '';
  }

  fetchResources() {
    this.isLoading = true;
    const endpoint = this.showOnlyMine
      ? `/api/moderator/resources`
      : `/api/public/resources`;
    this.http.get<any>(endpoint).subscribe({
      next: (data) => {
        console.log('Fetched data:', data);

        // This handles both paginated and non-paginated
        let loadedResources: Resource[] = [];
        if (Array.isArray(data)) {
          loadedResources = data;
        } else if (data && Array.isArray(data.content)) {
          loadedResources = data.content;
        } else {
          loadedResources = [];
        }

        // Filter for "mine" if needed
        if (this.showOnlyMine && this.currentUserEmail) {
          console.log(
            'Filtering for my resources. currentUserEmail:',
            this.currentUserEmail
          );
          loadedResources.forEach((r) =>
            console.log('Resource authorEmail:', r.authorEmail)
          );
          loadedResources = loadedResources.filter(
            (r) => r.authorEmail === this.currentUserEmail
          );
          console.log('My resources after filter:', loadedResources);
        }

        this.resources = loadedResources;
        this.isLoading = false;

        // Collect unique tags/statuses for filter buttons (guard for missing .tags)
        this.allTags = Array.from(
          new Set(this.resources.flatMap((r) => r.tags || []))
        ).sort();
        this.allStatuses = Array.from(
          new Set(this.resources.map((r) => r.status))
        ).sort();

        this.applyFilters();
      },
      error: () => {
        this.isLoading = false;
        this.resources = [];
        this.filteredResources = [];
        this.paginatedResources = [];
      },
    });
  }

  applyFilter(event: Event) {
    this.searchTerm = (event.target as HTMLInputElement).value
      .trim()
      .toLowerCase();
    this.applyFilters();
  }

  filterByTag(tag: string) {
    this.currentTagFilter = tag;
    this.applyFilters();
  }

  filterByStatus(status: string) {
    this.currentStatusFilter = status;
    this.applyFilters();
  }

  applyFilters() {
    this.currentPage = 1;
    this.filteredResources = this.resources.filter((resource) => {
      const matchesSearch =
        resource.title.toLowerCase().includes(this.searchTerm) ||
        resource.url.toLowerCase().includes(this.searchTerm) ||
        (resource.tags || []).some((tag) =>
          tag.toLowerCase().includes(this.searchTerm)
        ) ||
        resource.authorEmail.toLowerCase().includes(this.searchTerm) ||
        resource.status.toLowerCase().includes(this.searchTerm);

      const matchesTag =
        this.currentTagFilter === 'ALL' ||
        (resource.tags || []).includes(this.currentTagFilter);

      const matchesStatus =
        this.currentStatusFilter === 'ALL' ||
        resource.status === this.currentStatusFilter;

      return matchesSearch && matchesTag && matchesStatus;
    });
    this.totalPages = Math.max(
      1,
      Math.ceil(this.filteredResources.length / this.itemsPerPage)
    );
    this.updatePagination();
  }

  updatePagination() {
    const startIndex = (this.currentPage - 1) * this.itemsPerPage;
    const endIndex = startIndex + this.itemsPerPage;
    this.paginatedResources = this.filteredResources.slice(
      startIndex,
      endIndex
    );
  }

  nextPage() {
    if (this.currentPage < this.totalPages) {
      this.currentPage++;
      this.updatePagination();
    }
  }

  prevPage() {
    if (this.currentPage > 1) {
      this.currentPage--;
      this.updatePagination();
    }
  }

  updatePageSize() {
    this.currentPage = 1;
    this.totalPages = Math.max(
      1,
      Math.ceil(this.filteredResources.length / this.itemsPerPage)
    );
    this.updatePagination();
  }

  goToOverview(id: number) {
    this.router.navigate(['/learning-resources', id]);
  }

  editResource(id: number) {
    this.router.navigate(['/moderator/learning-resources/edit', id]);
  }

  openEditDialog(resource: any) {
    this.selectedResource = resource;
  }

  closeDialog(refresh: boolean) {
    this.selectedResource = null;
    if (refresh) {
      this.fetchResources();
    }
  }

  opetDeleteDialog(resourceId: number, title: string) {
    this.resourceIdToDelete = resourceId;
    this.confirmMessage = `Are you sure you want to delete "${title}"?`;
    this.showConfirmDialog = true;
  }

  handleDeleteConfirmation(confirmed: boolean) {
    this.showConfirmDialog = false;
    if (confirmed && this.resourceIdToDelete !== null) {
      this.moderatorService.deleteResource(this.resourceIdToDelete).subscribe({
        next: () => {
          this.resources = this.resources.filter(
            (r) => r.id !== this.resourceIdToDelete
          );
          this.resourceIdToDelete = null;
          this.toastService.showSuccess('Resource deleted successfully');
          this.fetchResources();
        },
        error: (err) => {
          console.error('Delete failed', err);
        },
      });
    } else {
      this.resourceIdToDelete = null;
    }
  }
}
