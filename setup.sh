#!/usr/bin/env bash
# ---------------------------------------
# Dotfiles setup script for Arch Linux
# Safely symlinks configuration files, .zshrc, and shared resources
# ---------------------------------------

set -e

# --- Colors ---
GREEN="\e[32m"
YELLOW="\e[33m"
CYAN="\e[36m"
RESET="\e[0m"

# --- Paths ---
DOTFILES_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
CONFIG_DIR="$HOME/.config"
BACKUP_DIR="$HOME/.dotfiles_backup_$(date +%Y%m%d_%H%M%S)"

# --- Options ---
FORCE=false
if [[ "$1" == "--force" ]]; then
  FORCE=true
  echo -e "${YELLOW}⚠️  Running in FORCE mode — existing files won't be backed up.${RESET}"
fi

# --- Config directories to link ---
CONFIGS=(hypr kitty mako nvim rofi waybar)

echo -e "${CYAN}🔧 Setting up dotfiles...${RESET}"
mkdir -p "$BACKUP_DIR"
mkdir -p "$CONFIG_DIR"

# --- Symlink .config directories ---
for item in "${CONFIGS[@]}"; do
  SRC="$DOTFILES_DIR/.config/$item"
  DEST="$CONFIG_DIR/$item"

  if [ -e "$DEST" ] || [ -L "$DEST" ]; then
    if [ "$FORCE" = true ]; then
      echo -e "${YELLOW}⚠️  Removing existing $item${RESET}"
      rm -rf "$DEST"
    else
      echo -e "${YELLOW}📦 Backing up existing $item to $BACKUP_DIR${RESET}"
      mv "$DEST" "$BACKUP_DIR/"
    fi
  fi

  echo -e "${GREEN}🔗 Linking $item${RESET}"
  ln -s "$SRC" "$DEST"
done

# --- Symlink shared directory ---
SHARED_SRC="$DOTFILES_DIR/shared"
SHARED_DEST="$HOME/shared"

if [ -d "$SHARED_SRC" ]; then
  if [ -e "$SHARED_DEST" ] || [ -L "$SHARED_DEST" ]; then
    if [ "$FORCE" = true ]; then
      echo -e "${YELLOW}⚠️  Removing existing ~/shared${RESET}"
      rm -rf "$SHARED_DEST"
    else
      echo -e "${YELLOW}📦 Backing up existing ~/shared${RESET}"
      mv "$SHARED_DEST" "$BACKUP_DIR/"
    fi
  fi

  echo -e "${GREEN}🔗 Linking shared folder → ~/shared${RESET}"
  ln -s "$SHARED_SRC" "$SHARED_DEST"
fi

# --- Symlink .zshrc ---
if [ -f "$DOTFILES_DIR/.zshrc" ]; then
  if [ -e "$HOME/.zshrc" ] || [ -L "$HOME/.zshrc" ]; then
    if [ "$FORCE" = true ]; then
      echo -e "${YELLOW}⚠️  Removing existing .zshrc${RESET}"
      rm -f "$HOME/.zshrc"
    else
      echo -e "${YELLOW}📦 Backing up existing .zshrc${RESET}"
      mv "$HOME/.zshrc" "$BACKUP_DIR/"
    fi
  fi

  echo -e "${GREEN}🔗 Linking .zshrc${RESET}"
  ln -s "$DOTFILES_DIR/.zshrc" "$HOME/.zshrc"
  echo -e "${CYAN}✨ .zshrc linked successfully!${RESET}"
fi

echo
echo -e "${GREEN}✅ Dotfiles setup complete!${RESET}"
if [ "$FORCE" = false ]; then
  echo -e "${CYAN}📦 Backups saved in: $BACKUP_DIR${RESET}"
fi
