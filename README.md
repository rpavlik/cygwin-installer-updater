# Cygwin Installer Updater

<https://github.com/rpavlik/cygwin-installer-updater>

> NOTE: Even though this README file might appear in the root of your Cygwin install, the `cygwin-installer-updater` is not actually affiliated with Cygwin - go to <http://cygwin.com> for info on the actual software. This is just some helper scripts.

This handful of scripts is designed to help maintaining a Cygwin install.

Main features:

- Automatically download the latest `setup-*.exe` file (Win32-native `wget` included)
- Can use to install from scratch (by downloading and installing from setup file) as well as update/manage packages
- Scripts to launch setup in easy automated "update everything" mode or "package manager" mode.

It's really just a bunch of batch files, but it makes my usage of Cygwin easier. Maybe it will help you too.

## How to use
Clone this where you want your Cygwin install: usually `c:\cygwin` or something similar. Spaces are not handled well by Cygwin, don't use them. Something of this sort, a git bash example, should work:

```sh
cd /c
git clone https://github.com/rpavlik/cygwin-installer-updater.git cygwin
```

If you want 64-bit Cygwin, see below for config stuff before you go any further.

To install from scratch, or to change your package selections, in such a setup, just run `packagemanager.cmd`. (It's preferred to do this rather than just running the downloaded setup file, since this sets some options including a local package cache dir and a mirror)

To update your installed packages without prompting, run `update.cmd`

## Configuration

- 32 vs 64 bit: The following logic is used to determine which installer to use. (Note that if you want to change/set this, do it before installing Cygwin - I have no idea what happens if you try to switch an install from 32 to 64 bit or vice-versa, but I bet it's not good.)
	- If either of the `setup-*.exe` files is seen, the scripts will follow their lead and use that bitness.
	- If neither are seen, but there is a file matching the pattern `x86_64*` or `x64*`, then 64-bit is assumed.
	- By default, as a fallback, 32-bit is used.
- Mirror: You can override the default mirror I chose by putting the URL of your desired mirror in a file named `mirror.txt` in the Cygwin root dir. (My choice is in `updater\common.cmd` - but again, you don't need to edit that file to change the mirror)