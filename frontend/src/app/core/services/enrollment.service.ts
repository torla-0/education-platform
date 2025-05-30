import { Injectable } from '@angular/core';
import { HttpClient } from '@angular/common/http';
import { Observable } from 'rxjs';

@Injectable({ providedIn: 'root' })
export class EnrollmentService {
  constructor(private http: HttpClient) {}

  isEnrolled(resourceId: number): Observable<boolean> {
    return this.http.get<boolean>(
      `/api/enrollments/check?resourceId=${resourceId}`
    );
  }

  enroll(resourceId: number): Observable<any> {
    return this.http.post(`/api/enrollments/enroll`, { resourceId });
  }
}
