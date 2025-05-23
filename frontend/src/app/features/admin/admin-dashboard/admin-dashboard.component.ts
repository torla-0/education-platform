import { Component, OnInit } from '@angular/core';

import { MatSnackBar } from '@angular/material/snack-bar';
import { AdminService, UserDto } from '../../../core/services/admin.service';

import { CommonModule } from '@angular/common';
import { MatTableModule } from '@angular/material/table';
import { MatButtonModule } from '@angular/material/button';
import { MatSnackBarModule } from '@angular/material/snack-bar';
import { RouterOutlet } from '@angular/router';

@Component({
  selector: 'app-admin-dashboard',
  standalone: true,
  imports: [CommonModule, MatTableModule, MatButtonModule, MatSnackBarModule],
  templateUrl: './admin-dashboard.component.html',
  styleUrls: ['./admin-dashboard.component.css'],
})
export class AdminDashboardComponent implements OnInit {
  users: UserDto[] = [];

  constructor(
    private adminService: AdminService,
    private snackBar: MatSnackBar
  ) {}

  ngOnInit(): void {
    this.loadUsers();
  }

  loadUsers() {
    this.adminService.getAllUsers().subscribe({
      next: (data) => (this.users = data),
      error: () =>
        this.snackBar.open('Failed to load users', 'OK', { duration: 3000 }),
    });
  }

  promote(userId: number) {
    this.adminService.promoteToModerator(userId).subscribe({
      next: () => {
        this.snackBar.open('User promoted!', 'OK', { duration: 3000 });
        this.loadUsers();
      },
      error: () =>
        this.snackBar.open('Promotion failed', 'OK', { duration: 3000 }),
    });
  }
}
