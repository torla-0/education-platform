import { Component, OnInit } from '@angular/core';
import { Router } from '@angular/router';
import { QuizService } from '../quiz.service';
import { CommonModule } from '@angular/common';

interface Topic {
  id: number;
  name: string;
}

@Component({
  selector: 'app-quiz',
  standalone: true,
  imports: [CommonModule],
  templateUrl: './quiz-list.component.html',
  styleUrls: ['./quiz-list.component.css'],
})
export class QuizListComponent implements OnInit {
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
