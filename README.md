# Dotfiles

Personal Linux dotfiles for quickly setting up my shell environment.

Includes configurations and aliases for:

* Docker
* Git
* Helm
* kubectl
* tmux
* Vim

## Structure

```text
dotfiles/
├── docker/aliases.sh
├── git/aliases.sh
├── helm/aliases.sh
├── kubectl/aliases.sh
├── tmux/.tmux.conf
├── vim/.vimrc
├── install.sh
└── README.md
```

## Installation

Clone the repository and run the installer:

```bash
git clone <repository-url>
cd dotfiles

chmod +x install.sh
./install.sh
```

Then reload the shell:

```bash
source ~/.bashrc
```

The configurations are installed under:

```text
~/.config/dotfiles/
```

Symlinks are created for tmux and Vim:

```text
~/.tmux.conf -> ~/.config/dotfiles/tmux/.tmux.conf
~/.vimrc     -> ~/.config/dotfiles/vim/.vimrc
```

## Shell Aliases

Aliases are grouped by tool:

```text
docker/aliases.sh
git/aliases.sh
helm/aliases.sh
kubectl/aliases.sh
```

The installer adds the following block to `~/.bashrc`:

```bash
# >>> dotfiles aliases >>>

for file in "$HOME"/.config/dotfiles/*/aliases.sh; do
  [ -r "$file" ] && source "$file"
done

# <<< dotfiles aliases <<<
```

This automatically loads every `aliases.sh` under `~/.config/dotfiles`.

### Adding New Aliases

Create a new alias group:

```text
terraform/
└── aliases.sh
```

Add it to the directory list in `install.sh`:

```bash
for dir in docker git helm kubectl terraform; do
  ...
done
```

Then reinstall:

```bash
./install.sh
source ~/.bashrc
```

## Vim Plugins

[vim-plug](https://github.com/junegunn/vim-plug) is optional and is not installed by default.

Install it together with the dotfiles:

```bash
./install.sh --vim-plug
```

If vim-plug is already installed, it will be left unchanged.

Plugins are configured in `.vimrc`:

```vim
call plug#begin('~/.vim/plugged')

Plug 'author/plugin'

call plug#end()
```

Install configured plugins from Vim with:

```vim
:PlugInstall
```

## Updating

After changing the repository, simply run:

```bash
./install.sh
```

Or install vim-plug as well if it is missing:

```bash
./install.sh --vim-plug
```

The installer can be run multiple times safely:

* Installed configuration files are updated from the repository.
* tmux and Vim symlinks are recreated with `ln -sf`.
* The `.bashrc` aliases block is not duplicated.
* Existing vim-plug installations are preserved.

## Requirements

Required:

```text
bash
cp
ln
grep
```

Optional:

```text
curl    # installing vim-plug
vim     # Vim configuration
tmux    # tmux configuration
```
