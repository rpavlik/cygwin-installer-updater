cd /d "%~dp0"
call updater\common.cmd
%INSTALLER_FN% ^
 --package-manager ^
 --no-desktop ^
 --only-site ^
 --site %MIRROR% ^
 --local-package-dir %~dp0packages ^
 --root %~dp0