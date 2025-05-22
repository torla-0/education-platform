import { Component, OnInit } from '@angular/core';
import {
  FormBuilder,
  FormGroup,
  ReactiveFormsModule,
  Validators,
} from '@angular/forms';
import { MatDialogModule, MatDialogRef } from '@angular/material/dialog';
import { MatFormFieldModule } from '@angular/material/form-field';
import { MatInputModule } from '@angular/material/input';
import { MatButtonModule } from '@angular/material/button';
import { MatProgressSpinnerModule } from '@angular/material/progress-spinner';
import { HttpClient } from '@angular/common/http';
import { ToastService } from '../../../../core/services/toast.service';
import { AuthService } from '../../../../core/services/auth.service';
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
    private toast: ToastService,
    private authService: AuthService
  ) {}

  ngOnInit(): void {
    this.reauthForm = this.fb.group({
      password: ['', [Validators.required, Validators.minLength(6)]],
    });
  }

  onConfirm(): void {
    if (this.reauthForm.invalid) return;

    this.loading = true;

    this.http
      .post('/api/auth/re-authenticate', {
        password: this.reauthForm.value.password,
      })
      .subscribe({
        next: () => {
          this.dialogRef.close({ success: true });
        },
        error: () => {
          this.loading = false;
          this.reauthForm.get('password')?.setErrors({ invalid: true });
          this.toast.showError('❌ Password incorrect');
        },
      });
  }
}
