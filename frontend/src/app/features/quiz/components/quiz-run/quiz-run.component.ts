import { Component, OnInit } from '@angular/core';
import { ActivatedRoute, Router } from '@angular/router';
import { CommonModule } from '@angular/common';

import { HttpClientModule } from '@angular/common/http';
import { QuizService } from '../../../../core/services/quiz.service';

interface Question {
  id: number;
  text: string;
  correctAnswer: string;
  options: string[];
  selectedAnswer?: string;
}

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
  selectedAnswer: string | null = null;
  quizCompleted = false;
  correctCount = 0;

  timer: number = 15;
  intervalId: any;
  totalTime: number = 15;

  quizFinished = false;
  correctAnswers = 0;

  isLastQuestion(): boolean {
    return this.currentIndex === this.questions.length - 1;
  }

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
        // shuffle options for each question
        this.questions = data.map((q) => ({
          ...q,
          options: this.shuffleArray(q.options),
        }));
      },
      error: (err) => console.error('Ne mogu učitati pitanja:', err),
    });
    this.startTimer();
  }

  get currentQuestion(): Question | null {
    return this.questions[this.currentIndex] || null;
  }

  selectAnswer(option: string) {
    this.selectedAnswer = option;
  }

  nextQuestion() {
    if (!this.currentQuestion) return;

    this.currentQuestion.selectedAnswer = this.selectedAnswer || undefined;
    if (this.selectedAnswer === this.currentQuestion.correctAnswer) {
      this.correctCount++;
    }

    this.selectedAnswer = null;
    this.currentIndex++;

    clearInterval(this.intervalId); // stop old timer

    if (this.currentIndex < this.questions.length) {
      this.startTimer();
    } else {
      this.quizCompleted = true;
      this.finishQuiz();
    }
  }

  finishQuiz() {
    this.quizFinished = true;
    this.correctAnswers = this.questions.filter(
      (q) => q.selectedAnswer === q.correctAnswer
    ).length;
  }

  getAccuracy(): number {
    return Math.round((this.correctCount / this.questions.length) * 100);
  }

  private shuffleArray(array: string[]): string[] {
    return array
      .map((value) => ({ value, sort: Math.random() }))
      .sort((a, b) => a.sort - b.sort)
      .map(({ value }) => value);
  }

  startTimer() {
    this.timer = 15;
    this.intervalId = setInterval(() => {
      this.timer--;
      if (this.timer === 0) {
        clearInterval(this.intervalId);
        this.nextQuestion(); // automatski idemo dalje ako nije izabrano
      }
    }, 1000);
  }

  get timerPercent(): number {
    return (this.timer / this.totalTime) * 100;
  }

  restartQuiz() {
    this.currentIndex = 0;
    this.selectedAnswer = null;
    this.correctCount = 0;
    this.quizCompleted = false;
    this.quizFinished = false;
    this.correctAnswers = 0;

    clearInterval(this.intervalId);

    this.loadQuestions(); // ⬅ reloads questions AND starts timer
  }

  backToTopics() {
    this.router.navigate(['/quiz']);
  }
}
