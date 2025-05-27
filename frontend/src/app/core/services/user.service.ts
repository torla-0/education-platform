import { Injectable } from '@angular/core';
import { HttpClient } from '@angular/common/http';
import { Observable } from 'rxjs';
import { User } from '../models/user.model';
import { AuthService } from './auth.service';

@Injectable({
  providedIn: 'root',
})
export class UserService {
  private baseUrl = '/api/users';

  constructor(private http: HttpClient, private authService: AuthService) {}

  getProfile(): Observable<User> {
    return this.http.get<User>(`${this.baseUrl}/me`);
  }

  updateProfile(data: any) {
    return this.http.put('/api/users/me', data);
  }

  changePassword(payload: { currentPassword: string; newPassword: string }) {
    return this.http.put('/api/users/me/password', payload);
  }

  requestAccountDeletion(password: string) {
    return this.http.post<{ message: string }>('/api/users/request-deletion', {
      password,
    });
  }

  cancelAccountDeletion(): Observable<User> {
    return this.http.post<User>('/api/users/cancel-deletion', {});
  }
}
