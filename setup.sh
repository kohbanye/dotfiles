#!/bin/bash

RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
NC='\033[0m'

DOTFILES_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

create_symlink() {
  local src="$1"
  local dest="$2"

  if [ -e "$dest" ] || [ -L "$dest" ]; then
    echo -e "${YELLOW}⚠️ $dest already exists.${NC}"
    read -p " Overwrite? [y/N]:" -n 1 -r
    echo
    if [[ $REPLY =~ ^[Yy]$ ]]; then
      rm -rf "$dest"
    else
      echo -e "${RED}Skipped: $dest${NC}"
      return
    fi
  fi

  ln -s "$src" "$dest"
  echo -e "${GREEN}Symlink created: $dest -> $src${NC}"
}

echo "🚀 Setting up dotfiles..."

find "$DOTFILES_DIR" -maxdepth 1 -type f -name ".*" ! -name ".git*" | while read src; do
  filename=$(basename "$src")
  dest="$HOME/$filename"
  create_symlink "$src" "$dest"
done

read -p "🔧 Install packages? [y/N]:" -n 1 -r
echo
if [[ $REPLY =~ ^[Yy]$ ]]; then
  echo "Installing packages..."
  bash "$DOTFILES_DIR/install.sh"
fi

echo -e "\n🎉 ${GREEN}Done!${NC}"
