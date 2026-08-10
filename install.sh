#!/usr/bin/env bash
set -euo pipefail

DOTFILES_DIR="$HOME/.config/dotfiles"
REPO_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

mkdir -p "$DOTFILES_DIR"

for dir in docker git helm kubectl; do
  mkdir -p "$DOTFILES_DIR/$dir"
  cp "$REPO_DIR/$dir/aliases.sh" "$DOTFILES_DIR/$dir/aliases.sh"
done

mkdir -p "$DOTFILES_DIR/tmux"
cp "$REPO_DIR/tmux/.tmux.conf" "$DOTFILES_DIR/tmux/.tmux.conf"

mkdir -p "$DOTFILES_DIR/vim"
cp "$REPO_DIR/vim/.vimrc" "$DOTFILES_DIR/vim/.vimrc"

ln -sf "$DOTFILES_DIR/tmux/.tmux.conf" "$HOME/.tmux.conf"
ln -sf "$DOTFILES_DIR/vim/.vimrc" "$HOME/.vimrc"

BASHRC="$HOME/.bashrc"
BLOCK_START="# >>> dotfiles aliases >>>"
BLOCK_END="# <<< dotfiles aliases <<<"

if ! grep -qF "$BLOCK_START" "$BASHRC"; then
  cat >> "$BASHRC" <<'EOF'

# >>> dotfiles aliases >>>
for file in "$HOME"/.config/dotfiles/*/aliases.sh; do
  [ -r "$file" ] && source "$file"
done
# <<< dotfiles aliases <<<
EOF
fi

echo "Installed dotfiles."
echo "Run: source ~/.bashrc"
