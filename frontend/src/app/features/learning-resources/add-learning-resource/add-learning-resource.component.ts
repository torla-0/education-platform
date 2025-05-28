import { Component } from '@angular/core';
import {
  FormBuilder,
  FormGroup,
  Validators,
  FormArray,
  FormsModule,
  ReactiveFormsModule,
} from '@angular/forms';
import { HttpClient } from '@angular/common/http';
import { CommonModule } from '@angular/common';

@Component({
  selector: 'app-add-learning-resource',
  standalone: true,
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
      tags: [''], // comma-separated for now
      sections: this.fb.array([]), // Array of sections
    });

    // Start with one blank section
    this.addSection();
  }

  get sections() {
    return this.resourceForm.get('sections') as FormArray;
  }

  addSection() {
    this.sections.push(
      this.fb.group({
        heading: ['', Validators.required],
        content: ['', Validators.required],
      })
    );
  }

  removeSection(index: number) {
    this.sections.removeAt(index);
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
        this.sections.clear();
        this.addSection();
        this.isSubmitting = false;
      },
      error: (err) => {
        this.submitError = err?.error?.message || 'Failed to add resource.';
        this.isSubmitting = false;
      },
    });
  }
}
