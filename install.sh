#!/bin/bash

# Maximizing DNF download speed
sudo mv ./config/etc/dnf/dnf.conf /etc/dnf/dnf.conf
echo "DNF config successfully modified!"

sudo dnf install https://mirrors.rpmfusion.org/free/fedora/rpmfusion-free-release-$(rpm -E %fedora).noarch.rpm https://mirrors.rpmfusion.org/nonfree/fedora/rpmfusion-nonfree-release-$(rpm -E %fedora).noarch.rpm -y
echo "RPM Fusion repositories successfully enabled!"

sudo dnf group upgrade core -y
sudo dnf upgrade --refresh -y
echo "Core packages successfully upgraded!"

sudo dnf install $(cat package-list.txt) -y
echo "Package list successfully installed!"

sudo systemctl enable greetd.service
sudo systemctl set-default graphical.target
echo "Greetd service enabled by default!"

sudo dnf install flatpak -y
flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo
echo "Flatpak successfully installed!"

# Creates default user directories
xdg-user-dirs-update

curl -fsS https://dl.brave.com/install.sh | FLAVOR=origin sh
echo "Brave Origin successfully installed!"

# Auto-unlock keyring prompted in PAM
sudo authselect enable-feature with-pam-gnome-keyring

sudo mv ./config/etc/greetd/config.toml /etc/greetd/config.toml

# Automatically change keyring password with user password
sudo mv ./config/etc/passwd/passwd /etc/pam.d/passwd

# Uses xdg-desktop-portal-gnome as default and keeps gtk/wlr available for Wayland-specific functionality
# Also sets the portal Secret provider
mkdir -p ~/.config/xdg-desktop-portal/
sudo mv ./config/xdg-desktop-portal/portal.conf ~/.config/xdg-desktop-portal/
mkdir -p ~/.config/niri/
sudo mv ./config/niri/config.kdl ~/.config/niri/
echo "Configurations successfully added and modified!"
