Initramfs
=========

Build simple initramfs that mounts `/` and `/usr` from
[lvms](http://www.sourceware.org/lvm2/).


Setup
-----

Install `sys-apps/busybox` with `USE=static`. Use `install.sh`
to create the initramfs files and directories.  Set `CONFIG_INITRAMFS_SOURCE`
in kernel config. For example:

    git clone git@github.com:shadowfax-chc/initramfs-splash.git /usr/src/initramfs-splash
    CONFIG_INITRAMFS_SOURCE="/usr/src/initramfs-splash"

To clean up run `git clean -fdx`.


Configuration
-------------

The `init` script can be configured via kernel command line args. The following
args are available:

 Argument    | Description                           | Default        | Notes
 ----------- | ------------------------------------- | -------------- | -------------------------------------
 `root_lv`   | Name of the root logical volume       | `vgsys/lvroot` |
 `user_lv`   | Name of the usr logical volume        | `vgsys/lvusr`  | Ignored if `mount_usr=0`
 `real_root` | Root device to mount                  | `LABEL=/`      |
 `usr`       | Usr device to mount                   | `LABEL=/usr`   | Ignored if `mount_usr=0`
 `mount_usr` | Boolean to control mounting of `/usr` | `1`            | Set to `0` to skip mounting of `/usr`
