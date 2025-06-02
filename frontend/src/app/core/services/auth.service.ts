import { Injectable } from '@angular/core';
import { HttpClient } from '@angular/common/http';
import { Router } from '@angular/router';
import { Observable } from 'rxjs';
import { SessionService } from './session.service';
import { getEmailFromToken } from '../utils/token.utils';
import { jwtDecode } from 'jwt-decode';

interface LoginResponse {
  token: string;
}
interface SignupResponse {
  message: string;
}

interface SignupRequest {
  email: string;
  password: string;
  username: string;
  firstName: string;
  lastName: string;
}

@Injectable({
  providedIn: 'root',
})
export class AuthService {
  private apiUrl = '/api/auth';

  constructor(
    private http: HttpClient,
    private session: SessionService,
    private router: Router
  ) {}

  login(email: string, password: string) {
    return this.http.post<LoginResponse>(`${this.apiUrl}/login`, {
      email,
      password,
    });
  }

  signup(data: SignupRequest): Observable<SignupResponse> {
    return this.http.post<SignupResponse>(`${this.apiUrl}/register`, data);
  }

  logout(): void {
    this.session.clearToken();
    this.router.navigate(['/login']);
  }

  isLoggedIn(): boolean {
    return !!localStorage.getItem('token');
  }

  getCurrentUserEmail(): string | null {
    const token = localStorage.getItem('token');
    if (!token) return null;
    return getEmailFromToken(token);
  }

  get user() {
    const token = localStorage.getItem('token');
    if (!token) return null;
    try {
      return jwtDecode<any>(token);
    } catch {
      return null;
    }
  }
  hasRole(role: string): boolean {
    const user = this.user;
    if (!user?.roles) return false;
    return user.roles.includes(role);
  }

  getUserRoles(): string[] {
    const user = this.user;
    if (!user?.roles) return [];
    return user.roles;
  }
}
