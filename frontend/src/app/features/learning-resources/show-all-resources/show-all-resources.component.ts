import { CommonModule } from '@angular/common';
import { HttpClient } from '@angular/common/http';
import { Component, Input, OnInit } from '@angular/core';
import { FormsModule } from '@angular/forms';
import { AuthService } from '../../../core/services/auth.service';
import { Router, RouterModule } from '@angular/router';

interface Resource {
  id: number;
  title: string;
  url: string;
  tags: string[];
  authorEmail: string;
  status: string;
  createdAt: string;
  updatedAt: string;
}

@Component({
  selector: 'app-show-all-resources',
  standalone: true,
  imports: [CommonModule, FormsModule, RouterModule],
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

  constructor(
    private http: HttpClient,
    private authService: AuthService,
    private router: Router
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
    this.http.get<Resource[]>(endpoint).subscribe({
      next: (data) => {
        if (this.showOnlyMine && this.currentUserEmail) {
          this.resources = data.filter(
            (r) => r.authorEmail === this.currentUserEmail
          );
        } else {
          this.resources = data;
        }
        this.isLoading = false;

        // collect unique tags/statuses for filter buttons
        this.allTags = Array.from(
          new Set(this.resources.flatMap((r) => r.tags))
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
        resource.tags.some((tag) =>
          tag.toLowerCase().includes(this.searchTerm)
        ) ||
        resource.authorEmail.toLowerCase().includes(this.searchTerm) ||
        resource.status.toLowerCase().includes(this.searchTerm);

      const matchesTag =
        this.currentTagFilter === 'ALL' ||
        resource.tags.includes(this.currentTagFilter);

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
    this.router.navigate(['/moderator/learning-resources', id]);
  }

  editResource(id: number) {
    this.router.navigate(['/moderator/learning-resources/edit', id]);
  }
}
