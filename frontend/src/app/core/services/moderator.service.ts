import { HttpClient } from '@angular/common/http';
import { Injectable } from '@angular/core';
import { CreateResource, Resource } from '../models/resource.model';
import { Observable } from 'rxjs';

@Injectable({ providedIn: 'root' })
export class ModeratorService {
  constructor(private http: HttpClient) {}

  listResources() {
    return this.http.get<Resource[]>('/api/moderator/resources');
  }
  createResource(r: CreateResource) {
    return this.http.post<Resource>('/api/moderator/resources', r);
  }
  updateResource(id: number, resource: CreateResource): Observable<Resource> {
    return this.http.put<Resource>(`/api/moderator/resources/${id}`, resource);
  }

  deleteResource(id: number): Observable<void> {
    return this.http.delete<void>(`/api/moderator/resources/${id}`);
  }
}
