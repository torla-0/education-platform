import { Injectable } from '@angular/core';
import { HttpClient } from '@angular/common/http';
import { Observable } from 'rxjs';
import {
  CreateQuiz,
  Question,
  Quiz,
  QuizTopic,
  UpdateQuiz,
} from '../../core/models/quiz.model';

@Injectable({
  providedIn: 'root',
})
export class QuizService {
  private readonly baseUrl = '/api';

  constructor(private http: HttpClient) {}

  // ===== PUBLIC ENDPOINTS =====

  /**
   * Get all available quiz topics.
   */
  getAllTopics(): Observable<QuizTopic[]> {
    return this.http.get<QuizTopic[]>(`${this.baseUrl}/topics`);
  }

  /**
   * Get all published quizzes under a given topic.
   */
  getQuizzesByTopicId(topicId: number): Observable<Quiz[]> {
    return this.http.get<Quiz[]>(`${this.baseUrl}/topics/${topicId}/quizzes`);
  }

  /**
   * Get all questions for a quiz by quizId.
   */
  getQuestionsByQuizId(quizId: number): Observable<Question[]> {
    return this.http.get<Question[]>(
      `${this.baseUrl}/quizzes/${quizId}/questions`
    );
  }

  // ===== MODERATOR ENDPOINTS =====

  /**
   * Get all quizzes for moderators (with full access, regardless of published state).
   */
  getAllModeratorQuizzes(): Observable<Quiz[]> {
    return this.http.get<Quiz[]>(`${this.baseUrl}/moderator/quizzes`);
  }

  /**
   * Create a new quiz (moderator only).
   */
  createQuiz(dto: CreateQuiz): Observable<Quiz> {
    return this.http.post<Quiz>(`${this.baseUrl}/moderator/quizzes`, dto);
  }

  /**
   * Update an existing quiz (moderator only).
   */
  updateQuiz(id: number, dto: UpdateQuiz): Observable<Quiz> {
    return this.http.put<Quiz>(`${this.baseUrl}/moderator/quizzes/${id}`, dto);
  }

  /**
   * Delete a quiz (moderator only).
   */
  deleteQuiz(id: number): Observable<void> {
    return this.http.delete<void>(`${this.baseUrl}/moderator/quizzes/${id}`);
  }
}
