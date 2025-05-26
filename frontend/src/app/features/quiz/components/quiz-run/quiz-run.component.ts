import { Component, OnInit } from '@angular/core';
import { ActivatedRoute, Router } from '@angular/router';
import { CommonModule } from '@angular/common';
import { HttpClientModule } from '@angular/common/http';
import { QuizService } from '../../../../core/services/quiz.service';
import { Question, QuestionOption } from '../../../../core/models/quiz.model';

@Component({
  selector: 'app-quiz-run',
  standalone: true,
  imports: [CommonModule, HttpClientModule],
  templateUrl: './quiz-run.component.html',
  styleUrls: ['./quiz-run.component.css'],
})
export class QuizRunComponent implements OnInit {
  topicId!: number;
  questions: Question[] = [];
  currentIndex = 0;
  selectedAnswer: QuestionOption | null = null;
  quizCompleted = false;
  correctCount = 0;

  timer: number = 15;
  intervalId: any;
  totalTime: number = 15;

  quizFinished = false;
  correctAnswers = 0;

  constructor(
    private route: ActivatedRoute,
    private quizService: QuizService,
    private router: Router
  ) {}

  ngOnInit() {
    this.route.paramMap.subscribe((params) => {
      const id = params.get('id');
      if (id) {
        this.topicId = +id;
        this.loadQuestions();
      }
    });
  }

  loadQuestions() {
    this.quizService.getQuestionsByTopicId(this.topicId).subscribe({
      next: (data) => {
        const shuffledQuestions = this.shuffleArray(data);

        this.questions = shuffledQuestions.map((q) => ({
          ...q,
          options: this.shuffleArray(q.options),
        }));
      },
      error: (err) => console.error('Failed to load questions:', err),
    });

    this.startTimer();
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
