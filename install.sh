#!/bin/bash

sudo dnf install https://mirrors.rpmfusion.org/free/fedora/rpmfusion-free-release-$(rpm -E %fedora).noarch.rpm https://mirrors.rpmfusion.org/nonfree/fedora/rpmfusion-nonfree-release-$(rpm -E %fedora).noarch.rpm -y

sudo dnf group upgrade core -y
sudo dnf upgrade --refresh

sudo dnf install $(cat package-list.txt)

sudo systemctl enable greetd.service
sudo systemctl set-default graphical.target


sudo dnf install flatpak -y
flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo

xdg-user-dirs-update

curl -fsS https://dl.brave.com/install.sh | FLAVOR=origin sh

sudo authselect enable-feature with-pam-gnome-keyring
