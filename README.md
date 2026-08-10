# Dotfiles

Personal dotfiles and shell configurations for quickly setting up a Linux environment.

The repository contains shell aliases and configuration files for tools I commonly use, including:

* Docker
* Git
* Helm
* kubectl
* tmux
* Vim

The included `install.sh` script installs the configurations into `~/.config/dotfiles` and creates the required symlinks.

## Repository Structure

```text
dotfiles/
├── docker/
│   └── aliases.sh
├── git/
│   └── aliases.sh
├── helm/
│   └── aliases.sh
├── kubectl/
│   └── aliases.sh
├── tmux/
│   └── .tmux.conf
├── vim/
│   └── .vimrc
├── install.sh
└── README.md
```

## Installation

Clone the repository:

```bash
git clone <repository-url>
cd dotfiles
```

Make the installer executable if necessary:

```bash
chmod +x install.sh
```

Then run:

```bash
./install.sh
```

After installation, reload the shell configuration:

```bash
source ~/.bashrc
```

### Install with vim-plug

The Vim configuration supports plugins managed by [vim-plug](https://github.com/junegunn/vim-plug).

To install the dotfiles together with vim-plug:

```bash
./install.sh --vim-plug
```

If vim-plug is already installed, the installer will leave the existing installation unchanged.

Without this option:

```bash
./install.sh
```

only the dotfiles are installed.

## Installation Layout

The installer copies the repository configuration files into:

```text
~/.config/dotfiles/
```

Resulting in:

```text
~/.config/dotfiles/
├── docker/
│   └── aliases.sh
├── git/
│   └── aliases.sh
├── helm/
│   └── aliases.sh
├── kubectl/
│   └── aliases.sh
├── tmux/
│   └── .tmux.conf
└── vim/
    └── .vimrc
```

This keeps the installed configurations in one centralized location.

## Shell Aliases

Aliases are organized by tool:

```text
docker/aliases.sh
git/aliases.sh
helm/aliases.sh
kubectl/aliases.sh
...
```

During installation, the following block is automatically added to `~/.bashrc`:

```bash
# >>> dotfiles aliases >>>

for file in "$HOME"/.config/dotfiles/*/aliases.sh; do
  [ -r "$file" ] && source "$file"
done

# <<< dotfiles aliases <<<
```

This automatically loads every `aliases.sh` file under:

```text
~/.config/dotfiles/*/aliases.sh
```

Because aliases are discovered dynamically, new alias groups can be added without modifying `.bashrc`.

For example:

```text
dotfiles/
└── terraform/
    └── aliases.sh
```

After adding the directory to the installer, the aliases will automatically be sourced by `.bashrc`.

vim-plug is optional and is not installed by default.

Install it together with the dotfiles using:

```bash
./install.sh --vim-plug
```

It will be installed at:

```text
~/.vim/autoload/plug.vim
```

Vim plugins managed by vim-plug are stored under:

```text
~/.vim/plugged/
```

Plugins can be added between `plug#begin()` and `plug#end()`:

```vim
call plug#begin(~/.vim/plugged)

Plug 'author/plugin'

call plug#end()
```

Then install configured plugins from Vim with:

```vim
:PlugInstall
```

## Updating

After changing files in this repository, run the installer again:

```bash
./install.sh
```

or, when vim-plug should also be installed if missing:

```bash
./install.sh --vim-plug
```

The installer overwrites the installed configuration files with the versions from the repository.

The tmux and Vim symlinks are recreated safely using:

```bash
ln -sf
```

The `.bashrc` aliases block is only added if it does not already exist, so running the installer multiple times does not duplicate it.

## Adding New Aliases

Create a new directory containing an `aliases.sh` file.

For example:

```text
terraform/
└── aliases.sh
```

Add the directory to the installer:

```bash
for dir in docker git helm kubectl terraform; do
  mkdir -p "$DOTFILES_DIR/$dir"
  cp "$REPO_DIR/$dir/aliases.sh" "$DOTFILES_DIR/$dir/aliases.sh"
done
```

Run:

```bash
./install.sh
source ~/.bashrc
```

The new aliases will then be loaded automatically.

## Requirements

Basic requirements:

```text
bash
cp
ln
grep
```

For installing vim-plug:

```text
curl
```

Vim and tmux are only required if their respective configurations are going to be used.

