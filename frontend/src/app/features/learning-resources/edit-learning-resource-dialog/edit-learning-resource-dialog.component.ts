import { Component, EventEmitter, Input, Output, OnInit } from '@angular/core';
import {
  FormBuilder,
  FormsModule,
  ReactiveFormsModule,
  Validators,
} from '@angular/forms';
import { ModeratorService } from '../../../core/services/moderator.service';
import { CommonModule } from '@angular/common';

@Component({
  selector: 'app-edit-learning-resource-dialog',
  standalone: true,
  imports: [FormsModule, CommonModule, ReactiveFormsModule],
  templateUrl: './edit-learning-resource-dialog.component.html',
  styleUrls: ['./edit-learning-resource-dialog.component.css'],
})
export class EditLearningResourceDialogComponent implements OnInit {
  @Input() resource: any;
  @Output() closed = new EventEmitter<boolean>();

  private fb: FormBuilder;
  form: any;

  constructor(fb: FormBuilder, private service: ModeratorService) {
    this.fb = fb;
    this.form = this.fb.group({
      title: ['', Validators.required],
      url: ['', Validators.required],
      description: [''],
      tags: [[]],
      status: ['DRAFT', Validators.required],
    });
  }

  ngOnInit() {
    if (this.resource) {
      this.form.patchValue(this.resource);
    }
  }

  save() {
    if (this.form.invalid) return;
    const formData = {
      title: this.form.value.title ?? '',
      url: this.form.value.url ?? '',
      tags: this.form.value.tags ?? [],
      description: this.form.value.description ?? '',
      status: this.form.value.status ?? 'DRAFT',
    };
    this.service.updateResource(this.resource.id, formData).subscribe(() => {
      this.closed.emit(true);
    });
  }

  cancel() {
    this.closed.emit(false);
  }

  onTagInput(event: Event) {
    const input = (event.target as HTMLInputElement).value;
    this.form.get('tags')?.setValue(input.split(',').map((tag) => tag.trim()));
  }
}
