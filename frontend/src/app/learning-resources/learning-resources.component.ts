import { CommonModule } from '@angular/common';
import { Component } from '@angular/core';

@Component({
  selector: 'app-learning-resources',
  imports: [CommonModule],
  templateUrl: './learning-resources.component.html',
  styleUrl: './learning-resources.component.css',
})
export class LearningResourcesComponent {
  courses = [
    {
      id: 1,
      title: 'HTML & CSS',
      description: 'Nauči osnove web dizajna.',
      image: 'assets/images/html-course.jpg',
    },
    {
      id: 2,
      title: 'JavaScript',
      description: 'Interaktivnost na web stranicama.',
      image: 'assets/images/js-course.jpg',
    },
    {
      id: 3,
      title: 'Angular',
      description: 'Moderna frontend aplikacija.',
      image: 'assets/images/angular-course.jpg',
    },
  ];
}
