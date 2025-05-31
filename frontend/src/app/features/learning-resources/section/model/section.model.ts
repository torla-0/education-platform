export interface SectionComment {
  id: number;
  userId: number;
  userFirstName: string;
  userLastName: string;
  content: string;
  createdAt: string;
}

export interface SectionLikeDto {
  liked: boolean;
  likeCount: number;
}

export interface SectionBookmarkDto {
  bookmarked: boolean;
}

export interface SectionNoteDto {
  noteContent: string;
  lastModified: string | null;
}
