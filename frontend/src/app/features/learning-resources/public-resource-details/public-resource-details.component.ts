import { Component, OnInit } from '@angular/core';
import { Location } from '@angular/common';
import { ActivatedRoute, Router } from '@angular/router';
import { PublicLearningResourceService } from '../../../core/services/public-learning-resource.service';
import { CommonModule } from '@angular/common';
import { PublicResource } from '../../../core/models/public-resource.model';
import { AuthService } from '../../../core/services/auth.service';
import { EnrollmentService } from '../../../core/services/enrollment.service';
import { ToastService } from '../../../core/services/toast.service';

@Component({
  selector: 'app-public-resource-details',
  standalone: true,
  imports: [CommonModule],
  templateUrl: './public-resource-details.component.html',
  styleUrl: './public-resource-details.component.css',
})
export class PublicResourceDetailsComponent implements OnInit {
  resource: PublicResource | null = null;
  isLoading = true;

  isLoggedIn = false;
  isEnrolled = false;
  checkingEnrollment = false;

  constructor(
    private route: ActivatedRoute,
    private resourceService: PublicLearningResourceService,
    private authService: AuthService,
    private enrollmentService: EnrollmentService,
    private toastService: ToastService,
    private location: Location,
    private router: Router
  ) {}

  ngOnInit() {
    this.isLoggedIn = this.authService.isLoggedIn();
    const id = Number(this.route.snapshot.paramMap.get('id'));
    this.resourceService.getResourceById(id).subscribe((res) => {
      this.resource = res;
      this.isLoading = false;

      if (this.isLoggedIn && this.resource) {
        // If MODERATOR or ADMIN, grant access
        if (this.isPrivilegedRole()) {
          this.isEnrolled = true;
        } else {
          this.checkEnrollment();
        }
      }
    });
  }

  goBack(): void {
    this.location.back();
  }

  checkEnrollment() {
    if (!this.resource) {
      this.checkingEnrollment = false;
      return;
    }
    this.checkingEnrollment = true;
    this.enrollmentService.isEnrolled(this.resource.id).subscribe({
      next: (enrolled) => {
        this.isEnrolled = enrolled;
        this.checkingEnrollment = false;
      },
      error: () => {
        this.isEnrolled = false;
        this.checkingEnrollment = false;
      },
    });
  }

  enroll() {
    if (!this.isLoggedIn) {
      this.router.navigate(['/signup']);
      return;
    }
    if (this.resource) {
      this.enrollmentService.enroll(this.resource.id).subscribe(() => {
        this.isEnrolled = true;
        this.toastService.showSuccess('Enrolled successfully!');
      });
    } else {
      this.toastService.showError('Resource not found. Cannot enroll.');
    }
  }

  isPrivilegedRole(): boolean {
    const roles = this.authService.getUserRoles();
    return roles.includes('MODERATOR') || roles.includes('ADMIN');
  }

  goToSection(sectionId: number) {
    if (!this.resource) return;
    this.router.navigate([
      '/learning-resources',
      this.resource.id,
      'section',
      sectionId,
    ]);
  }
}
