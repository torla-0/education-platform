import { Component, OnInit } from '@angular/core';
import { CommonModule } from '@angular/common';
import { AdminService, UserDto } from '../../../core/services/admin.service';
import { ToastService } from '../../../core/services/toast.service';

@Component({
  selector: 'app-admin-dashboard',
  standalone: true,
  imports: [CommonModule],
  templateUrl: './admin-dashboard.component.html',
  styleUrls: ['./admin-dashboard.component.css'],
})
export class AdminDashboardComponent implements OnInit {
  users: UserDto[] = [];
  filteredUsers: UserDto[] = [];
  paginatedUsers: UserDto[] = [];

  displayedColumns: string[] = ['email', 'role', 'action'];

  currentSearch = '';
  currentRoleFilter = 'ALL';

  currentPage = 1;
  itemsPerPage = 5;
  totalPages = 1;

  constructor(
    private adminService: AdminService,
    private toast: ToastService
  ) {}

  ngOnInit(): void {
    this.adminService.getAllUsers().subscribe({
      next: (data) => {
        this.users = data;
        this.applyFilters();
      },
      error: () => this.toast.showError('Failed to load users'),
    });
  }

  applyFilter(event: Event) {
    this.currentSearch = (event.target as HTMLInputElement).value
      .trim()
      .toLowerCase();
    this.applyFilters();
  }

  filterByRole(role: string) {
    this.currentRoleFilter = role;
    this.applyFilters();
  }

  applyFilters() {
    this.currentPage = 1;
    this.filteredUsers = this.users.filter((user) => {
      const matchesSearch =
        user.email.toLowerCase().includes(this.currentSearch) ||
        user.username.toLowerCase().includes(this.currentSearch);

      const matchesRole =
        this.currentRoleFilter === 'ALL' ||
        user.role.toLowerCase() === this.currentRoleFilter.toLowerCase();

      return matchesSearch && matchesRole;
    });

    this.totalPages = Math.ceil(this.filteredUsers.length / this.itemsPerPage);
    this.updatePagination();
  }

  updatePagination() {
    const startIndex = (this.currentPage - 1) * this.itemsPerPage;
    const endIndex = startIndex + this.itemsPerPage;
    this.paginatedUsers = this.filteredUsers.slice(startIndex, endIndex);
  }

  nextPage() {
    if (this.currentPage < this.totalPages) {
      this.currentPage++;
      this.updatePagination();
    }
  }

  prevPage() {
    if (this.currentPage > 1) {
      this.currentPage--;
      this.updatePagination();
    }
  }

  promote(userId: number) {
    this.adminService.promoteToModerator(userId).subscribe({
      next: () => {
        this.toast.showSuccess('User promoted!');
        this.adminService.getAllUsers().subscribe({
          next: (data) => {
            this.users = data;
            this.applyFilters();
          },
        });
      },
      error: () => this.toast.showError('Promotion failed'),
    });
  }
}
