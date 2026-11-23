#!/usr/bin/env bash
# Symlinks these dotfiles into $HOME. Existing files are moved to *.backup first.
set -euo pipefail
DIR="$(cd "$(dirname "$0")" && pwd)"

link() {
  local src="$DIR/$1" dst="$HOME/$1"
  mkdir -p "$(dirname "$dst")"
  if [ -e "$dst" ] && [ ! -L "$dst" ]; then mv "$dst" "$dst.backup"; echo "backup: $dst.backup"; fi
  ln -sfn "$src" "$dst" && echo "linked: $dst"
}

for f in .zshrc .zprofile .gitconfig .config/starship.toml; do link "$f"; done
for d in kitty tmux fastfetch btop karabiner nvim linearmouse; do link ".config/$d"; done

if [ "${1:-}" = "--brew" ]; then brew bundle --file="$DIR/Brewfile"; fi
