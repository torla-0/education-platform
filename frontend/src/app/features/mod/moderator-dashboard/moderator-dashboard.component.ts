import { Component } from '@angular/core';
import { Router, RouterOutlet } from '@angular/router';

@Component({
  selector: 'app-moderator-dashboard',
  standalone: true,
  imports: [RouterOutlet],
  templateUrl: './moderator-dashboard.component.html',
  styleUrl: './moderator-dashboard.component.css',
})
export class ModeratorDashboardComponent {}
