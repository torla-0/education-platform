import { Component, Input, Output, EventEmitter } from '@angular/core';
import { SectionService } from '../../service/section.service';
import { SectionDto, UpdateSectionDto } from '../../model/section.model';
import { CommonModule } from '@angular/common';
import { EditSectionDialogComponent } from '../edit-section-dialog/edit-section-dialog.component';

@Component({
  selector: 'app-section-moderator-view',
  standalone: true,
  imports: [CommonModule, EditSectionDialogComponent],
  templateUrl: './section-moderator-view.component.html',
  styleUrls: ['./section-moderator-view.component.css'],
})
export class SectionModeratorViewComponent {
  @Input() section!: SectionDto;
  @Output() sectionUpdated = new EventEmitter<void>();

  isLoading = false;
  statusMessage = '';

  editing = false;

  constructor(private sectionService: SectionService) {}

  showStatus(message: string) {
    this.statusMessage = message;
    setTimeout(() => (this.statusMessage = ''), 2000);
  }

  moveSectionUp() {
    this.isLoading = true;
    this.sectionService.moveSectionUp(this.section.id).subscribe({
      next: () => {
        this.showStatus('Section moved up');
        this.sectionUpdated.emit();
        this.isLoading = false;
      },
      error: () => {
        this.showStatus('Failed to move up');
        this.isLoading = false;
      },
    });
  }

  moveSectionDown() {
    this.isLoading = true;
    this.sectionService.moveSectionDown(this.section.id).subscribe({
      next: () => {
        this.showStatus('Section moved down');
        this.sectionUpdated.emit();
        this.isLoading = false;
      },
      error: () => {
        this.showStatus('Failed to move down');
        this.isLoading = false;
      },
    });
  }

  confirmDelete() {
    if (confirm('Are you sure you want to delete this section?')) {
      this.deleteSection();
    }
  }

  deleteSection() {
    this.isLoading = true;
    this.sectionService.deleteSection(this.section.id).subscribe({
      next: () => {
        this.showStatus('Section deleted');
        this.sectionUpdated.emit();
        this.isLoading = false;
      },
      error: () => {
        this.showStatus('Failed to delete');
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
        this.showStatus('Section published');
        this.sectionUpdated.emit();
        this.isLoading = false;
      },
      error: () => {
        this.showStatus('Failed to publish');
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
        this.showStatus('Section unpublished');
        this.sectionUpdated.emit();
        this.isLoading = false;
      },
      error: () => {
        this.showStatus('Failed to unpublish');
        this.isLoading = false;
      },
    });
  }

  editSection() {
    this.editing = true;
  }

  onSaveEdit(dto: UpdateSectionDto) {
    this.sectionService.updateSection(this.section.id, dto).subscribe(() => {
      this.showStatus('Section updated');
      this.sectionUpdated.emit();
      this.editing = false;
    });
  }
}
