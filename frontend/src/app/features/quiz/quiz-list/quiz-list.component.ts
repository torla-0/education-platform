import { Component, OnInit } from '@angular/core';
import { Router } from '@angular/router';
import { QuizService } from '../quiz.service';
import { CommonModule } from '@angular/common';
import { FormsModule } from '@angular/forms';
import { QuizTopic } from '../../../core/models/quiz.model';

interface Topic {
  id: number;
  name: string;
}

@Component({
  selector: 'app-quiz-list',
  standalone: true,
  imports: [CommonModule, FormsModule],
  templateUrl: './quiz-list.component.html',
  styleUrls: ['./quiz-list.component.css'],
})
export class QuizListComponent implements OnInit {
  topics: QuizTopic[] = [];
  filteredTopics: QuizTopic[] = [];
  searchTerm = '';

  constructor(private quizService: QuizService, private router: Router) {}

  ngOnInit() {
    this.quizService.getAllTopics().subscribe({
      next: (data) => {
        this.topics = data;
        this.filteredTopics = data;
      },
      error: (err) => console.error('Failed to load topics:', err),
    });
  }

  applyFilter() {
    const term = this.searchTerm.toLowerCase().trim();
    this.filteredTopics = this.topics.filter((t) =>
      t.name.toLowerCase().includes(term)
    );
  }

  goToTopic(topicId: number) {
    this.router.navigate(['/quiz', topicId]);
  }
}
