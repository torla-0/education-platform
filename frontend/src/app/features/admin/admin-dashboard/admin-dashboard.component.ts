import { Component, OnInit } from '@angular/core';

import { MatSnackBar } from '@angular/material/snack-bar';
import { AdminService, UserDto } from '../../../core/services/admin.service';

import { CommonModule } from '@angular/common';
import { MatTableModule } from '@angular/material/table';
import { MatButtonModule } from '@angular/material/button';
import { MatSnackBarModule } from '@angular/material/snack-bar';
import { RouterOutlet } from '@angular/router';
import { MatTableDataSource } from '@angular/material/table';
import { ToastService } from '../../../core/services/toast.service';
import { MatPaginator } from '@angular/material/paginator';
import { MatSort } from '@angular/material/sort';
import { ViewChild } from '@angular/core';
import { MatFormFieldModule } from '@angular/material/form-field';
import { MatInputModule } from '@angular/material/input';

@Component({
  selector: 'app-admin-dashboard',
  standalone: true,
  imports: [
    CommonModule,
    MatTableModule,
    MatButtonModule,
    MatSnackBarModule,
    MatPaginator,
    MatSort,
    MatFormFieldModule,
    MatInputModule,
  ],
  templateUrl: './admin-dashboard.component.html',
  styleUrls: ['./admin-dashboard.component.css'],
})
export class AdminDashboardComponent implements OnInit {
  users: UserDto[] = [];
  dataSource = new MatTableDataSource<UserDto>();
  displayedColumns: string[] = ['username', 'email', 'role', 'actions'];

  @ViewChild(MatPaginator) paginator!: MatPaginator;
  @ViewChild(MatSort) sort!: MatSort;

  constructor(
    private adminService: AdminService,
    private toast: ToastService
  ) {}

  ngOnInit(): void {
    this.adminService.getAllUsers().subscribe({
      next: (data) => (this.dataSource.data = data),
      error: () => this.toast.showError('Failed to load users'),
    });
  }

  applyFilter(event: Event) {
    const filterValue = (event.target as HTMLInputElement).value;
    this.dataSource.filter = filterValue.trim().toLowerCase();
  }

  ngAfterViewInit() {
    this.dataSource.paginator = this.paginator;
    this.dataSource.sort = this.sort;

    // Filtering
    this.dataSource.filterPredicate = (data: UserDto, filter: string) => {
      return (
        data.email.toLowerCase().includes(filter) ||
        data.username.toLowerCase().includes(filter)
      );
    };
  }

  promote(userId: number) {
    this.adminService.promoteToModerator(userId).subscribe({
      next: () => {
        this.toast.showSuccess('User promoted!');
        this.adminService.getAllUsers().subscribe({
          next: (data) => (this.dataSource.data = data),
        });
      },
      error: () => this.toast.showError('Promotion failed'),
    });
  }
}
