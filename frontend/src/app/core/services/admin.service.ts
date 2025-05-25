import { Injectable } from '@angular/core';
import { HttpClient } from '@angular/common/http';
import { Observable } from 'rxjs';

export interface UserDto {
  id: number;
  email: string;
  role: string;
  firstName: string;
  lastName: string;
  username: string;
}

@Injectable({
  providedIn: 'root',
})
export class AdminService {
  private baseUrl = '/api/admin';

  constructor(private http: HttpClient) {}

  getAllUsers(): Observable<UserDto[]> {
    return this.http.get<UserDto[]>(`${this.baseUrl}/users`);
  }

  promoteToModerator(userId: number): Observable<any> {
    return this.http.post(`${this.baseUrl}/promote/${userId}`, {});
  }

  demoteUser(userId: number): Observable<any> {
    return this.http.post('/api/admin/demote', { id: userId });
  }
}
