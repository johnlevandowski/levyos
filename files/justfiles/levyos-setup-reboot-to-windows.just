# Setup Reboot to Windows Desktop Shortcut
[group("system")]
levyos-setup-reboot-to-windows:
    echo "Making efibootmgr -n usable without sudo password"
    echo "%wheel ALL=(root) NOPASSWD: /usr/sbin/efibootmgr" | sudo tee /etc/sudoers.d/efibootmgr-config
    cp /usr/bin/windows.desktop ~/Desktop
