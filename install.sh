#!/bin/bash

# Make dirs
mkdir -p ./bin
mkdir -p ./dev/{fb,misc,vc}
mkdir -p lib
mkdir -p lib64/splash/{proc,sys}
mkdir -p mnt/root
mkdir -p proc
mkdir -p root
mkdir -p sbin
mkdir -p sys

# Create devices
sudo mknod -m 644 ./dev/console c 5 1
sudo mknod -m 644 ./dev/null c 1 3
sudo mknod -m 644 ./dev/tty0 c 4 0

# Add compiled files from host os.
cp /bin/busybox ./bin/busybox
cp /sbin/lvm.static ./sbin/lvm
cp /sbin/fbcondecor_helper ./sbin/fbcondecor_helper
pushd ./sbin && \
ln -sf /sbin/fbcondecor_helper splash_helper
popd
