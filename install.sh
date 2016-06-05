#!/bin/bash

# Build lvm2 with static
mkdir -p /etc/portage/package.use/
cat <<DATAEOF > /etc/portage/package.use/initramfs
sys-apps/util-linux static-libs
sys-fs/lvm2 static -udev static-libs
dev-libs/nettle static-libs
sys-fs/cryptsetup static nettle -gcrypt
DATAEOF

emerge -1 sys-fs/lvm2 sys-fs/cryptsetup || exit

# Make dirs
mkdir -p ./etc
mkdir -p ./bin
mkdir -p ./dev/{fb,misc,vc}
mkdir -p ./lib
mkdir -p ./lib64/splash/{proc,sys}
mkdir -p ./mnt/{root,tmp}
mkdir -p ./proc
mkdir -p ./root
mkdir -p ./sbin
mkdir -p ./sys
mkdir -p ./usr/{lib,lib64}

# Create devices
mknod -m 644 ./dev/console c 5 1 &> /dev/null
mknod -m 644 ./dev/null    c 1 3 &> /dev/null
mknod -m 644 ./dev/tty0    c 4 0 &> /dev/null
mknod -m 666 ./dev/urandom c 1 9 &> /dev/null
mknod -m 666 ./dev/random  c 1 8 &> /dev/null
mknod -m 640 ./dev/mem     c 1 1 &> /dev/null
mknod -m 666 ./dev/tty     c 5 0 &> /dev/null
mknod -m 666 ./dev/zero    c 1 5 &> /dev/null
mknod -m 640 ./dev/tty1    c 4 1 &> /dev/null

# Add compiled files from host os.
cp /bin/busybox ./bin/busybox || exit
cp /sbin/lvm.static ./sbin/lvm || exit
cp /sbin/cryptsetup ./sbin/cryptsetup || exit

# Rebuild lvm2 as dynamic and cryptsetup
rm /etc/portage/package.use/initramfs
emerge -1 sys-fs/lvm2 sys-fs/cryptsetup
