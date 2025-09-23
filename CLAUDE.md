# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Repository Overview

This is a dotfiles repository for configuring macOS development environments. It uses a modular approach with separate apps for different tools and configurations.

## Key Commands

### Initial Setup
```bash
# Install XCode Command Line Tools first
xcode-select --install

# Clone and install
git clone https://github.com/HokuNZ/dotfiles.git ~/.dotfiles
cd ~/.dotfiles
source scripts/install.zsh
```

### Update Environment
```bash
dot  # Runs the complete update script
```

### Edit Dotfiles
```bash
dot --edit  # Opens dotfiles in $EDITOR
```

## Architecture

### Directory Structure
- `apps/`: Modular configurations for different applications
  - Each app directory contains config files, install scripts, and symlinks
  - `*.symlink` files are automatically linked to `$HOME`
  - `*.zsh` files are sourced in specific order (path → config → completion)
- `scripts/`: Core installation and update scripts
  - `install.zsh`: Initial setup for new environments
  - `update.zsh`: Updates existing environment (homebrew, macOS defaults, apps)
  - `homebrew.zsh`: Manages homebrew installation and packages
  - `terminal.zsh`: Configures terminal environment
- `bin/`: Executables added to PATH (includes `dot` command)
- `functions/`: Shell functions available globally

### Script Execution Order
1. **Path scripts** (`path.zsh`): Set up PATH variables
2. **Configuration scripts** (`*.zsh` excluding install/path/completion)
3. **Completion scripts** (`completion.zsh`): Set up autocomplete

### Key Environment Variables
- `$DOTFILES`: Points to `~/.dotfiles`
- `$PROJECTS`: Default project directory (`~/Documents/Code`)

## Working with This Repository

### Adding New Applications
Create a new directory under `apps/` with:
- `install.zsh`: Installation script (run by `dot`)
- `*.symlink`: Files to symlink to home directory
- `path.zsh`: PATH modifications
- `*.zsh`: Configuration scripts

### Homebrew Management
Edit `apps/homebrew/Brewfile` to manage packages, then run `dot` to apply changes.

### Syncing with Upstream
This is a fork that syncs with `rowan/dotfiles`. Use GitHub's "Fetch Upstream" feature to pull updates.