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
      url: [''],
      status: ['DRAFT', Validators.required],
      tags: [''],
      sections: this.fb.array([]),
    });

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

  async onSubmit() {
    if (this.resourceForm.invalid) return;

    this.isSubmitting = true;
    this.submitSuccess = null;
    this.submitError = null;

    const { title, url, status, tags } = this.resourceForm.value;
    const payload = {
      title,
      url,
      status,
      tags: tags
        ? tags
            .split(',')
            .map((tag: string) => tag.trim())
            .filter((tag: string) => tag)
        : [],
    };

    try {
      const resource: any = await this.http
        .post('/api/moderator/resources', payload)
        .toPromise();

      const resourceId = resource.id;
      if (!resourceId) throw new Error('No resourceId returned from server.');

      const sectionsArray = this.sections.value;
      const sectionPromises = sectionsArray.map((section: any, idx: number) =>
        this.http
          .post('/api/moderator/sections', {
            title: section.heading,
            content: section.content,
            sectionOrder: idx + 1,
            resourceId: resourceId,
          })
          .toPromise()
      );

      await Promise.all(sectionPromises);

      this.submitSuccess = 'Resource and all sections added!';
      this.resourceForm.reset();
      this.sections.clear();
      this.addSection();
      this.isSubmitting = false;
    } catch (err: any) {
      this.submitError =
        err?.error?.message ||
        err?.message ||
        'Failed to add resource or sections.';
      this.isSubmitting = false;
    }
  }
}
