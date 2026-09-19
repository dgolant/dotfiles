#!/bin/sh

ITERM2_DYNAMIC_PROFILES_DIR="$HOME/Library/Application Support/iTerm2/DynamicProfiles"

mkdir -p "$ITERM2_DYNAMIC_PROFILES_DIR"
ln -sf "$DOTFILES_DIR/config/iterm2/DynamicProfiles/dotfiles.json" "$ITERM2_DYNAMIC_PROFILES_DIR/dotfiles.json"
