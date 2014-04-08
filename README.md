Initramfs Splash
================

Manage initramfs files.


Usage
-----

Install `sys-apps/busybox` and `sys-fs/lvm2` with `USE=static`. Install
`media-gfx/splashutils`. Use `install.sh` to populate the additional files for
for the initramfs. Set `CONFIG_INITRAMFS_SOURCE` in kernel config. For example:

    git clone git@github.com:shadowfax-chc/initramfs-splash.git /usr/src/initramfs-splash
    CONFIG_INITRAMFS_SOURCE="/usr/src/initramfs-splash"


Images
------

Created by others, Creative Commons Licensed.

[Natural Gentoo](http://gentoo-art.org/content/show.php/gentoo+fbsplash+natural_gentoo+1920x1080?content=162492&PHPSESSID=3782da562e3217eeed166e0821fa53f6)

[Powered by Gentoo](http://gentoo-art.org/content/show.php/Powered+by+Gentoo+BootSplash+%5Bfbsplash%5D?content=127492&PHPSESSID=3782da562e3217eeed166e0821fa53f6)
