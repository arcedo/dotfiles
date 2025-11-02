# My Dotfiles

This repository contains my personal dotfiles and Neovim configuration.  
They include my terminal, IDE, and shell setup, everything I use to get my environment running quickly on a new system.

## Dependencies

Before using this dotfiles setup, make sure you have these packages installed:

### Desktop Environment
- `hyprland` — window manager
- `waybar` — status bar
- `mako` — notification daemon
- `rofi` — application launcher
- `network-manager-applet` — system tray applet for Wi-Fi/Ethernet
- `blueman` — Bluetooth manager (includes `blueman-applet`)

### Terminal & IDE

- `kitty` — terminal emulator
- `zsh` - shell
- `neovim` — text editor

### Other Tools

- `git` - version control system 🙃
- `imagemagick` — for wallpapers (`magick` command)
- `docker` — optional, used in `.zshrc`
- `pnpm` — optional, Node.js package manager

---

### Package Installation Example (Arch)

```bash
sudo pacman -Syu \
  zsh git neovim kitty rofi mako imagemagick \
  network-manager-applet blueman hyprland waybar
```

--

## Installation

To use my current setup, simply clone this repository and run the installation script:

```
bash
git clone https://github.com/arcedo/dotfiles.git
cd dotfiles
chmod +x setup.sh
./setup.sh
```
