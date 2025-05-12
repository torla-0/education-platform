import { Component } from '@angular/core';

import { MatToolbarModule } from '@angular/material/toolbar';
import { MatButtonModule } from '@angular/material/button';
import { MatCardModule } from '@angular/material/card';
import { ApiService } from '../services/api.service';
import { HttpClientModule } from '@angular/common/http';
import { CommonModule } from '@angular/common';

@Component({
  selector: 'app-home',
  imports: [
    MatToolbarModule,
    MatButtonModule,
    MatCardModule,
    CommonModule,
    HttpClientModule,
  ],
  templateUrl: './home.component.html',
  styleUrl: './home.component.css',
  standalone: true,
})
export class HomeComponent {
  message = '';

  constructor(private api: ApiService) {
    this.api.getTestMessage().subscribe({
      next: (res) => (this.message = res),
      error: (err) => console.error('Greška sa backendom:', err),
    });
  }
}
