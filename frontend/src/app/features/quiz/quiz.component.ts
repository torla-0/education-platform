import { Component, OnInit } from '@angular/core';
import { Router } from '@angular/router';
import { QuizService } from '../../core/services/quiz.service';
import { CommonModule } from '@angular/common';

interface Topic {
  id: number;
  name: string;
}

@Component({
  selector: 'app-quiz',
  standalone: true,
  imports: [CommonModule],
  templateUrl: './quiz.component.html',
  styleUrls: ['./quiz.component.css'],
})
export class QuizComponent implements OnInit {
  topics: Topic[] = [];

  constructor(private quizService: QuizService, private router: Router) {}

  ngOnInit() {
    this.quizService.getAllTopics().subscribe({
      next: (data) => (this.topics = data),
      error: (err) => console.error('Ne mogu dohvatiti teme:', err),
    });
  }

  startQuiz(topicId: number) {
    this.router.navigate(['/quiz', topicId]);
  }
}
