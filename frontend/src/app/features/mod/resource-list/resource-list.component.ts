import { Component, OnInit } from '@angular/core';
import { Resource } from '../../../core/models/resource.model';
import { ModeratorService } from '../../../core/services/moderator.service';
import { RouterModule } from '@angular/router';
import { CommonModule } from '@angular/common';

@Component({
  selector: 'app-resource-list',
  standalone: true,
  imports: [RouterModule, CommonModule],
  templateUrl: './resource-list.component.html',
  styleUrl: './resource-list.component.css',
})
export class ResourceListComponent implements OnInit {
  resources: Resource[] = [];
  constructor(private mod: ModeratorService) {}
  ngOnInit() {
    this.mod.listResources().subscribe((r) => (this.resources = r));
  }
  delete(id: number) {
    this.mod.deleteResource(id).subscribe(() => this.ngOnInit());
  }
}
