import { Component, OnInit } from '@angular/core';
import {
  FormBuilder,
  FormGroup,
  FormsModule,
  ReactiveFormsModule,
  Validators,
} from '@angular/forms';
import { UserService } from '../core/services/user.service';
import { User } from '../core/models/User';
import { MatSnackBar } from '@angular/material/snack-bar';
import { CommonModule } from '@angular/common';
import { MatProgressSpinnerModule } from '@angular/material/progress-spinner';
import { ToastService } from '../core/services/toast.service';
import { AuthService } from '../core/services/auth.service';
import { Router } from '@angular/router';

@Component({
  selector: 'app-profile',
  templateUrl: './profile.component.html',
  styleUrls: ['./profile.component.css'],
  imports: [
    ReactiveFormsModule,
    CommonModule,
    MatProgressSpinnerModule,
    FormsModule,
  ],
  standalone: true,
})
export class ProfileComponent implements OnInit {
  profileForm!: FormGroup;
  passwordForm!: FormGroup;

  editMode = false;
  loading = false;
  isChangingPassword = false;

  constructor(
    private fb: FormBuilder,
    private userService: UserService,
    private toast: ToastService,
    private router: Router,
    private authService: AuthService
  ) {}

  ngOnInit(): void {
    this.profileForm = this.fb.group({
      username: [{ value: '', disabled: true }],
      email: [
        { value: '', disabled: true },
        [Validators.required, Validators.email],
      ],
      firstName: [{ value: '', disabled: true }, Validators.required],
      lastName: [{ value: '', disabled: true }, Validators.required],
    });

    this.passwordForm = this.fb.group({
      current: ['', Validators.required],
      new: ['', Validators.required],
      confirm: ['', Validators.required],
    });

    this.userService.getProfile().subscribe({
      next: (data: User) => {
        this.profileForm.patchValue(data);
      },
      error: (err) => console.error(err),
    });
  }

  toggleEditMode(): void {
    this.editMode = true;
    Object.values(this.profileForm.controls).forEach((control) =>
      control.enable()
    );
  }

  onProfileSubmit(): void {
    if (this.profileForm.valid) {
      this.loading = true;

      this.userService.updateProfile(this.profileForm.getRawValue()).subscribe({
        next: () => {
          this.loading = false;
          this.editMode = false;
          Object.values(this.profileForm.controls).forEach((control) =>
            control.disable()
          );
          this.toast.showSuccess('✅ Profile updated successfully');
        },
        error: (err) => {
          this.loading = false;
          this.toast.showError('❌ Failed to update profile');
        },
      });
    }
  }

  onPasswordSubmit(): void {
    if (this.passwordForm.invalid) return;

    const { current, new: newPassword, confirm } = this.passwordForm.value;

    if (newPassword !== confirm) {
      this.toast.showError('❌ Passwords do not match');
      return;
    }

    this.isChangingPassword = true;

    this.userService
      .changePassword({ currentPassword: current, newPassword })
      .subscribe({
        next: () => {
          this.toast.showSuccess('✅ Password changed successfully');
          this.passwordForm.reset();
          // Auto logout - make user re-login with new password
          this.authService.logout(); // Clear token
          this.router.navigate(['/login']); // Redirect after logout
        },
        error: (err) => {
          const msg = err.error?.message || 'Failed to change password';
          this.toast.showError(`❌ ${msg}`);
          this.isChangingPassword = false;
        },
      });
  }
}
