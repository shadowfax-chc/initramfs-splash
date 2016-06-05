#!/bin/bash

name=${0##*/}

function print_help() {
    echo "usage: $name [options]

optional args:

    -c|--crypt    install cryptsetup
    -h|--help     print this help."
}

crypt=0
OPTS=$(getopt -o ch --long crypt,help -n "$name" -- "$@")

if [[ $? != 0 ]]; then echo "option error" >&2; exit 1; fi

eval set -- "$OPTS"

while true; do
    case "$1" in
        -c|--crypt)
            crypt=1
            shift;;
        -h|--help)
            print_help
            exit 0
            ;;
        --)
            shift; break;;
        *)
            echo "Internal error!"; exit 1;;
    esac
done

# Build lvm2 with static
mkdir -p /etc/portage/package.use/
cat <<DATAEOF > /etc/portage/package.use/initramfs
sys-apps/util-linux static-libs
sys-fs/lvm2 static -udev static-libs
dev-libs/nettle static-libs
sys-fs/cryptsetup static nettle -gcrypt
DATAEOF

pkgs='sys-fs/lvm2'

if [[ $crypt -eq 1 ]]; then
    # Build cryptsetup with static
    cat <<DATAEOF >> /etc/portage/package.use/initramfs
dev-libs/nettle static-libs
sys-fs/cryptsetup static nettle -gcrypt
DATAEOF
pkgs+=' sys-fs/cryptsetup'
fi

emerge -1 $pkgs || exit

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

if [[ $crypt -eq 1 ]]; then
    cp /sbin/cryptsetup ./sbin/cryptsetup || exit
fi

# Rebuild as dynamic
rm /etc/portage/package.use/initramfs
emerge -1 $pkgs
