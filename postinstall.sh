#!/bin/bash

# Print license information
cat << 'EOF'
# ************************************************************
# *                                                          *
# *   Flowhooks Software - Open Source License               *
# *                                                          *
# *  This software is licensed under the GNU Affero General   *
# *  Public License v3. You may use, modify, and distribute   *
# *  this code under the terms of the AGPLv3.                *
# *                                                          *
# *  This program is distributed in the hope that it will be  *
# *  useful, but WITHOUT ANY WARRANTY; without even the       *
# *  implied warranty of MERCHANTABILITY or FITNESS FOR A     *
# *  PARTICULAR PURPOSE. See the GNU AGPLv3 for more details. *
# *                                                          *
# *  Author: Felipe Cezar Paz (git@felipecezar.com)          *
# *  File:                                                   *
# *  Description:                                            *
# *                                                          *
# ************************************************************
EOF

set -e  # Exit on error

# Function to install yay
install_yay() {
    echo "Installing yay..."
    sudo pacman -Sy --noconfirm git base-devel
    cd /opt
    sudo git clone https://aur.archlinux.org/yay.git
    sudo chown -R "$USER":"$USER" yay
    cd yay
    makepkg -si --noconfirm
}

# Function to install packages
install_packages() {
    echo "Installing packages..."
    yay -S --noconfirm xclip neofetch firefox veracrypt keepassxc obs-studio libreoffice-fresh chromium code nodejs npm python python-pip
}

# Function to setup swap
setup_swap() {
    echo "Setting up swap..."
    sudo swapoff -a
    sudo rm -f /swapfile

    # Get total RAM in MiB
    RAM_MB=$(grep MemTotal /proc/meminfo | awk '{print $2}')
    SWAP_MB=$((RAM_MB * 2))
    
    echo "Creating a ${SWAP_MB}KB swapfile..."
    sudo fallocate -l "${SWAP_MB}K" /swapfile
    sudo chmod 600 /swapfile
    sudo mkswap /swapfile
    sudo swapon /swapfile

    # Add to fstab if not already present
    if ! grep -q "/swapfile" /etc/fstab; then
        echo "/swapfile none swap defaults 0 0" | sudo tee -a /etc/fstab
    fi
}

# Function to download and set wallpaper
set_wallpaper() {
    echo "Setting wallpaper..."
    WALLPAPER_URL="https://cdn.flowhooks.digital/asset/img/Background.png"
    WALLPAPER_PATH="$HOME/Pictures/wallpaper.jpg"

    mkdir -p "$HOME/Pictures"
    curl -L "$WALLPAPER_URL" -o "$WALLPAPER_PATH"

    # Set wallpaper using gsettings for GNOME
    gsettings set org.gnome.desktop.background picture-uri-dark "file://$WALLPAPER_PATH"
    gsettings set org.gnome.desktop.background picture-uri "file://$WALLPAPER_PATH"
    gsettings set org.gnome.desktop.background picture-options "zoom"
}

main() {
    install_yay
    install_packages
    setup_swap
    set_wallpaper
    echo "✅ Post-installation setup complete."
}

main
