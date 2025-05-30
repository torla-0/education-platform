export interface PublicResource {
  id: number;
  title: string;
  description: string;
  tags: string[];
  authorFirstName: string;
  authorLastName: string;
  status: string;
  url: string;
  createdAt: string;
  updatedAt: string;
  sections: { id: number; title: string }[];
}

export interface PublicResourcePage {
  content: PublicResource[];
  totalPages: number;
  totalElements: number;
  number: number;
  size: number;
}
