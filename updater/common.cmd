@echo off
rem Note that this script should be run with the root Cygwin dir as the current directory,
rem typically using "call" from a root-dir script.

rem Default mirror
set MIRROR=http://mirror.cs.vt.edu/pub/cygwin/cygwin/
rem Can override with mirror.txt
if exist mirror.txt set /p MIRROR=<mirror.txt

set INSTALLER_FN_32=setup-x86.exe
set INSTALLER_FN_64=setup-x86_64.exe

rem Branch for 32 or 64 bit
rem Check for installers, first
if exist %INSTALLER_FN_32% goto :bit32
if exist %INSTALLER_FN_64% goto :bit64

rem A file starting with these prefixes will flag us into 64-bit mode
if exist x64* goto :bit64
if exist x86_64* goto :bit64
rem A file starting with this prefix will force us into 32-bit mode
if exist x32* goto :bit32

rem To avoid rebase pain, etc, if we have a 64-bit machine, we should default to 64-bit now.
if [%PROCESSOR_ARCHITECTURE%]==[AMD64] goto :bit64

rem Fallback to 32-bit by default

:bit32
echo cygwin-installer-updater: 32-bit
set INSTALLER_FN=%INSTALLER_FN_32%
goto :shared

:bit64
echo cygwin-installer-updater: 64-bit
set INSTALLER_FN=%INSTALLER_FN_64%
goto :shared

:shared 

set INSTALLER_URL=http://cygwin.com/%INSTALLER_FN%

echo.
echo Installer url: %INSTALLER_URL%
echo Mirror: %MIRROR%
echo.

rem Download the installer, if it has been updated.
updater\wget.exe --timestamping %INSTALLER_URL%
