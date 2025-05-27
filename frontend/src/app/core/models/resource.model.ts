export interface Resource {
  id: number;
  title: string;
  url: string;
  tags: string[];
  authorEmail: string;
  status: string;
  createdAt: string;
  updatedAt: string;
}

export interface CreateResource {
  title: string;
  url: string;
  tags: string[];
}

export interface UpdateResource {
  title?: string;
  url?: string;
  tags?: string[];
  status?: string;
}
