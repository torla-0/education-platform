import { Injectable } from '@angular/core';

@Injectable({ providedIn: 'root' })
export class SessionService {
  private _reauthVerified = false;

  isReauthVerified(): boolean {
    return this._reauthVerified;
  }

  setReauthVerified(value: boolean): void {
    this._reauthVerified = value;
  }

  reset(): void {
    this._reauthVerified = false;
  }
}
