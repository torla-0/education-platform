import { Injectable } from '@angular/core';
import { HttpClient } from '@angular/common/http';
import { Observable } from 'rxjs';
import { User } from '../models/User';

@Injectable({
  providedIn: 'root',
})
export class UserService {
  private baseUrl = '/api/users';

  constructor(private http: HttpClient) {}

  getProfile(): Observable<User> {
    return this.http.get<User>(`${this.baseUrl}/me`);
  }

  updateProfile(data: any) {
    return this.http.put('/api/users/me', data);
  }

  changePassword(payload: { currentPassword: string; newPassword: string }) {
    return this.http.put('/api/users/me/password', payload);
  }
}
