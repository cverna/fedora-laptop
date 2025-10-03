#!/bin/bash

set -ouex pipefail

### Install packages

# Packages can be installed from any enabled yum repo on the image.
# RPMfusion repos are available by default in ublue main images
# List of rpmfusion packages can be found here:
# https://mirrors.rpmfusion.org/mirrorlist?path=free/fedora/updates/39/x86_64/repoview/index.html&protocol=https&redirect=1

# this installs a package from fedora repos
dnf5 install -y htop iwd libvirt-daemon libvirt-daemon libvirt-client libvirt-daemon-log \
        libvirt-daemon-config-network libvirt-daemon-driver-interface libvirt-daemon-driver-network \
        libvirt-daemon-driver-nwfilter libvirt-daemon-driver-qemu libvirt-daemon-driver-secret \
        libvirt-daemon-driver-storage-core libvirt-dbus qemu-img qemu-kvm qemu-system-x86-core \
        sysprof neovim ffmpeg-free gnome-tweaks gstreamer1-plugin-openh264 krb5-workstation \
	simple-scan virt-manager crun genisoimage coreutils libselinux shadow-utils \
        util-linux virtiofsd virt-install bootc just git jq podman


systemctl enable libvirtd.socket
rm -rf /var/lib/unbound/root.key
