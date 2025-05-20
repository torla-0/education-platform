import { Component } from '@angular/core';
import { CommonModule } from '@angular/common';
import { FormsModule } from '@angular/forms';
import { RouterModule, Router } from '@angular/router';

import { MatFormFieldModule } from '@angular/material/form-field';
import { MatInputModule } from '@angular/material/input';
import { MatButtonModule } from '@angular/material/button';
import { MatCardModule } from '@angular/material/card';
import { MatSnackBarModule } from '@angular/material/snack-bar';
import { MatProgressSpinnerModule } from '@angular/material/progress-spinner';

import { AuthService } from '../../../core/services/auth.service';
import { ToastService } from '../../../core/services/toast.service';

@Component({
  selector: 'app-signup',
  standalone: true,
  imports: [
    CommonModule,
    FormsModule,
    RouterModule,
    MatFormFieldModule,
    MatInputModule,
    MatButtonModule,
    MatCardModule,
    MatSnackBarModule,
    MatProgressSpinnerModule,
  ],
  templateUrl: './signup.component.html',
  styleUrls: ['./signup.component.css'],
})
export class SignupComponent {
  email = '';
  password = '';
  username = '';
  firstName = '';
  lastName = '';
  isLoading = false;

  constructor(
    private auth: AuthService,
    private router: Router,
    private toast: ToastService
  ) {}

  onSubmit() {
    if (this.isLoading) return;

    this.isLoading = true;

    const payload = {
      email: this.email,
      password: this.password,
      username: this.username,
      firstName: this.firstName,
      lastName: this.lastName,
    };

    this.auth.signup(payload).subscribe({
      next: (res) => {
        const message = res.message || '';
        if (message.includes('already in use')) {
          this.toast.showError(message);
          this.isLoading = false;
          return;
        }

        // User created successfully → proceed to auto-login

        this.auth.login(this.email, this.password).subscribe({
          next: (loginRes) => {
            localStorage.setItem('token', loginRes.token);
            this.toast.showSuccess('🎉 Welcome to LearnX!');
            this.router.navigate(['/home']);
          },
          error: () => {
            this.toast.showError('User registered, but auto-login failed.');
            this.isLoading = false;
          },
        });
      },
      error: (err) => {
        console.error('Signup error:', err);
        this.toast.showError('Unexpected error occurred. Please try again.');
        this.isLoading = false;
      },
    });
  }
}
