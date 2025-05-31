import { CommonModule } from '@angular/common';
import { Component, inject, OnInit } from '@angular/core';
import { ActivatedRoute, Params, Router } from '@angular/router';
import { AuthService } from '../../../../../core/services/auth.service';
import { SectionUserViewComponent } from '../section-user-view/section-user-view.component';
import { SectionModeratorViewComponent } from '../section-moderator-view/section-moderator-view.component';
import { SectionService } from '../../service/section.service';

@Component({
  selector: 'app-section-overview',
  standalone: true,
  imports: [
    CommonModule,
    SectionUserViewComponent,
    SectionModeratorViewComponent,
  ],
  templateUrl: './section-overview.component.html',
  styleUrls: ['./section-overview.component.css'],
})
export class SectionOverviewComponent implements OnInit {
  section: any = null;
  isLoading = true;
  isModerator = false;
  prevSectionId: number | null = null;
  nextSectionId: number | null = null;

  constructor(
    private activatedRoute: ActivatedRoute,
    private route: Router,
    private sectionService: SectionService,
    private authService: AuthService
  ) {}

  ngOnInit() {
    this.activatedRoute.params.subscribe((params: Params) => {
      const sectionId = params['sectionId'];
      this.fetchSection(sectionId);
    });
    this.isModerator = this.authService.hasRole('MODERATOR');
  }

  fetchSection(sectionId: number) {
    this.isLoading = true;
    this.sectionService.getSectionById(Number(sectionId)).subscribe({
      next: (section: any) => {
        this.section = section;
        this.prevSectionId = section.prevSectionId;
        this.nextSectionId = section.nextSectionId;
        this.isLoading = false;
      },
      error: () => (this.isLoading = false),
    });
  }

  refreshSection() {
    if (this.section?.id) this.fetchSection(this.section.id);
  }
}
