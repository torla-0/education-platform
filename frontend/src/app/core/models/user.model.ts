export interface User {
  id: number;
  email: string;
  firstName: string;
  lastName: string;
  roles?: string[];
  username: string;
  deletionRequested: boolean;
}
