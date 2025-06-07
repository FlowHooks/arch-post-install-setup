# Arch Post-Installation Setup

This repository contains a Bash script designed to automate the post-installation setup of Arch Linux systems. The script performs several essential tasks, including installing necessary packages, setting up swap space, and configuring the desktop wallpaper.

## License

This software is licensed under the GNU Affero General Public License v3. You may use, modify, and distribute this code under the terms of the AGPLv3. This program is distributed in the hope that it will be useful, but WITHOUT ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the GNU AGPLv3 for more details.

## Author

Felipe Cezar Paz  
Email: [git@felipecezar.com](mailto:git@felipecezar.com)

## Features

- Installs `yay` (Yet Another Yaourt) for AUR package management.
- Installs a set of essential packages including:
  - `xclip`
  - `neofetch`
  - `firefox`
  - `veracrypt`
  - `keepassxc`
  - `obs-studio`
  - `libreoffice-fresh`
  - `chromium`
  - `code` (Visual Studio Code)
  - `nodejs` and `npm`
  - `python` and `python-pip`
- Sets up a swap file based on the total RAM.
- Downloads and sets the company's wallpaper.

## Usage

1. Clone the repository:
   ```bash
   git clone https://github.com/FlowHooks/arch-post-install-setup.git
   cd arch-post-install-setup
   ```

2. Make the script executable:
   ```bash
   chmod +x setup.sh
   ```

3. Run the script:
   ```bash
   ./setup.sh
   ```

**Note:** This script requires root privileges to install packages and modify system settings. It is recommended to run it in a terminal with sudo.

## Disclaimer

This script is intended for internal use at Flowhooks Software and may not be suitable for all environments. Use at your own risk.
