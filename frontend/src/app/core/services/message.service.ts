import { Injectable } from '@angular/core';

@Injectable({ providedIn: 'root' })
export class MessageService {
  message: string | null = null;

  setMessage(msg: string) {
    this.message = msg;
  }

  consumeMessage(): string | null {
    const temp = this.message;
    this.message = null;
    return temp;
  }
}
