import { Component, Input, Output, EventEmitter } from '@angular/core';
import { CommonModule } from '@angular/common';

@Component({
  selector: 'app-section-moderator-view',
  standalone: true,
  imports: [CommonModule],
  templateUrl: './section-moderator-view.component.html',
  styleUrls: ['./section-moderator-view.component.css'],
})
export class SectionModeratorViewComponent {
  @Input() section: any;
  @Output() sectionUpdated = new EventEmitter<void>();

  editSection() {
    // Open modal or navigate to edit page (as you wish)
    alert('Edit section coming soon!');
    // After edit, call this.sectionUpdated.emit();
  }
  deleteSection() {
    if (confirm('Are you sure you want to delete this section?')) {
      // Call backend to delete
      alert('Section deleted (simulate)');
      this.sectionUpdated.emit();
    }
  }
  moveSectionUp() {
    // Call backend
    alert('Section moved up');
    this.sectionUpdated.emit();
  }
  moveSectionDown() {
    // Call backend
    alert('Section moved down');
    this.sectionUpdated.emit();
  }
  publishSection() {
    // Call backend
    alert('Section published');
    this.sectionUpdated.emit();
  }
  unpublishSection() {
    // Call backend
    alert('Section unpublished');
    this.sectionUpdated.emit();
  }
}
