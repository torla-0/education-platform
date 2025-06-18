import { Injectable } from '@angular/core';
import { HttpClient } from '@angular/common/http';
import { Observable } from 'rxjs';
import { Question, QuizTopic } from '../../core/models/quiz.model';

@Injectable({
  providedIn: 'root',
})
export class QuizService {
  private baseUrl = '/api';

  constructor(private http: HttpClient) {}

  getAllTopics(): Observable<QuizTopic[]> {
    return this.http.get<QuizTopic[]>(`${this.baseUrl}/topics`);
  }

  getQuestionsByTopicId(topicId: number): Observable<Question[]> {
    return this.http.get<Question[]>(`/api/topics/${topicId}/questions`);
  }
}
