cd /d "%~dp0"
updater\wget.exe --timestamping http://cygwin.com/setup.exe
setup ^
 --package-manager ^
 --no-desktop ^
 --only-site ^
 --site ftp://lug.mtu.edu/cygwin/ ^
 --local-package-dir C:\cygwin-packages ^
 --root C:\cygwin