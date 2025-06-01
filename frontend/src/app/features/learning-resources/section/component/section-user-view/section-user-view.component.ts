import { Component, Input } from '@angular/core';
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
export class SectionUserViewComponent {
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

  ngOnInit() {
    // Fetch initial like/bookmark/note/comments status if needed
    // Simulated here

    console.log(
      `Section User View initialized for Section ID: ${this.sectionId}, Resource ID: ${this.resourceId}`
    );
    this.likeStatus = { liked: false, likeCount: 12 };
    this.bookmarkStatus = { bookmarked: false };
    this.comments = [
      {
        userFirstName: 'Alice',
        userLastName: 'Doe',
        content: 'Great section!',
        createdAt: new Date(),
      },
    ];
  }

  toggleLike() {
    this.likeStatus.liked = !this.likeStatus.liked;
    this.likeStatus.likeCount += this.likeStatus.liked ? 1 : -1;
    // TODO: Call backend
  }
  toggleBookmark() {
    this.bookmarkStatus.bookmarked = !this.bookmarkStatus.bookmarked;
    // TODO: Call backend
  }
  saveNote() {
    this.isSavingNote = true;
    setTimeout(() => {
      this.isSavingNote = false;
      this.noteSaved = true;
      setTimeout(() => (this.noteSaved = false), 1500);
    }, 700);
    // TODO: Call backend
  }
  addComment() {
    if (!this.newComment.trim()) return;
    this.comments.push({
      userFirstName: 'You',
      userLastName: '',
      content: this.newComment,
      createdAt: new Date(),
    });
    this.newComment = '';
    // TODO: Call backend
  }
}
