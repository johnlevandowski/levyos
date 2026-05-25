# Create the qemu group and user
[group("virtualization")]
levyos-setup-virtualization:
    @# Create the group if it doesn't exist
    getent group qemu > /dev/null || sudo groupadd -r qemu
    @# Create the user if it doesn't exist, assigning it to qemu group with no home dir
    getent passwd qemu > /dev/null || sudo useradd -r -g qemu -d / -s /usr/sbin/nologin -c "QEMU user" qemu
    @echo "User and group 'qemu' have been verified/created."
    getent group libvirt > /dev/null || sudo groupadd -r libvirt
    groups $USER | grep -q '\blibvirt\b' || sudo usermod -aG libvirt $USER
    @echo "Group 'libvirt' has been verified/created and user verified/added to 'libvirt' group."
