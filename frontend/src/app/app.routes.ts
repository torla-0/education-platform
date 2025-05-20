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
import { ProfileComponent } from './features/profile.component';

export const routes: Routes = [
  { path: '', redirectTo: '/home', pathMatch: 'full' },
  { path: 'home', component: HomeComponent },
  { path: 'learning-resources', component: LearningResourcesComponent },
  { path: 'quiz', component: QuizComponent },
  { path: 'blog', component: BlogComponent },
  { path: 'quiz/:id', component: QuizRunComponent },
  { path: 'login', component: LoginComponent },
  { path: 'signup', component: SignupComponent },
  { path: '', redirectTo: 'login', pathMatch: 'full' },
  { path: 'profile', component: ProfileComponent },
];
