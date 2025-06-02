import { Component, Input, OnInit } from '@angular/core';
import { SectionService } from '../../service/section.service';
import { CommonModule } from '@angular/common';
import { FormsModule } from '@angular/forms';
import { RouterModule } from '@angular/router';

@Component({
  selector: 'app-section-user-view',
  standalone: true,
  imports: [CommonModule, FormsModule, RouterModule],
  templateUrl: './section-user-view.component.html',
  styleUrls: ['./section-user-view.component.css'],
})
export class SectionUserViewComponent implements OnInit {
  @Input() section: any;
  @Input() prevSectionId: number | null = null;
  @Input() nextSectionId: number | null = null;
  @Input() sectionId!: number;
  @Input() resourceId!: number;

  likeStatus = { liked: false, likeCount: 0 };
  bookmarkStatus = { bookmarked: false };
  note: string = '';
  isSavingNote = false;
  noteSaved = false;
  comments: any[] = [];
  isLoadingComments = false;
  newComment = '';

  constructor(private sectionService: SectionService) {}

  ngOnInit() {
    // Section details, if not passed in
    if (!this.section) {
      this.sectionService
        .getSectionById(this.sectionId)
        .subscribe((section) => {
          this.section = section;
        });
    }

    this.sectionService.getSectionStatus(this.sectionId).subscribe((status) => {
      this.likeStatus = { liked: status.liked, likeCount: status.likeCount };
      this.bookmarkStatus = { bookmarked: status.bookmarked };
    });

    this.sectionService.getNote(this.sectionId).subscribe((note) => {
      this.note = note?.content ?? '';
    });

    this.loadComments();
  }

  loadComments() {
    this.isLoadingComments = true;
    this.sectionService.getComments(this.sectionId).subscribe((comments) => {
      this.comments = comments;
      this.isLoadingComments = false;
    });
  }

  toggleLike() {
    this.sectionService.toggleLike(this.sectionId).subscribe((result) => {
      this.likeStatus = result;
    });
  }

  toggleBookmark() {
    this.sectionService.toggleBookmark(this.sectionId).subscribe((result) => {
      this.bookmarkStatus = result;
    });
  }

  saveNote() {
    this.isSavingNote = true;
    this.sectionService.saveNote(this.sectionId, this.note).subscribe(() => {
      this.isSavingNote = false;
      this.noteSaved = true;
      setTimeout(() => (this.noteSaved = false), 1500);
    });
  }

  addComment() {
    if (!this.newComment.trim()) return;
    this.sectionService
      .addComment(this.sectionId, this.newComment)
      .subscribe((newComment) => {
        this.comments.push(newComment);
        this.newComment = '';
      });
  }
}
