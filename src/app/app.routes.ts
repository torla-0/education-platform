import { Component } from '@angular/core';
import { RouterModule, RouterOutlet, Routes } from '@angular/router';
import { NavbarComponent } from './navbar/navbar.component';
import { HomeComponent } from './home/home.component';
import { LearningResourcesComponent } from './learning-resources/learning-resources.component';
import { QuizComponent } from './quiz/quiz.component';
import { BlogComponent } from './blog/blog.component';

export const routes: Routes = [
  { path: '', redirectTo: '/home', pathMatch: 'full' },
  { path: 'home', component: HomeComponent },
  { path: 'learning-resources', component: LearningResourcesComponent },
  { path: 'quiz', component: QuizComponent },
  { path: 'blog', component: BlogComponent },
];
