import { Injectable } from '@angular/core';
import { HttpClient, HttpParams } from '@angular/common/http';
import { Observable } from 'rxjs';
import {
  PublicResource,
  PublicResourcePage,
} from '../models/public-resource.model';
import { ActivatedRoute, Router } from '@angular/router';
import { Location } from '@angular/common';

@Injectable({ providedIn: 'root' })
export class PublicLearningResourceService {
  private api = '/api/public/resources';

  constructor(private http: HttpClient) {}

  getResources(
    search: string = '',
    tag: string = 'ALL',
    page: number = 0,
    size: number = 10
  ): Observable<PublicResourcePage> {
    let params = new HttpParams()
      .set('search', search)
      .set('tag', tag)
      .set('page', page)
      .set('size', size);
    return this.http.get<PublicResourcePage>(this.api, { params });
  }

  getResourceById(id: number): Observable<PublicResource> {
    return this.http.get<PublicResource>(`${this.api}/${id}`);
  }
}
