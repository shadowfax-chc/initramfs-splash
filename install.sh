#!/bin/bash

mkdir -p /etc/portage/package.use/
cat <<DATAEOF > /etc/portage/package.use/initramfs
sys-fs/lvm2 static -udev
DATAEOF

emerge -1 sys-fs/lvm2

# Make dirs
mkdir -p ./etc
mkdir -p ./bin
mkdir -p ./dev/{fb,misc,vc}
mkdir -p ./lib
mkdir -p ./lib64/splash/{proc,sys}
mkdir -p ./mnt/root
mkdir -p ./proc
mkdir -p ./root
mkdir -p ./sbin
mkdir -p ./sys

# Create devices
sudo mknod -m 644 ./dev/console c 5 1 &> /dev/null
sudo mknod -m 644 ./dev/null c 1 3 &> /dev/null
sudo mknod -m 644 ./dev/tty0 c 4 0 &> /dev/null

# Add compiled files from host os.
cp /bin/busybox ./bin/busybox
cp /sbin/lvm.static ./sbin/lvm

rm /etc/portage/package.use/initramfs
emerge -1 sys-fs/lvm2
