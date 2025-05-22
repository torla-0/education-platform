import { inject } from '@angular/core';
import { MatDialog } from '@angular/material/dialog';
import { CanActivateFn, Router } from '@angular/router';
import { ToastService } from '../services/toast.service';
import { ReauthDialogComponent } from '../../features/settings/components/reauth-dialog/reauth-dialog.component';
import { SessionService } from '../services/session.service';

export const SettingsAuthGuard: CanActivateFn = () => {
  const session = inject(SessionService);
  const dialog = inject(MatDialog);
  const toast = inject(ToastService);

  if (session.isReauthVerified()) return true;

  return new Promise<boolean>((resolve) => {
    const dialogRef = dialog.open(ReauthDialogComponent, {
      width: '400px',
      disableClose: true,
    });

    dialogRef.afterClosed().subscribe((result) => {
      if (result?.success) {
        session.setReauthVerified(true);
        resolve(true);
      } else {
        toast.showError('❌ Access to settings was cancelled');
        resolve(false);
      }
    });
  });
};
