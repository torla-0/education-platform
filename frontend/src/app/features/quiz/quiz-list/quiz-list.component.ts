import { Component, OnInit } from '@angular/core';
import { Router } from '@angular/router';
import { QuizService } from '../quiz.service';
import { CommonModule } from '@angular/common';
import { FormsModule } from '@angular/forms';
import { Quiz, QuizTopic } from '../../../core/models/quiz.model';

@Component({
  selector: 'app-quiz-list',
  standalone: true,
  imports: [CommonModule, FormsModule],
  templateUrl: './quiz-list.component.html',
  styleUrls: ['./quiz-list.component.css'],
})
export class QuizListComponent implements OnInit {
  // Topics
  topics: QuizTopic[] = [];
  filteredTopics: QuizTopic[] = [];
  searchTerm = '';

  // Quizzes
  allQuizzes: Quiz[] = [];
  filteredQuizzes: Quiz[] = [];
  quizSearchTerm = '';

  // Selection
  selectedQuiz: Quiz | null = null;
  selectedCount: number = 10;

  constructor(private quizService: QuizService, private router: Router) {}

  ngOnInit(): void {
    this.loadTopics();
    this.loadAllQuizzes();
  }

  // Load all topics
  loadTopics(): void {
    this.quizService.getAllTopics().subscribe({
      next: (data) => {
        this.topics = data;
        this.filteredTopics = data;
      },
      error: (err) => console.error('Failed to load topics:', err),
    });
  }

  // Load all quizzes across topics
  loadAllQuizzes(): void {
    // This assumes your backend returns all published quizzes; adjust as needed
    this.quizService.getAllPublishedQuizzes().subscribe({
      next: (data) => {
        this.allQuizzes = data.filter((q) => q.published);
        this.filteredQuizzes = [...this.allQuizzes];
      },
      error: (err) => console.error('Failed to load quizzes:', err),
    });
  }

  applyFilter(): void {
    const term = this.searchTerm.trim().toLowerCase();
    this.filteredTopics = this.topics.filter((t) =>
      t.name.toLowerCase().includes(term)
    );
  }

  applyQuizFilter(): void {
    const term = this.quizSearchTerm.trim().toLowerCase();
    this.filteredQuizzes = this.allQuizzes.filter(
      (q) =>
        q.title.toLowerCase().includes(term) ||
        q.topicName.toLowerCase().includes(term)
    );
  }

  goToTopic(topicId: number): void {
    this.router.navigate(['/quiz/topic', topicId]);
  }

  selectQuiz(quiz: Quiz): void {
    this.selectedQuiz = quiz;
    this.selectedCount = 10;
  }

  startQuizWithCount(): void {
    if (!this.selectedQuiz) return;
    this.router.navigate([`/quiz`, this.selectedQuiz.id], {
      queryParams: { count: this.selectedCount },
    });
  }
}
// This component lists all quiz topics and allows users to filter and select quizzes.
// It also provides functionality to start a quiz with a specified number of questions.
// The component uses the QuizService to fetch topics and quizzes, and it allows users to navigate to a quiz run page with selected parameters.
// The component also includes search functionality for both topics and quizzes.
// It uses QuizService to fetch data from the backend.
