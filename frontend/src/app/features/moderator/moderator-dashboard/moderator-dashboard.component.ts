import { Component } from '@angular/core';
import { Router, RouterOutlet } from '@angular/router';
import { SidebarLink } from '../../../core/models/sidebar-link.model';
import { SidebarComponent } from '../../../shared/sidebar/sidebar.component';
import { AddLearningResourceComponent } from '../../learning-resources/add-learning-resource/add-learning-resource.component';

import { ShowAllResourcesComponent } from '../../learning-resources/show-all-resources/show-all-resources.component';

const moderatorLinks: SidebarLink[] = [
  {
    icon: '📝',
    label: 'Review Questions',
    route: '/moderator/review-questions',
  },
  { icon: '🚩', label: 'User Reports', route: '/moderator/user-reports' },
  { icon: '👤', label: 'Profile', route: '/moderator/profile' },
];
@Component({
  selector: 'app-moderator-dashboard',
  standalone: true,
  imports: [RouterOutlet, SidebarComponent],
  templateUrl: './moderator-dashboard.component.html',
  styleUrl: './moderator-dashboard.component.css',
})
export class ModeratorDashboardComponent {
  // Sidebar links for the moderator dashboard
  links = [
    {
      icon: '👤',
      label: 'Profile',
      route: '/moderator/profile',
    },
    {
      icon: '📖',
      label: 'Learning Resources',
      route: '/moderator/learning-resources',
    },
    {
      icon: '📚',
      label: 'Quizzes',
      route: '/moderator/quizzes',
    },

    {
      icon: '📰',
      label: 'Blog',
      route: '/moderator/blog',
    },
    {
      icon: '📝',
      label: 'Review Questions',
      route: '/moderator/review-questions',
    },
    {
      icon: '🚩',
      label: 'User Reports',
      route: '/moderator/user-reports',
    },
  ];
}
