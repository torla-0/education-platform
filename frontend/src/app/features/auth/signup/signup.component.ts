import { Component } from '@angular/core';
import { Router } from '@angular/router';

import { CommonModule } from '@angular/common';
import { FormsModule } from '@angular/forms';
import { AuthService } from '../../../core/services/auth.service';
import { MatCardModule } from '@angular/material/card';

@Component({
  standalone: true,
  selector: 'app-signup',
  imports: [CommonModule, FormsModule, MatCardModule],
  templateUrl: './signup.component.html',
})
export class SignupComponent {
  email = '';
  password = '';
  error: string | null = null;

  constructor(private authService: AuthService, private router: Router) {}

  onSignup() {
    this.authService.signup(this.email, this.password).subscribe({
      next: () => this.router.navigate(['/login']),
      error: () => (this.error = 'Email already in use'),
    });
  }
}
