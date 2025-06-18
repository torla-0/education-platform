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
   * Retrieve all published quizzes.
   *
   * @return an observable emitting a list of published quizzes
   */

  getAllPublishedQuizzes(): Observable<Quiz[]> {
    return this.http.get<Quiz[]>(`${this.baseUrl}/quizzes`);
  }

  /**
   * Get all published quizzes under a given topic.
   */
  getQuizzesByTopicId(topicId: number): Observable<Quiz[]> {
    return this.http.get<Quiz[]>(`${this.baseUrl}/topics/${topicId}/quizzes`);
  }

  /**
   * Get a list of random questions for a given quiz, up to the given count.
   * @param quizId the ID of the quiz
   * @param count the number of questions to return
   * @return list of question DTOs
   */
  getQuestionsByQuizIdWithCount(
    quizId: number,
    count: number
  ): Observable<Question[]> {
    return this.http.get<Question[]>(
      `/api/quizzes/${quizId}/questions?count=${count}`
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
