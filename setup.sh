#!/usr/bin/env bash

set -e

DOTFILES_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
CONFIG_DIR="$HOME/.config"

echo "🔧 Linking dotfiles..."

mkdir -p "$CONFIG_DIR"

for dir in "$DOTFILES_DIR/.config/"*; do
  name="$(basename "$dir")"
  target="$CONFIG_DIR/$name"

  echo "→ $name"

  rm -rf "$target"
  ln -s "$dir" "$target"
done

# .zshrc (optional)
if [ -f "$DOTFILES_DIR/.zshrc" ]; then
  echo "→ .zshrc"
  rm -f "$HOME/.zshrc"
  ln -s "$DOTFILES_DIR/.zshrc" "$HOME/.zshrc"
fi

echo "✅ Done"
