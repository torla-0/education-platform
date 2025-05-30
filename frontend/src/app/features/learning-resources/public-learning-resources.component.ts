import { CommonModule } from '@angular/common';
import { Component, OnInit } from '@angular/core';
import { PublicResource } from '../../core/models/public-resource.model';
import { PublicLearningResourceService } from '../../core/services/public-learning-resource.service';
import { Router } from '@angular/router';

@Component({
  selector: 'app-learning-resources',
  imports: [CommonModule],
  templateUrl: './public-learning-resources.component.html',
  styleUrl: './public-learning-resources.component.css',
})
export class PublicLearningResourcesComponent implements OnInit {
  resources: PublicResource[] = [];
  totalPages = 1;
  totalElements = 0;
  page = 0;
  size = 10;
  search = '';
  tag = 'ALL';
  isLoading = false;

  constructor(
    private resourceService: PublicLearningResourceService,
    private router: Router
  ) {}

  ngOnInit() {
    this.loadResources();
  }

  loadResources() {
    this.isLoading = true;
    this.resourceService
      .getResources(this.search, this.tag, this.page, this.size)
      .subscribe((data) => {
        this.resources = data.content;
        this.totalPages = data.totalPages;
        this.totalElements = data.totalElements;
        this.isLoading = false;
      });
  }

  onSearchChange(event: Event) {
    const input = event.target as HTMLInputElement;
    this.search = input.value;
    this.page = 0;
    this.loadResources();
  }

  goToResource(id: number) {
    this.router.navigate(['/learning-resources', id]);
  }

  prevPage() {
    if (this.page > 0) {
      this.page--;
      this.loadResources();
    }
  }

  nextPage() {
    if (this.page < this.totalPages - 1) {
      this.page++;
      this.loadResources();
    }
  }
}
