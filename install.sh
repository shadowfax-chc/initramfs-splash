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
sudo mknod -m 644 ./dev/console c 5 1 &> /dev/null
sudo mknod -m 644 ./dev/null c 1 3 &> /dev/null
sudo mknod -m 644 ./dev/tty0 c 4 0 &> /dev/null

# Add compiled files from host os.
cp /bin/busybox ./bin/busybox
cp /sbin/lvm.static ./sbin/lvm
cp /sbin/fbcondecor_helper ./sbin/fbcondecor_helper
pushd ./sbin &> /dev/null && \
ln -sf //sbin/fbcondecor_helper splash_helper
popd &> /dev/null
