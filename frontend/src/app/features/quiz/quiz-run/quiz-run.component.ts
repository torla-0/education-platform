import { Component, OnInit } from '@angular/core';
import { ActivatedRoute, Router } from '@angular/router';
import { CommonModule } from '@angular/common';
import { HttpClientModule } from '@angular/common/http';
import { Question, QuestionOption } from '../../../core/models/quiz.model';
import { QuizService } from '../quiz.service';

@Component({
  selector: 'app-quiz-run',
  standalone: true,
  imports: [CommonModule, HttpClientModule],
  templateUrl: './quiz-run.component.html',
  styleUrls: ['./quiz-run.component.css'],
})
export class QuizRunComponent implements OnInit {
  // Quiz metadata
  quizId!: number;
  questionCount = 10;

  // Quiz data
  questions: Question[] = [];
  currentIndex = 0;
  selectedAnswer: QuestionOption | null = null;

  // Quiz state
  quizCompleted = false;
  quizFinished = false;
  correctCount = 0;
  correctAnswers = 0;

  // Timer
  timer: number = 15;
  intervalId: any;
  totalTime: number = 15;

  // Loading & error state
  isLoading = false;
  loadError = '';

  constructor(
    private route: ActivatedRoute,
    private quizService: QuizService,
    private router: Router
  ) {}

  ngOnInit() {
    this.route.paramMap.subscribe((params) => {
      const id = params.get('id');
      if (id) {
        this.quizId = +id;

        // Optional query param: ?count=5
        this.route.queryParamMap.subscribe((queryParams) => {
          const count = queryParams.get('count');
          const parsedCount = parseInt(count || '', 10);
          if (!isNaN(parsedCount) && parsedCount > 0) {
            this.questionCount = parsedCount;
          }
          this.loadQuestions();
        });
      }
    });
  }

  loadQuestions() {
    this.isLoading = true;
    this.loadError = '';

    this.quizService
      .getQuestionsByQuizIdWithCount(this.quizId, this.questionCount)
      .subscribe({
        next: (data) => {
          // Fallback if backend returns fewer questions than requested
          const fallbackQuestions = data.slice(0, this.questionCount);

          this.questions = this.shuffleArray(fallbackQuestions).map((q) => ({
            ...q,
            options: this.shuffleArray(q.options),
          }));

          this.isLoading = false;
          this.startTimer();
        },
        error: (err) => {
          console.error('Failed to load questions:', err);
          this.loadError = 'Failed to load questions. Please try again later.';
          this.isLoading = false;
        },
      });
  }

  get currentQuestion(): Question | null {
    return this.questions[this.currentIndex] || null;
  }

  selectAnswer(option: QuestionOption) {
    this.selectedAnswer = option;
  }

  nextQuestion() {
    if (!this.currentQuestion) return;

    this.currentQuestion.selectedAnswer = this.selectedAnswer || undefined;

    if (this.selectedAnswer?.correct) {
      this.correctCount++;
    }

    this.selectedAnswer = null;
    this.currentIndex++;
    clearInterval(this.intervalId);

    if (this.currentIndex < this.questions.length) {
      this.startTimer();
    } else {
      this.quizCompleted = true;
      this.finishQuiz();
    }
  }

  finishQuiz() {
    this.quizFinished = true;
    this.correctAnswers = this.correctCount;
  }

  getAccuracy(): number {
    return Math.round((this.correctCount / this.questions.length) * 100);
  }

  getCorrectAnswerText(question: Question): string {
    const correct = question.options.find((opt) => opt.correct);
    return correct ? correct.text : 'N/A';
  }

  private shuffleArray<T>(array: T[]): T[] {
    return array
      .map((value) => ({ value, sort: Math.random() }))
      .sort((a, b) => a.sort - b.sort)
      .map(({ value }) => value);
  }

  startTimer() {
    this.timer = this.totalTime;
    this.intervalId = setInterval(() => {
      this.timer--;
      if (this.timer === 0) {
        clearInterval(this.intervalId);
        this.nextQuestion();
      }
    }, 1000);
  }

  get timerPercent(): number {
    return (this.timer / this.totalTime) * 100;
  }

  isLastQuestion(): boolean {
    return this.currentIndex === this.questions.length - 1;
  }

  restartQuiz() {
    this.currentIndex = 0;
    this.selectedAnswer = null;
    this.correctCount = 0;
    this.quizCompleted = false;
    this.quizFinished = false;
    this.correctAnswers = 0;

    clearInterval(this.intervalId);
    this.loadQuestions();
  }

  backToTopics() {
    this.router.navigate(['/quiz']);
  }
}
// This component handles running a quiz, displaying questions, tracking answers, and managing the quiz state.
// It includes a timer for each question and calculates the user's score at the end.
// It also provides functionality to restart the quiz or navigate back to the quiz list.
// It uses the QuizService to fetch questions and submit answers.
