cd /d "%~dp0"
updater\wget.exe --timestamping http://cygwin.com/setup.exe
setup ^
 --package-manager ^
 --no-desktop ^
 --only-site ^
 --site http://mirror.cs.vt.edu/pub/cygwin/cygwin/ ^
 --local-package-dir %~dp0packages ^
 --root %~dp0