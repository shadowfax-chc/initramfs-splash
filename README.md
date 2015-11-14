Initramfs Splash
================

Manage initramfs files.

Usage
-----

Install `sys-apps/busybox` and `sys-fs/lvm2` with `USE=static`. Use
`install.sh` to populate the additional files for for the initramfs. Set
`CONFIG_INITRAMFS_SOURCE` in kernel config. For example:

    git clone git@github.com:shadowfax-chc/initramfs-splash.git /usr/src/initramfs-splash
    CONFIG_INITRAMFS_SOURCE="/usr/src/initramfs-splash"

To clean up run `git clean -fdx`.
