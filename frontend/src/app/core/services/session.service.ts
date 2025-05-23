import { Injectable } from '@angular/core';
import { jwtDecode } from 'jwt-decode';
interface JwtPayload {
  email: string;
  role: string;
  sub: string;
  exp: number;
  iat: number;
}
@Injectable({ providedIn: 'root' })
export class SessionService {
  private _reauthVerified = false;
  private tokenKey = 'token';

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

  getUser(): JwtPayload | null {
    const token = this.getToken();

    if (!token) return null;

    try {
      const decoded = jwtDecode<JwtPayload>(token);
      return decoded;
    } catch (err) {
      console.log('Invalid JWT', err);
      return null;
    }
  }
  clearToken(): void {
    localStorage.removeItem('token');
    this.reset();
  }
}
