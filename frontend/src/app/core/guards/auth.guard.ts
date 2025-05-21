import { Injectable } from '@angular/core';
import {
  CanActivate,
  Router,
  UrlTree,
  ActivatedRouteSnapshot,
  RouterStateSnapshot,
} from '@angular/router';
import { Observable } from 'rxjs';
import { MessageService } from '../services/message.service';

@Injectable({ providedIn: 'root' })
export class AuthGuard implements CanActivate {
  constructor(private router: Router, private messageService: MessageService) {}

  /**
   * CanActivate guard. If the user is not logged in, redirect to /login and
   * store the current URL in the returnUrl query parameter.
   *
   * @param route The ActivatedRouteSnapshot for the route being navigated to.
   * @param state The RouterStateSnapshot for the route being navigated to.
   *
   * @returns A UrlTree if the user is not logged in, otherwise true.
   */
  canActivate(
    route: ActivatedRouteSnapshot,
    state: RouterStateSnapshot
  ): boolean | UrlTree {
    const token = localStorage.getItem('token');

    if (!token) {
      this.messageService.setMessage(
        '❌ You must be logged in to access that page.'
      );
      return this.router.createUrlTree(['/login'], {
        queryParams: { returnUrl: state.url },
      });
    }

    return true;
  }
}
