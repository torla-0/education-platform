import {
  Component,
  ElementRef,
  HostListener,
  OnDestroy,
  OnInit,
  ViewChild,
} from '@angular/core';
import { Router, RouterLink, RouterLinkActive } from '@angular/router';
import { MatToolbarModule } from '@angular/material/toolbar';
import { MatButtonModule } from '@angular/material/button';
import { AuthService } from '../../../core/services/auth.service';
import { CommonModule } from '@angular/common';
import { MatIconModule } from '@angular/material/icon';
import { MatMenuModule } from '@angular/material/menu';
import { MatSnackBar } from '@angular/material/snack-bar';
import { SessionService } from '../../../core/services/session.service';
import { Subscription } from 'rxjs';

@Component({
  selector: 'app-navbar',
  standalone: true,
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
})
export class NavbarComponent implements OnInit, OnDestroy {
  menuOpen = false;
  isAdmin = false;
  isModerator = false;
  private userSub: Subscription | null = null;

  @ViewChild('toggleBtn') toggleBtn!: ElementRef;

  constructor(
    public authService: AuthService,
    private router: Router,
    private snackBar: MatSnackBar,
    private sessionService: SessionService,
    private eRef: ElementRef
  ) {}

  ngOnInit() {
    this.userSub = this.sessionService.user$.subscribe((user) => {
      this.isAdmin = !!user?.roles?.includes('ADMIN');
      this.isModerator = !!user?.roles?.includes('MODERATOR');
    });
  }

  ngOnDestroy() {
    this.userSub?.unsubscribe();
  }

  toggleMenu() {
    this.menuOpen = !this.menuOpen;
  }

  closeMenu() {
    this.menuOpen = false;
  }

  logout() {
    this.authService.logout();
    this.snackBar.open('✅ Logged out successfully', 'Close', {
      duration: 3000,
      panelClass: ['snackbar-success'],
    });
    this.sessionService.refreshUser();
    this.router.navigate(['/']);
    this.menuOpen = false;
  }

  @HostListener('document:click', ['$event'])
  handleClickOutside(event: MouseEvent) {
    const target = event.target as HTMLElement;

    const clickedInside = this.eRef.nativeElement.contains(target);
    const clickedToggleBtn = this.toggleBtn?.nativeElement.contains(target);

    if (!clickedInside && !clickedToggleBtn) {
      this.menuOpen = false;
    }
  }

  @HostListener('document:keydown.escape', ['$event'])
  onEscapeKey(event: KeyboardEvent) {
    if (this.menuOpen) {
      this.menuOpen = false;
    }
  }
}
