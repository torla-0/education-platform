import { CommonModule } from '@angular/common';
import { HttpClient } from '@angular/common/http';
import { Component } from '@angular/core';
import {
  FormBuilder,
  FormGroup,
  FormsModule,
  ReactiveFormsModule,
  Validators,
} from '@angular/forms';

@Component({
  selector: 'app-add-learning-resource',
  imports: [CommonModule, FormsModule, ReactiveFormsModule],
  templateUrl: './add-learning-resource.component.html',
  styleUrl: './add-learning-resource.component.css',
})
export class AddLearningResourceComponent {
  resourceForm: FormGroup;
  isSubmitting = false;
  submitSuccess: string | null = null;
  submitError: string | null = null;

  constructor(private fb: FormBuilder, private http: HttpClient) {
    this.resourceForm = this.fb.group({
      title: ['', [Validators.required, Validators.maxLength(120)]],
      url: ['', [Validators.required, Validators.pattern(/^https?:\/\/.+/)]],
      tags: [''], // comma-separated for now
      description: [''],
    });
  }

  onSubmit() {
    if (this.resourceForm.invalid) return;

    this.isSubmitting = true;
    this.submitSuccess = null;
    this.submitError = null;

    // Convert comma-separated tags to array
    const payload = {
      ...this.resourceForm.value,
      tags: this.resourceForm.value.tags
        ? this.resourceForm.value.tags
            .split(',')
            .map((tag: string) => tag.trim())
            .filter((tag: string) => tag)
        : [],
    };

    this.http.post('/api/moderator/resources', payload).subscribe({
      next: () => {
        this.submitSuccess = 'Resource added!';
        this.resourceForm.reset();
        this.isSubmitting = false;
      },
      error: (err) => {
        this.submitError = err?.error?.message || 'Failed to add resource.';
        this.isSubmitting = false;
      },
    });
  }
}
