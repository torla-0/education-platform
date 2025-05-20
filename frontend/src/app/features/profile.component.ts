import { Component, OnInit } from '@angular/core';
import { User } from '../core/models/User';
import { UserService } from '../core/services/user.service';
import { CommonModule } from '@angular/common';
import { RouterModule } from '@angular/router';
import { FormsModule } from '@angular/forms';

@Component({
  selector: 'app-profile',
  imports: [CommonModule, RouterModule, FormsModule],
  templateUrl: './profile.component.html',
  styleUrls: ['./profile.component.css'],
})
export class ProfileComponent implements OnInit {
  user: User = {
    id: 0,
    username: '',
    email: '',
    firstName: '',
    lastName: '',
  };

  password = {
    new: '',
    confirm: '',
  };
  editMode: boolean = false;

  constructor(private userService: UserService) {}

  ngOnInit(): void {
    this.userService.getProfile().subscribe({
      next: (data) => {
        console.log(data);
        this.user = data;
      },
      error: (err) => console.error(err),
    });
  }

  toggleEditMode() {
    this.editMode = !this.editMode;
    if (!this.editMode) {
      this.onProfileSubmit();
    }
  }

  onProfileSubmit() {}

  onPasswordSubmit() {}
}
