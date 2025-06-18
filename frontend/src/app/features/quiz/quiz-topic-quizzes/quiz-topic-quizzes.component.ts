import { Component, OnInit } from '@angular/core';
import { ActivatedRoute, Router } from '@angular/router';
import { CommonModule } from '@angular/common';
import { QuizService } from '../quiz.service';
import { Quiz } from '../../../core/models/quiz.model';

@Component({
  selector: 'app-quiz-topic-quizzes',
  standalone: true,
  imports: [CommonModule],
  templateUrl: './quiz-topic-quizzes.component.html',
  styleUrls: ['./quiz-topic-quizzes.component.css'],
})
export class QuizTopicQuizzesComponent implements OnInit {
  quizzes: Quiz[] = [];
  topicId!: number;
  topicName = '';

  constructor(
    private route: ActivatedRoute,
    private quizService: QuizService,
    private router: Router
  ) {}

  ngOnInit(): void {
    this.topicId = +this.route.snapshot.paramMap.get('id')!;
    this.loadQuizzes();
  }

  loadQuizzes(): void {
    this.quizService.getQuizzesByTopicId(this.topicId).subscribe({
      next: (data) => {
        this.quizzes = data;
        if (data.length > 0) {
          this.topicName = data[0].topicName;
        }
      },
      error: (err) => console.error('Failed to fetch quizzes:', err),
    });
  }

  startQuiz(quizId: number) {
    this.router.navigate(['/quiz', quizId]);
  }
}
