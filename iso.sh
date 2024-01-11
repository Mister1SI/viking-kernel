#!/bin/sh
set -e
. ./build.sh
 
mkdir -p isodir
mkdir -p isodir/boot
mkdir -p isodir/boot/grub
 
cp sysroot/boot/viking.kernel isodir/boot/viking.kernel
cat > isodir/boot/grub/grub.cfg << EOF
menuentry "viking" {
	multiboot /boot/viking.kernel
}
EOF
grub-mkrescue -o viking.iso isodir