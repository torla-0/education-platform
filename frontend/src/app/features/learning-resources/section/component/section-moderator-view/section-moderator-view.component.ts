import { Component, Input, Output, EventEmitter } from '@angular/core';
import { SectionService } from '../../service/section.service';
import { SectionDto, UpdateSectionDto } from '../../model/section.model';
import { CommonModule, Location } from '@angular/common';
import { EditSectionDialogComponent } from '../edit-section-dialog/edit-section-dialog.component';
import { ToastService } from '../../../../../core/services/toast.service';
import { ActivatedRoute, Router } from '@angular/router';
import { ConfirmationDialogComponent } from '../../../../../shared/confirmation-dialog/confirmation-dialog.component';

@Component({
  selector: 'app-section-moderator-view',
  standalone: true,
  imports: [
    CommonModule,
    EditSectionDialogComponent,
    ConfirmationDialogComponent,
  ],
  templateUrl: './section-moderator-view.component.html',
  styleUrls: ['./section-moderator-view.component.css'],
})
export class SectionModeratorViewComponent {
  @Input() section!: SectionDto;
  @Input() resourceId!: number;
  @Output() sectionUpdated = new EventEmitter<void>();

  isLoading = false;
  statusMessage = '';

  editing = false;

  // For delete/confirmation dialog
  showConfirmDialog = false;
  confirmMessage = '';
  sectionIdToDelete: number | null = null;

  constructor(
    private sectionService: SectionService,
    private toastService: ToastService,
    private router: Router,
    private location: Location,
    private route: ActivatedRoute
  ) {}

  moveSectionUp() {
    this.isLoading = true;
    this.sectionService.moveSectionUp(this.section.id).subscribe({
      next: () => {
        this.toastService.showSuccess('Section moved up');
        this.sectionUpdated.emit();
        this.isLoading = false;
      },
      error: () => {
        this.toastService.showError('Failed to move up');
        this.isLoading = false;
      },
    });
  }

  moveSectionDown() {
    this.isLoading = true;
    this.sectionService.moveSectionDown(this.section.id).subscribe({
      next: () => {
        this.toastService.showSuccess('Section moved down');
        this.sectionUpdated.emit();
        this.isLoading = false;
      },
      error: () => {
        this.toastService.showError('Failed to move down');
        this.isLoading = false;
      },
    });
  }

  openDeleteDialog(sectionId: number, title: string) {
    this.sectionIdToDelete = sectionId;
    this.confirmMessage = `Are you sure you want to delete "${title}"?`;
    this.showConfirmDialog = true;
  }

  handleDeleteConfirmation(confirmed: boolean) {
    this.showConfirmDialog = false;

    if (!confirmed || this.sectionIdToDelete === null) {
      this.sectionIdToDelete = null;
      return;
    }

    this.isLoading = true;
    this.sectionService.deleteSection(this.sectionIdToDelete).subscribe({
      next: () => {
        this.toastService.showSuccess('Section deleted');
        this.router.navigate(['/learning-resources', this.resourceId]);
      },
      error: () => {
        this.toastService.showError('Failed to delete');
      },
      complete: () => {
        this.sectionIdToDelete = null;
        this.isLoading = false;
      },
    });
  }

  confirmPublish() {
    if (confirm('Publish this section?')) this.publishSection();
  }

  publishSection() {
    this.isLoading = true;
    this.sectionService.publishSection(this.section.id).subscribe({
      next: () => {
        this.toastService.showSuccess('Section published');
        this.sectionUpdated.emit();
        this.isLoading = false;
      },
      error: () => {
        this.toastService.showError('Failed to publish');
        this.isLoading = false;
      },
    });
  }

  confirmUnpublish() {
    if (confirm('Unpublish this section?')) this.unpublishSection();
  }

  unpublishSection() {
    this.isLoading = true;
    this.sectionService.unpublishSection(this.section.id).subscribe({
      next: () => {
        this.toastService.showSuccess('Section unpublished');
        this.sectionUpdated.emit();
        this.isLoading = false;
      },
      error: () => {
        this.toastService.showError('Failed to unpublish');
        this.isLoading = false;
      },
    });
  }

  editSection() {
    this.editing = true;
  }

  onSaveEdit(dto: UpdateSectionDto) {
    this.sectionService.updateSection(this.section.id, dto).subscribe(() => {
      this.toastService.showSuccess('Section updated');
      this.sectionUpdated.emit();
      this.editing = false;
    });
  }

  loadSection() {
    this.sectionService.getSectionById(this.section.id).subscribe((sec) => {
      this.section = sec;
    });
  }
}
