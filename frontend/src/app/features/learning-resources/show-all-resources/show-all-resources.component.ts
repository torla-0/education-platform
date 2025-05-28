import { CommonModule } from '@angular/common';
import { HttpClient } from '@angular/common/http';
import { Component, Input, OnInit } from '@angular/core';

interface Resource {
  id: number;
  title: string;
  url: string;
  tags: string[];
  authorEmail: string;
  status: string;
  createdAt: string;
  updatedAt: string;
}
@Component({
  selector: 'app-show-all-resources',
  imports: [CommonModule],
  templateUrl: './show-all-resources.component.html',
  styleUrl: './show-all-resources.component.css',
})
export class ShowAllResourcesComponent implements OnInit {
  @Input() showOnlyMine: boolean = false;
  @Input() currentUserEmail: string = '';

  resources: Resource[] = [];
  isLoading = true;

  constructor(private http: HttpClient) {}

  ngOnInit() {
    this.fetchResources();
  }

  fetchResources() {
    this.isLoading = true;
    // Adjust endpoints as needed; assumes you have both available.
    const endpoint = this.showOnlyMine
      ? `/api/moderator/resources`
      : `/api/public/resources`;
    this.http.get<Resource[]>(endpoint).subscribe({
      next: (data) => {
        console.log('Fetched from backend:', data);
        // If showing only mine, API already filters
        // If showing all, filter here if needed
        if (this.showOnlyMine && this.currentUserEmail) {
          this.resources = data.filter(
            (r) => r.authorEmail === this.currentUserEmail
          );
        } else {
          this.resources = data;
        }
        this.isLoading = false;
      },
      error: () => (this.isLoading = false),
    });
  }
}
