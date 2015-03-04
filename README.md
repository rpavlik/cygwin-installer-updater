# Cygwin Installer Updater

This handful of scripts is designed to help maintaining a Cygwin install.

Main features:

- Automatically download the latest `setup-*.exe` file (Win32-native `wget` included)
- Can use to install from scratch (by downloading and installing from setup file) as well as update/manage packages
- Scripts to launch setup in easy automated "update everything" mode or "package manager" mode.

It's really just a bunch of batch files, but it makes my usage of Cygwin easier. Maybe it will help you too.

## How to use
Clone this where you want your Cygwin install: usually `c:\cygwin` or something similar. Spaces are not handled well by cygwin, don't use them.