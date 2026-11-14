#!/bin/bash

sudo dnf install https://mirrors.rpmfusion.org/free/fedora/rpmfusion-free-release-$(rpm -E %fedora).noarch.rpm https://mirrors.rpmfusion.org/nonfree/fedora/rpmfusion-nonfree-release-$(rpm -E %fedora).noarch.rpm -y

sudo dnf group upgrade core -y
sudo dnf upgrade --refresh

sudo dnf install niri noctalia greetd tuigreet -y
sudo systemctl enable greetd.service
sudo systemctl set-default graphical.target

sudo dnf install which wget pciutils usbutils linux-firmware -y
sudo dnf install plocate autoconf bison re2c libxml2-devel sqlite-devel -y
sudo dnf install oniguruma-devel libcurl-devel gd-devel libpq-devel libzip-devel -y

sudo dnf install xdg-user-dirs -y
xdg-user-dirs-update

sudo dnf install xdg-desktop-portal xdg-desktop-portal-gnome xdg-desktop-portal-gtk xdg-desktop-portal-wlr -y
