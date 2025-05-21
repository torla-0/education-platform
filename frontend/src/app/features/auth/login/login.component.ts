import { Component } from '@angular/core';
import { CommonModule } from '@angular/common';
import { FormsModule } from '@angular/forms';
import { Router, RouterModule } from '@angular/router';
import { MatButtonModule } from '@angular/material/button';
import { MatCardModule } from '@angular/material/card';
import { MatInputModule } from '@angular/material/input';
import { MatFormFieldModule } from '@angular/material/form-field';
import { AuthService } from '../../../core/services/auth.service';
import { MatSnackBar } from '@angular/material/snack-bar';
import { MatProgressSpinnerModule } from '@angular/material/progress-spinner';

@Component({
  selector: 'app-login',
  standalone: true,
  imports: [
    CommonModule,
    FormsModule,
    RouterModule,
    MatInputModule,
    MatButtonModule,
    MatFormFieldModule,
    MatCardModule,
    MatProgressSpinnerModule,
  ],

  templateUrl: './login.component.html',
  styleUrl: './login.component.css',
})
export class LoginComponent {
  email = '';
  password = '';
  error = '';
  loading = false;

  constructor(
    private authService: AuthService,
    private router: Router,
    private snackBar: MatSnackBar
  ) {}

  /*************  ✨ Windsurf Command ⭐  *************/
  /**
   * Initializes the component by checking if a token exists in local storage.
   * If a token is found, it navigates the user to the home page.
   */

  /*******  b35fa45d-8fa0-4a6e-8add-72a65c1ccf7a  *******/
  ngOnInit(): void {
    const token = localStorage.getItem('token');
    if (token) {
      this.router.navigate(['/']);
    }
  }

  /**
   * Handles the login form submission.
   * Validates the input fields for email and password.
   * Initiates the login process via AuthService.
   * Displays appropriate snack bar messages based on login success or failure.
   * On successful login, stores the token in local storage and navigates to the home page.
   */

  onSubmit() {
    if (!this.email || !this.password) return;

    this.loading = true;
    this.authService.login(this.email, this.password).subscribe({
      next: (res) => {
        if (!res.token) {
          this.snackBar.open('❌ Invalid token received', 'Close', {
            duration: 3000,
          });
          this.loading = false;
          return;
        }

        localStorage.setItem('token', res.token);

        this.snackBar.open('✅ Login successful', 'Close', {
          duration: 2000,
          panelClass: ['snackbar-success'],
        });

        setTimeout(() => {
          this.router.navigate(['/']);
        }, 1000);
      },
      error: () => {
        this.loading = false;
        this.snackBar.open(
          '❌ Login failed. Check your credentials.',
          'Close',
          {
            duration: 3000,
            panelClass: ['snackbar-error'],
          }
        );
      },
    });
  }
}
