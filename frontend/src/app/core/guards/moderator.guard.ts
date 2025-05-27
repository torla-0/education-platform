import { Injectable } from '@angular/core';
import { CanActivate, CanActivateFn, Router } from '@angular/router';
import { SessionService } from '../services/session.service';

@Injectable({ providedIn: 'root' })
export class ModeratorGuard implements CanActivate {
  constructor(private sessionService: SessionService, private router: Router) {}

  canActivate(): boolean {
    const user = this.sessionService.getUser();
    if (user && Array.isArray(user.roles) && user.roles.includes('MODERATOR')) {
      return true;
    } else {
      this.router.navigate(['/']);
      return false;
    }
  }
}

/*
canActivate(): boolean {
  const user = this.session.getUser();
  if (user && user.role === 'MODERATOR') return true;
  this.router.navigate(['/home']);
  return false;
}

*/
