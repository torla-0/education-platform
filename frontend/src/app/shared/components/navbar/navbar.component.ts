import { Component } from '@angular/core';
import { Router, RouterLink, RouterLinkActive } from '@angular/router';
import { MatToolbarModule } from '@angular/material/toolbar';
import { MatButtonModule } from '@angular/material/button';
import { AuthService } from '../../../core/services/auth.service';
import { CommonModule } from '@angular/common';
import { MatIconModule } from '@angular/material/icon';
import { MatMenuModule } from '@angular/material/menu';
import { MatSnackBar } from '@angular/material/snack-bar';

@Component({
  selector: 'app-navbar',
  imports: [
    RouterLink,
    RouterLinkActive,
    MatToolbarModule,
    CommonModule,
    MatIconModule,
    MatButtonModule,
    MatMenuModule,
  ],
  templateUrl: './navbar.component.html',
  styleUrls: ['./navbar.component.css'],
  standalone: true,
})
export class NavbarComponent {
  menuOpen = false;

  constructor(
    public authService: AuthService,
    private router: Router,
    private snackBar: MatSnackBar
  ) {}
  /*************  ✨ Windsurf Command ⭐  *************/
  /**
   * Toggles the hamburger menu on or off.
   *
   * Should be called when the user clicks on the hamburger menu icon.
/*******  1ab86eda-73c9-4368-b4b9-0fad61de71ea  *******/
  toggleMenu() {
    this.menuOpen = !this.menuOpen;
  }

  logout() {
    this.authService.logout();
    this.snackBar.open('✅ Logged out successfully', 'Close', {
      duration: 3000,
      panelClass: ['snackbar-success'],
    });
    this.router.navigate(['/login']);
  }
}
