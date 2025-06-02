import { HttpClient } from '@angular/common/http';
import { Injectable } from '@angular/core';
import { Observable } from 'rxjs';
import {
  SectionBookmarkDto,
  SectionComment,
  SectionLikeDto,
  SectionNoteDto,
} from '../model/section.model';

@Injectable({ providedIn: 'root' })
export class SectionService {
  private baseUrl = '/api/sections'; // Adjust to your actual backend API

  constructor(private http: HttpClient) {}

  getSectionById(sectionId: number) {
    return this.http.get<any>(`${this.baseUrl}/${sectionId}`);
  }

  getSectionStatus(sectionId: number) {
    return this.http.get<any>(`${this.baseUrl}/${sectionId}/status`);
  }

  toggleLike(sectionId: number) {
    return this.http.post<any>(`${this.baseUrl}/${sectionId}/like/toggle`, {});
  }

  toggleBookmark(sectionId: number) {
    return this.http.post<any>(
      `${this.baseUrl}/${sectionId}/bookmark/toggle`,
      {}
    );
  }

  getNote(sectionId: number) {
    return this.http.get<any>(`${this.baseUrl}/${sectionId}/note`);
  }

  saveNote(sectionId: number, note: string) {
    return this.http.post<any>(`${this.baseUrl}/${sectionId}/note`, { note });
  }

  getComments(sectionId: number) {
    return this.http.get<any[]>(`${this.baseUrl}/${sectionId}/comments`);
  }

  addComment(sectionId: number, comment: string) {
    return this.http.post<any>(`${this.baseUrl}/${sectionId}/comments`, {
      content: comment,
    });
  }
}
