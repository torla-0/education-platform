import { HttpClient } from '@angular/common/http';
import { Injectable } from '@angular/core';
import { Observable } from 'rxjs';
import {
  SectionBookmarkDto,
  SectionComment,
  SectionLikeDto,
  SectionNoteDto,
  SectionDto,
  UpdateSectionDto,
} from '../model/section.model';

@Injectable({ providedIn: 'root' })
export class SectionService {
  private baseUrl = '/api/sections';
  private moderatorBaseUrl = '/api/mod/sections';

  constructor(private http: HttpClient) {}

  getSectionById(sectionId: number) {
    return this.http.get<SectionDto>(`${this.baseUrl}/${sectionId}`);
  }

  getSectionStatus(sectionId: number) {
    return this.http.get<any>(`${this.baseUrl}/${sectionId}/status`);
  }

  toggleLike(sectionId: number) {
    return this.http.post<SectionLikeDto>(
      `${this.baseUrl}/${sectionId}/like/toggle`,
      {}
    );
  }

  toggleBookmark(sectionId: number) {
    return this.http.post<SectionBookmarkDto>(
      `${this.baseUrl}/${sectionId}/bookmark/toggle`,
      {}
    );
  }

  getNote(sectionId: number) {
    return this.http.get<SectionNoteDto>(`${this.baseUrl}/${sectionId}/note`);
  }

  saveNote(sectionId: number, content: string) {
    return this.http.post<any>(`${this.baseUrl}/${sectionId}/note`, {
      content,
    });
  }

  getComments(sectionId: number) {
    return this.http.get<SectionComment[]>(
      `${this.baseUrl}/${sectionId}/comments`
    );
  }

  addComment(sectionId: number, comment: string) {
    return this.http.post<any>(`${this.baseUrl}/${sectionId}/comments`, {
      content: comment,
    });
  }

  moveSectionUp(sectionId: number) {
    return this.http.post<void>(
      `${this.moderatorBaseUrl}/${sectionId}/move-up`,
      {}
    );
  }

  moveSectionDown(sectionId: number) {
    return this.http.post<void>(
      `${this.moderatorBaseUrl}/${sectionId}/move-down`,
      {}
    );
  }

  publishSection(sectionId: number) {
    return this.http.post<void>(
      `${this.moderatorBaseUrl}/${sectionId}/publish`,
      {}
    );
  }

  unpublishSection(sectionId: number) {
    return this.http.post<void>(
      `${this.moderatorBaseUrl}/${sectionId}/unpublish`,
      {}
    );
  }

  deleteSection(sectionId: number) {
    return this.http.delete<void>(`${this.moderatorBaseUrl}/${sectionId}`);
  }

  updateSection(sectionId: number, data: UpdateSectionDto) {
    return this.http.put<SectionDto>(
      `${this.moderatorBaseUrl}/${sectionId}`,
      data
    );
  }
}
