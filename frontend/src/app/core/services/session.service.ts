import { Injectable } from '@angular/core';
import { jwtDecode } from 'jwt-decode';
import { BehaviorSubject } from 'rxjs';
interface JwtPayload {
  email: string;
  roles: string[];
  sub: string;
  exp: number;
  iat: number;
}
@Injectable({ providedIn: 'root' })
export class SessionService {
  private _reauthVerified = false;
  private tokenKey = 'token';

  private userSubject = new BehaviorSubject<JwtPayload | null>(
    this.getUserSync()
  );
  user$ = this.userSubject.asObservable();

  // Re auth
  isReauthVerified(): boolean {
    return this._reauthVerified;
  }

  setReauthVerified(value: boolean): void {
    this._reauthVerified = value;
  }

  reset(): void {
    this._reauthVerified = false;
  }

  // Token managment
  getToken(): string | null {
    return localStorage.getItem(this.tokenKey);
  }

  setToken(token: string): void {
    localStorage.setItem(this.tokenKey, token);
  }

  getUserSync(): JwtPayload | null {
    const token = this.getToken();
    if (!token) return null;
    try {
      return jwtDecode<JwtPayload>(token);
    } catch {
      return null;
    }
  }

  refreshUser() {
    this.userSubject.next(this.getUserSync());
  }
  getUser(): JwtPayload | null {
    const token = this.getToken();
    if (!token) return null;

    try {
      const decoded = jwtDecode<JwtPayload>(token);
      return decoded;
    } catch (err) {
      return null;
    }
  }
  clearToken(): void {
    localStorage.removeItem('token');
    this.refreshUser();
    this.reset();
  }

  getUserRoles(): string[] {
    const user = this.getUser();
    if (user && Array.isArray(user.roles)) return user.roles;
    if (user && typeof user.roles === 'string') return [user.roles];
    return [];
  }
}
