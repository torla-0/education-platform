import { Component, Input } from '@angular/core';
import { Router, RouterModule } from '@angular/router';
import { CommonModule } from '@angular/common';
import { SidebarLink } from '../../core/models/sidebar-link.model';

@Component({
  selector: 'app-sidebar',
  standalone: true,
  imports: [CommonModule, RouterModule],
  templateUrl: './sidebar.component.html',
  styleUrls: ['./sidebar.component.css'],
})
export class SidebarComponent {
  @Input() links: SidebarLink[] = [];
  collapsed = false;
  constructor(private router: Router) {}
  toggleSidebar() {
    this.collapsed = !this.collapsed;
  }
  isActive(route: string) {
    return this.router.url.startsWith(route);
  }
}
