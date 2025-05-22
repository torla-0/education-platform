import { Component, OnInit } from '@angular/core';
import {
  FormBuilder,
  FormGroup,
  Validators,
  ReactiveFormsModule,
} from '@angular/forms';
import { MatDialogRef, MatDialogModule } from '@angular/material/dialog';
import { MatFormFieldModule } from '@angular/material/form-field';
import { MatInputModule } from '@angular/material/input';
import { MatButtonModule } from '@angular/material/button';
import { MatProgressSpinnerModule } from '@angular/material/progress-spinner';
import { HttpClient } from '@angular/common/http';
import { ToastService } from '../../../../core/services/toast.service';
import { MatIconModule } from '@angular/material/icon';
import { CommonModule } from '@angular/common';

@Component({
  standalone: true,
  selector: 'app-reauth-dialog',
  imports: [
    MatDialogModule,
    MatFormFieldModule,
    MatInputModule,
    MatButtonModule,
    MatProgressSpinnerModule,
    ReactiveFormsModule,
    MatIconModule,
    CommonModule,
  ],
  templateUrl: './reauth-dialog.component.html',
  styleUrls: ['./reauth-dialog.component.css'],
})
export class ReauthDialogComponent implements OnInit {
  reauthForm!: FormGroup;
  showPassword = false;
  loading = false;

  constructor(
    public dialogRef: MatDialogRef<ReauthDialogComponent>,
    private fb: FormBuilder,
    private http: HttpClient,
    private toast: ToastService
  ) {}

  ngOnInit(): void {
    this.reauthForm = this.fb.group({
      password: ['', [Validators.required, Validators.minLength(6)]],
    });
  }

  get passwordField() {
    return this.reauthForm.get('password')!;
  }

  togglePasswordVisibility(): void {
    this.showPassword = !this.showPassword;
  }

  onConfirm(): void {
    if (this.reauthForm.invalid) return;
    this.loading = true;

    const password = this.passwordField.value;

    this.http.post('/api/auth/re-authenticate', { password }).subscribe({
      next: () => {
        this.dialogRef.close({ success: true, password });
      },
      error: () => {
        this.loading = false;
        this.passwordField.setErrors({ invalid: true });
        this.toast.showError('❌ Password incorrect');
      },
    });
  }
}
