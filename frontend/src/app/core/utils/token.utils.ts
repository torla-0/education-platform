import { jwtDecode } from 'jwt-decode';

export function getEmailFromToken(token: string): string | null {
  try {
    const decoded: any = jwtDecode(token);
    return decoded.sub || null; // or decoded.email if that's the claim
  } catch {
    return null;
  }
}
