import { CommonModule } from '@angular/common';
import { Component } from '@angular/core';
import { AddLearningResourceComponent } from '../../learning-resources/add-learning-resource/add-learning-resource.component';
import { EditLearningResourceComponent } from '../../learning-resources/edit-learning-resource/edit-learning-resource.component';
import { ShowAllResourcesComponent } from '../../learning-resources/show-all-resources/show-all-resources.component';
import { getEmailFromToken } from '../../../core/utils/token.utils';
import { AuthService } from '../../../core/services/auth.service';

@Component({
  selector: 'app-moderator-learning-resources',
  imports: [
    CommonModule,
    AddLearningResourceComponent,
    EditLearningResourceComponent,
    ShowAllResourcesComponent,
  ],
  templateUrl: './moderator-learning-resources.component.html',
  styleUrl: './moderator-learning-resources.component.css',
})
export class ModeratorLearningResourcesComponent {
  activeTab: 'all' | 'my' | 'add' | 'edit' = 'my';

  loggedInEmail = '';

  constructor(private authService: AuthService) {}

  ngOnInit() {
    this.loggedInEmail = this.authService.getCurrentUserEmail() ?? '';
    console.log('Logged in email:', this.loggedInEmail);
  }
}
