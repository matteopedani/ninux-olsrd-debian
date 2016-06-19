#!/bin/bash

set -x
mkdir mipsel
cd mipsel

qemu-img create -f qcow2 disk.img 4G

# wheezy
wget http://http://http.us.debian.org/debian/dists/wheezy/main/installer-mipsel/current/images/malta/netboot/initrd.gz
wget http://http://http.us.debian.org/debian/dists/wheezy/main/installer-mipsel/current/images/malta/netboot/vmlinux-3.2.0-4-4kc-malta

qemu-system-mipsel \
    -M malta \
    -hda mipsel/disk.img \
    -kernel mipsel/vmlinux-3.2.0-4-4kc-malta \
    -initrd mipsel/initrd.gz \
    -append "console=ttyS0" \
    -nographic 

