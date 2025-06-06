import { Component, Input, Output, EventEmitter } from '@angular/core';
import { SectionDto, UpdateSectionDto } from '../../model/section.model';
import { CommonModule } from '@angular/common';
import { FormsModule } from '@angular/forms';

@Component({
  selector: 'app-edit-section-dialog',
  standalone: true,
  imports: [CommonModule, FormsModule],
  templateUrl: './edit-section-dialog.component.html',
  styleUrls: ['./edit-section-dialog.component.css'],
})
export class EditSectionDialogComponent {
  @Input() section!: SectionDto;
  @Output() save = new EventEmitter<UpdateSectionDto>();
  @Output() cancel = new EventEmitter<void>();

  updatedTitle = '';
  updatedContent = '';

  ngOnInit() {
    this.updatedTitle = this.section.title;
    this.updatedContent = this.section.content;
  }

  submit() {
    this.save.emit({
      title: this.updatedTitle.trim(),
      content: this.updatedContent.trim(),
    });
  }

  close() {
    this.cancel.emit();
  }
}
