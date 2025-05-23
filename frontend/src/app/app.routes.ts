import { Component } from '@angular/core';
import { RouterModule, RouterOutlet, Routes } from '@angular/router';
import { NavbarComponent } from './shared/components/navbar/navbar.component';
import { HomeComponent } from './features/home/home.component';
import { LearningResourcesComponent } from './features/learning-resources/learning-resources.component';
import { QuizComponent } from './features/quiz/quiz.component';
import { BlogComponent } from './blog/blog.component';
import { QuizRunComponent } from './features/quiz/components/quiz-run/quiz-run.component';
import { LoginComponent } from './features/auth/login/login.component';
import { SignupComponent } from './features/auth/signup/signup.component';
import { SettingsComponent } from './features/settings.component';
import { AuthGuard } from './core/guards/auth.guard';
import { SettingsAuthGuard } from './core/guards/settings-auth.guard';
import { AdminDashboardComponent } from './features/admin/admin-dashboard/admin-dashboard.component';
import { AdminGuard } from './core/guards/admin.guard';

export const routes: Routes = [
  { path: '', redirectTo: '/home', pathMatch: 'full' },
  { path: 'home', component: HomeComponent },
  { path: 'learning-resources', component: LearningResourcesComponent },
  { path: 'quiz', component: QuizComponent },
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
  },
  { path: '**', redirectTo: '/home' },
];
