import { Component, OnInit } from '@angular/core';
import {
  FormBuilder,
  FormGroup,
  ReactiveFormsModule,
  Validators,
} from '@angular/forms';
import { UserService } from '../core/services/user.service';
import { User } from '../core/models/User';
import { MatSnackBar } from '@angular/material/snack-bar';
import { CommonModule } from '@angular/common';
import { MatProgressSpinnerModule } from '@angular/material/progress-spinner';

@Component({
  selector: 'app-profile',
  templateUrl: './profile.component.html',
  styleUrls: ['./profile.component.css'],
  imports: [ReactiveFormsModule, CommonModule, MatProgressSpinnerModule],
})
export class ProfileComponent implements OnInit {
  profileForm!: FormGroup;
  passwordForm!: FormGroup;
  editMode = false;
  loading = false;

  constructor(
    private fb: FormBuilder,
    private userService: UserService,
    private snackBar: MatSnackBar
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
          this.snackBar.open('✅ Profile updated successfully', 'Close', {
            panelClass: ['snackbar-success'],
            duration: 3000,
          });
        },
        error: (err) => {
          this.loading = false;
          this.snackBar.open('❌ Failed to update profile', 'Close', {
            panelClass: ['snackbar-error'],
            duration: 3000,
          });
        },
      });
    }
  }

  onPasswordSubmit(): void {
    if (
      this.passwordForm.valid &&
      this.passwordForm.value.new === this.passwordForm.value.confirm
    ) {
      console.log('Send new password to backend...');
      // implement password update logic here
    } else {
      this.snackBar.open('❌ Passwords do not match', 'Close', {
        duration: 3000,
      });
    }
  }
}
