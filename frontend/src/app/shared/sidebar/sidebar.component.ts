import { Component, Input, OnDestroy, OnInit } from '@angular/core';
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
export class SidebarComponent implements OnInit, OnDestroy {
  @Input() links: SidebarLink[] = [];
  collapsed = false;
  private mobileWidth = 1000;

  constructor(private router: Router) {}

  ngOnInit() {
    this.updateSidebarState();
    window.addEventListener('resize', this.updateSidebarState);
  }

  ngOnDestroy() {
    window.removeEventListener('resize', this.updateSidebarState);
  }

  // Use an arrow function to retain 'this'
  updateSidebarState = () => {
    if (window.innerWidth <= this.mobileWidth) {
      this.collapsed = true;
    } else {
      this.collapsed = false;
    }
  };

  toggleSidebar() {
    this.collapsed = !this.collapsed;
  }

  isActive(route: string) {
    return this.router.url.startsWith(route);
  }
}
