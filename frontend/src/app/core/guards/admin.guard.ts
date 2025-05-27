import { Injectable } from '@angular/core';
import {
  ActivatedRouteSnapshot,
  CanActivate,
  CanActivateFn,
  GuardResult,
  MaybeAsync,
  Router,
  RouterStateSnapshot,
} from '@angular/router';
import { SessionService } from '../services/session.service';

@Injectable({
  providedIn: 'root',
})
export class AdminGuard implements CanActivate {
  constructor(private sessionService: SessionService, private router: Router) {}
  canActivate(): boolean {
    const user = this.sessionService.getUser();

    if (user && Array.isArray(user.roles) && user.roles.includes('ADMIN')) {
      return true;
    } else {
      this.router.navigate(['/']);
      return false;
    }
  }
}
