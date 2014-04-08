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

Set theme in `/etc/conf.d/fbcondecor`.

    FBCONDECOR_TTY_MAP="1:natural_gentoo 2:natural_gentoo 3:natural_gentoo 4:natural_gentoo 5:natural_gentoo 6:natural_gentoo"

Set kernel settings in `/etc/default/grub`.

    GRUB_CMDLINE_LINUX="splash=verbose,theme:natural_gentoo console=tty1"

Copy images to /etc/splash.

    sudo cp -r ./etc/splash/natural_gentoo /etc/splash/

More info on [Gentoo Wiki](http://wiki.gentoo.org/wiki/Fbsplash).


To clean up run `git clean -fdx`.

Images
------

Created by others, Creative Commons Licensed.

[Natural Gentoo](http://gentoo-art.org/content/show.php/gentoo+fbsplash+natural_gentoo+1920x1080?content=162492&PHPSESSID=3782da562e3217eeed166e0821fa53f6)

[Powered by Gentoo](http://gentoo-art.org/content/show.php/Powered+by+Gentoo+BootSplash+%5Bfbsplash%5D?content=127492&PHPSESSID=3782da562e3217eeed166e0821fa53f6)
