import { Injectable } from '@angular/core';
import { CanActivate, CanActivateFn, Router } from '@angular/router';
import { SessionService } from '../services/session.service';

@Injectable({ providedIn: 'root' })
export class ModeratorGuard implements CanActivate {
  constructor(private sessionService: SessionService, private router: Router) {}

  canActivate(): boolean {
    const user = this.sessionService.getUser();
    if (user && Array.isArray(user.roles) && user.roles.includes('MODERATOR')) {
      console.log('ModeratorGuard: User is a moderator', user);
      return true;
    } else {
      this.router.navigate(['/']);
      return false;
    }
  }
}
