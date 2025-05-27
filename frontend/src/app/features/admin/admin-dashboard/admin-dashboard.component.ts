import { Component } from '@angular/core';
import { CommonModule } from '@angular/common';
import { RouterOutlet } from '@angular/router';
import { SidebarLink } from '../../../core/models/sidebar-link.model';
import { SidebarComponent } from '../../../shared/sidebar/sidebar.component';

const adminLinks: SidebarLink[] = [
  { icon: '👥', label: 'User Management', route: '/admin/users' },
  { icon: '📝', label: 'Quiz Topics', route: '/admin/quizzes' },
  { icon: '⚙️', label: 'Settings', route: '/admin/settings' },
];

@Component({
  selector: 'app-admin-dashboard',
  standalone: true,
  imports: [SidebarComponent, RouterOutlet],
  templateUrl: './admin-dashboard.component.html',
  styleUrls: ['./admin-dashboard.component.css'],
})
export class AdminDashboardComponent {
  links = adminLinks;
}
