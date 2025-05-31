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
  constructor(private http: HttpClient) {}

  // Comments
  getComments(sectionId: number): Observable<SectionComment[]> {
    return this.http.get<SectionComment[]>(
      `/api/sections/${sectionId}/comments`
    );
  }
  addComment(sectionId: number, content: string): Observable<SectionComment> {
    return this.http.post<SectionComment>(
      `/api/sections/${sectionId}/comments`,
      JSON.stringify(content),
      {
        headers: { 'Content-Type': 'application/json' },
      }
    );
  }

  // Likes
  getLikeStatus(sectionId: number): Observable<SectionLikeDto> {
    return this.http.get<SectionLikeDto>(`/api/sections/${sectionId}/like`);
  }
  toggleLike(sectionId: number): Observable<void> {
    return this.http.post<void>(`/api/sections/${sectionId}/like/toggle`, {});
  }

  // Bookmarks
  getBookmarkStatus(sectionId: number): Observable<SectionBookmarkDto> {
    return this.http.get<SectionBookmarkDto>(
      `/api/sections/${sectionId}/bookmark`
    );
  }
  toggleBookmark(sectionId: number): Observable<void> {
    return this.http.post<void>(
      `/api/sections/${sectionId}/bookmark/toggle`,
      {}
    );
  }

  // Notes
  getNote(sectionId: number): Observable<SectionNoteDto> {
    return this.http.get<SectionNoteDto>(`/api/sections/${sectionId}/note`);
  }
  saveNote(sectionId: number, noteContent: string): Observable<SectionNoteDto> {
    return this.http.post<SectionNoteDto>(
      `/api/sections/${sectionId}/note`,
      JSON.stringify(noteContent),
      {
        headers: { 'Content-Type': 'application/json' },
      }
    );
  }

  getSectionById(id: number): Observable<any> {
    return this.http.get(`/api/sections/${id}`);
  }
}
