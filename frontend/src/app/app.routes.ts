import { Component } from '@angular/core';
import { RouterModule, RouterOutlet, Routes } from '@angular/router';
import { NavbarComponent } from './shared/components/navbar/navbar.component';
import { HomeComponent } from './features/home/home.component';
import { PublicLearningResourcesComponent } from './features/learning-resources/public-learning-resources.component';
import { QuizListComponent } from './features/quiz/quiz-list/quiz-list.component';

import { LoginComponent } from './features/auth/login/login.component';
import { SignupComponent } from './features/auth/signup/signup.component';

import { AuthGuard } from './core/guards/auth.guard';
import { SettingsAuthGuard } from './core/guards/settings-auth.guard';
import { AdminDashboardComponent } from './features/admin/admin-dashboard/admin-dashboard.component';

import { ModeratorGuard } from './core/guards/moderator.guard';
import { ModeratorDashboardComponent } from './features/moderator/moderator-dashboard/moderator-dashboard.component';
import { BlogComponent } from './features/blog/blog.component';
import { SettingsComponent } from './features/settings/settings.component';
import { UserManagementComponent } from './features/admin/user-management/user-management.component';
import { AdminGuard } from './core/guards/admin.guard';

import { ModeratorLearningResourcesComponent } from './features/moderator/learining-resources/moderator-learning-resources.component';
import { PublicResourceDetailsComponent } from './features/learning-resources/public-resource-details/public-resource-details.component';
import { SectionUserViewComponent } from './features/learning-resources/section/component/section-user-view/section-user-view.component';
import { SectionOverviewComponent } from './features/learning-resources/section/component/section-overview/section-overview.component';
import { QuizRunComponent } from './features/quiz/quiz-run/quiz-run.component';
export const routes: Routes = [
  { path: '', redirectTo: '/home', pathMatch: 'full' },
  { path: 'home', component: HomeComponent },
  { path: 'learning-resources', component: PublicLearningResourcesComponent },
  { path: 'learning-resources/:id', component: PublicResourceDetailsComponent },
  {
    path: 'learning-resources/:resourceId/section/:sectionId',
    component: SectionOverviewComponent,
    canActivate: [AuthGuard],
  },
  { path: 'quiz', component: QuizListComponent },
  { path: 'blog', component: BlogComponent },
  { path: 'quiz/:id', component: QuizRunComponent },
  { path: 'login', component: LoginComponent },
  { path: 'signup', component: SignupComponent },
  {
    path: 'settings',
    component: SettingsComponent,
    canActivate: [AuthGuard, SettingsAuthGuard],
  },
  {
    path: 'admin',
    component: AdminDashboardComponent,
    canActivate: [AdminGuard],
    children: [
      { path: 'users', component: UserManagementComponent },
      // { path: 'quizzes', component: nameComponent },
      // { path: 'blogs', component: nameComponent },
      { path: '', redirectTo: 'users', pathMatch: 'full' },
    ],
  },
  {
    path: 'moderator',
    component: ModeratorDashboardComponent,
    canActivate: [ModeratorGuard, AuthGuard],
    children: [
      { path: 'resources', component: ModeratorLearningResourcesComponent },
      // { path: 'quizzes', component: QuizListComponent },
      // { path: 'blogs', component: BlogListComponent },
      //{ path: 'profile', component: ProfileComponent },
      // { path: 'review-questions', component: ReviewQuestionsComponent },
      // { path: 'user-reports', component: UserReportsComponent },
      { path: '', redirectTo: 'resources', pathMatch: 'full' },
    ],
  },
  { path: '**', redirectTo: '/home' },
];
