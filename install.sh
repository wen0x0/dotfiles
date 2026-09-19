#!/usr/bin/env bash

set -euo pipefail

readonly REPO_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
readonly DOTFILES_DIR="$HOME/.config/dotfiles"
readonly BASHRC="$HOME/.bashrc"

INSTALL_VIM_PLUG=false

for arg in "$@"; do
  case "$arg" in
    --vim-plug)
      INSTALL_VIM_PLUG=true
      ;;

    -h|--help)
      printf 'Usage: %s [--vim-plug]\n' "$0"
      exit 0
      ;;

    *)
      printf 'Unknown option: %s\n' "$arg" >&2
      printf 'Usage: %s [--vim-plug]\n' "$0" >&2
      exit 1
      ;;
  esac
done

install_bash_configs() {
  local source_dir="$REPO_DIR/bash"
  local target_dir="$DOTFILES_DIR/bash"
  local file

  mkdir -p "$target_dir"

  for file in "$source_dir"/*.sh; do
    [[ -f "$file" ]] || continue

    cp "$file" "$target_dir/"
    printf 'Installed Bash config: %s\n' "$(basename "$file")"
  done
}

install_tmux_config() {
  local source="$REPO_DIR/tmux/.tmux.conf"
  local target_dir="$DOTFILES_DIR/tmux"
  local target="$target_dir/.tmux.conf"

  [[ -f "$source" ]] || return 0

  mkdir -p "$target_dir"
  cp "$source" "$target"
  ln -sfn "$target" "$HOME/.tmux.conf"

  printf 'Installed tmux config.\n'
}

install_vim_config() {
  local source="$REPO_DIR/vim/.vimrc"
  local target_dir="$DOTFILES_DIR/vim"
  local target="$target_dir/.vimrc"

  [[ -f "$source" ]] || return 0

  mkdir -p "$target_dir"
  cp "$source" "$target"
  ln -sfn "$target" "$HOME/.vimrc"

  printf 'Installed Vim config.\n'
}

install_vim_plug() {
  local vim_plug="$HOME/.vim/autoload/plug.vim"

  if [[ -f "$vim_plug" ]]; then
    printf 'vim-plug is already installed.\n'
    return 0
  fi

  if ! command -v curl >/dev/null 2>&1; then
    printf 'Error: curl is required to install vim-plug.\n' >&2
    exit 1
  fi

  printf 'Installing vim-plug...\n'

  curl -fLo "$vim_plug" \
    --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

  printf 'Installed vim-plug.\n'
}

configure_bashrc() {
  local block_start="# >>> dotfiles bash >>>"
  local block_end="# <<< dotfiles bash <<<"

  touch "$BASHRC"

  if grep -qF "$block_start" "$BASHRC"; then
    printf '.bashrc is already configured.\n'
    return 0
  fi

  cat >> "$BASHRC" <<EOF

$block_start

for file in "\$HOME/.config/dotfiles/bash"/*.sh; do
  [[ -r "\$file" ]] && source "\$file"
done

<<<<<<< HEAD
# <<< dotfiles aliases <<<
=======
$block_end
>>>>>>> cfbc34e (feat: add some bash config)

EOF

  printf 'Configured .bashrc.\n'
}

main() {
  mkdir -p "$DOTFILES_DIR"

  install_bash_configs
  install_tmux_config
  install_vim_config

  if [[ "$INSTALL_VIM_PLUG" == true ]]; then
    install_vim_plug
  fi

  configure_bashrc

  printf '\nDotfiles installed successfully.\n'
  printf 'Run: source ~/.bashrc\n'
}

main "$@"
