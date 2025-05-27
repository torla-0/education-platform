import { Component } from '@angular/core';
import { Router, RouterLink, RouterLinkActive } from '@angular/router';
import { MatToolbarModule } from '@angular/material/toolbar';
import { MatButtonModule } from '@angular/material/button';
import { AuthService } from '../../../core/services/auth.service';
import { CommonModule } from '@angular/common';
import { MatIconModule } from '@angular/material/icon';
import { MatMenuModule } from '@angular/material/menu';
import { MatSnackBar } from '@angular/material/snack-bar';
import { SessionService } from '../../../core/services/session.service';

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
  isAdmin: boolean | undefined = false;
  isModerator: boolean | undefined = false;

  constructor(
    public authService: AuthService,
    private router: Router,
    private snackBar: MatSnackBar,
    private sessionService: SessionService
  ) {}

  ngOnInit() {
    const user = this.sessionService.getUser();
    this.isAdmin = user?.roles?.includes('ADMIN');
    this.isModerator = user?.roles?.includes('MODERATOR');
  }
  toggleMenu() {
    this.menuOpen = !this.menuOpen;
  }

  logout() {
    this.authService.logout();
    this.snackBar.open('✅ Logged out successfully', 'Close', {
      duration: 3000,
      panelClass: ['snackbar-success'],
    });
  }
}
