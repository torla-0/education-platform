import { Component, OnInit } from '@angular/core';
import { CommonModule } from '@angular/common';
import { AdminService, UserDto } from '../../../core/services/admin.service';
import { ToastService } from '../../../core/services/toast.service';
import { FormsModule } from '@angular/forms';
import { ConfirmationDialogComponent } from '../../../shared/confirmation-dialog/confirmation-dialog.component';

@Component({
  selector: 'app-admin-dashboard',
  standalone: true,
  imports: [CommonModule, FormsModule, ConfirmationDialogComponent],
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
  pageSizeOptions = [5, 10, 25];

  currentUserEmail: string = '';

  // Dialog state
  showDialog = false;
  dialogMessage = '';
  selectedUser: UserDto | null = null;
  actionType: 'promote' | 'demote' | null = null;

  constructor(
    private adminService: AdminService,
    private toast: ToastService
  ) {}

  ngOnInit(): void {
    this.currentUserEmail = localStorage.getItem('email') || '';
    this.loadUsers();
  }

  loadUsers() {
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

  updatePageSize() {
    this.currentPage = 1;
    this.totalPages = Math.ceil(this.filteredUsers.length / this.itemsPerPage);
    this.updatePagination();
  }

  confirmPromotion(user: UserDto) {
    this.dialogMessage = `Promote ${user.email} to MODERATOR?`;
    this.selectedUser = user;
    this.actionType = 'promote';

    // Ensure message is bound before rendering
    setTimeout(() => {
      this.showDialog = true;
    });
  }

  confirmDemotion(user: UserDto) {
    if (this.isCurrentUser(user)) {
      this.toast.showError("You can't demote yourself!");
      return;
    }

    this.dialogMessage = `Demote ${user.email} to USER?`;
    this.selectedUser = user;
    this.actionType = 'demote';

    // Ensure message is bound before rendering
    setTimeout(() => {
      this.showDialog = true;
    });
  }

  handleDialogResponse(confirmed: boolean) {
    this.showDialog = false;
    if (!confirmed || !this.selectedUser || !this.actionType) return;

    if (this.actionType === 'promote') {
      this.adminService.promoteToModerator(this.selectedUser.id).subscribe({
        next: () => {
          this.toast.showSuccess('User promoted!');
          this.loadUsers();
        },
        error: () => this.toast.showError('Promotion failed'),
      });
    } else if (this.actionType === 'demote') {
      this.adminService.demoteUser(this.selectedUser.id).subscribe({
        next: () => {
          this.toast.showSuccess('User demoted!');
          this.loadUsers();
        },
        error: () => this.toast.showError('Demotion failed'),
      });
    }

    this.selectedUser = null;
    this.actionType = null;
  }

  isCurrentUser(user: UserDto): boolean {
    return user.email === this.currentUserEmail;
  }
}
