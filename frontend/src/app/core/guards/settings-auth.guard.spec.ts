import { TestBed } from '@angular/core/testing';
import { CanActivateFn } from '@angular/router';

import { settingsAuthGuard } from './settings-auth.guard';

describe('settingsAuthGuard', () => {
  const executeGuard: CanActivateFn = (...guardParameters) => 
      TestBed.runInInjectionContext(() => settingsAuthGuard(...guardParameters));

  beforeEach(() => {
    TestBed.configureTestingModule({});
  });

  it('should be created', () => {
    expect(executeGuard).toBeTruthy();
  });
});
