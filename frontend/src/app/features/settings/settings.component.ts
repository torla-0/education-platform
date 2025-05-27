import { Component, OnInit } from '@angular/core';
import {
  FormBuilder,
  FormGroup,
  FormsModule,
  ReactiveFormsModule,
  Validators,
} from '@angular/forms';

import { MatSnackBar } from '@angular/material/snack-bar';
import { CommonModule } from '@angular/common';
import { MatProgressSpinnerModule } from '@angular/material/progress-spinner';

import { Router } from '@angular/router';
import { MatDialog } from '@angular/material/dialog';
import { User } from '../../core/models/user.model';
import { UserService } from '../../core/services/user.service';
import { ToastService } from '../../core/services/toast.service';
import { AuthService } from '../../core/services/auth.service';
import { ReauthDialogComponent } from './components/reauth-dialog/reauth-dialog.component';

interface ReauthDialogResult {
  success: boolean;
  password: string;
}

@Component({
  selector: 'app-settings',
  templateUrl: './settings.component.html',
  styleUrls: ['./settings.component.css'],
  imports: [
    ReactiveFormsModule,
    CommonModule,
    MatProgressSpinnerModule,
    FormsModule,
  ],
  standalone: true,
})
export class SettingsComponent implements OnInit {
  profileForm!: FormGroup;
  passwordForm!: FormGroup;

  editMode = false;
  loading = false;
  isChangingPassword = false;
  showCurrentPassword = false;
  showNewPassword = false;
  showConfirmPassword = false;

  user: User | null = null;

  constructor(
    private fb: FormBuilder,
    private userService: UserService,
    private toast: ToastService,
    private router: Router,
    private authService: AuthService,
    private dialog: MatDialog
  ) {}

  ngOnInit(): void {
    this.loadUser();
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

  loadUser(): void {
    this.userService.getProfile().subscribe((data) => {
      this.user = data;
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

    const { new: newPassword, confirm } = this.passwordForm.value;

    if (newPassword !== confirm) {
      this.toast.showError('❌ New passwords do not match');
      return;
    }

    // Open re-auth dialog first
    const dialogRef = this.dialog.open(ReauthDialogComponent, {
      width: '400px',
      disableClose: true,
    });

    dialogRef.afterClosed().subscribe((result) => {
      if (result?.success) {
        // Proceed with password change
        this.isChangingPassword = true;

        this.userService
          .changePassword({
            currentPassword: this.passwordForm.get('current')?.value,
            newPassword,
          })
          .subscribe({
            next: () => {
              this.toast.showSuccess('✅ Password changed successfully');
              this.passwordForm.reset();
              this.isChangingPassword = false;
            },
            error: (err) => {
              const msg = err.error?.message || '❌ Failed to change password';
              this.toast.showError(msg);
              this.isChangingPassword = false;
            },
          });
      } else {
        this.toast.showError('❌ Password change cancelled');
      }
    });
  }

  get passwordStrength(): string {
    const value = this.passwordForm?.get('new')?.value || '';
    if (value.length < 6) return 'weak';
    if (
      /[A-Z]/.test(value) &&
      /[0-9]/.test(value) &&
      /[^A-Za-z0-9]/.test(value)
    )
      return 'strong';
    return 'medium';
  }

  requestAccountDeletion(): void {
    const dialogRef = this.dialog.open(ReauthDialogComponent, {
      width: '400px',
      disableClose: true,
    });

    dialogRef.afterClosed().subscribe((result: ReauthDialogResult) => {
      if (result?.success && result.password) {
        this.userService.requestAccountDeletion(result.password).subscribe({
          next: () => {
            this.toast.showSuccess('✅ Deletion request submitted');
          },
          error: (err) => {
            const msg =
              err.error?.message || '❌ Failed to submit deletion request';
            this.toast.showError(msg);
          },
        });
      } else {
        this.toast.showError('❌ Account deletion cancelled');
      }
    });
  }

  cancelDeletion(): void {
    this.userService.cancelAccountDeletion().subscribe({
      next: (updatedUser) => {
        this.toast.showSuccess('✅ Deletion request cancelled');
        this.user = updatedUser;
      },
      error: (err) => {
        const msg = err.error?.message || '❌ Failed to cancel deletion';
        this.toast.showError(msg);
      },
    });
  }
}
