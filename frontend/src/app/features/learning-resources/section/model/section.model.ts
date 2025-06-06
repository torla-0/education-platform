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
  content: string;
  lastModified: string | null;
}

export interface SectionDto {
  id: number;
  title: string;
  content: string;
  sectionOrder: number;
  published: boolean;
  createdAt: string;
  updatedAt: string;
  resourceId?: number;
}

export interface UpdateSectionDto {
  title: string;
  content: string;
}
