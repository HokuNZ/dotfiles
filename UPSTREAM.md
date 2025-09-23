# Upstream Synchronization Guide

This document tracks differences between this fork (HokuNZ/dotfiles) and the parent repository (rowan/dotfiles), and provides a plan for selective updates.

## Fork Philosophy
This fork (HokuNZ/dotfiles) maintains a minimal subset of the parent repository, with most packages and features commented out for a lean installation.

## Current Differences from Parent

### 1. Brewfile (apps/homebrew/Brewfile)
**Fork (minimal):**
- Most brew packages commented out (ack, cocoapods, coreutils, gh, etc.)
- Limited casks enabled (1password, browsers, productivity tools)
- All Mac App Store apps commented out

**Parent (full):**
- All brew packages active (30+ packages)
- Additional casks (audacity, calibre, canva, chronosync, etc.)
- Mac App Store apps active (1Blocker, Pixelmator Pro, Postico, etc.)
- PostgreSQL updated from v14 to v17

### 2. New Files in Parent
- `scripts/cleanup.zsh`: One-time cleanup script for Docker conflicts and deprecated taps
- `scripts/code.zsh`: VS Code configuration script
- `apps/postico/*.pgfav`: Database favorites for Postico app
- Parent has its own `CLAUDE.md` file

### 3. Enhanced Features in Parent
- `bin/dot` has `--upgrade` flag to upgrade Homebrew packages
- Updated terminal configuration with additional functions
- Ruby environment updated for newer rbenv
- System user defaults expanded
- Install script includes Rosetta installation for Apple Silicon

### 4. Recent Parent Changes (2024)
- Added Claude Code AI assistant integration
- Removed Docker from default installation
- Updated from PostgreSQL 14 to 17
- Added cleanup scripts for removing Docker remnants
- Enhanced error handling and user feedback

## Refresh Plan from Parent Repository

### Phase 1: Preparation
1. **Backup current state**: Create a branch to preserve current minimal configuration
2. **Review parent commits**: Analyze changes since last sync (approximately 20+ commits)
3. **Identify critical updates**: Security fixes, compatibility updates, bug fixes

### Phase 2: Selective Merge Strategy

#### Core Infrastructure Updates (Recommended)
- Update `bin/dot` with `--upgrade` flag
- Add `scripts/cleanup.zsh` for one-time fixes
- Update `scripts/install.zsh` with Rosetta installation
- Update PostgreSQL reference from v14 to v17 (keep commented)

#### Optional Additions (Review case-by-case)
- `scripts/code.zsh` for VS Code users
- System user defaults updates
- Terminal configuration enhancements

#### Skip/Defer (Not needed for minimal setup)
- Postico database favorites
- Uncommented Brewfile packages
- Parent's CLAUDE.md (keep fork-specific version)

### Phase 3: Implementation Steps
```bash
# 1. Create backup branch
git checkout -b pre-refresh-backup

# 2. Switch back to main
git checkout main

# 3. Fetch latest upstream
git fetch upstream

# 4. Cherry-pick specific commits or manually apply changes
# (Recommended: manual application to maintain minimal nature)

# 5. Test installation on clean environment if possible
```

### Phase 4: Testing Checklist
- [ ] `dot` command works with existing options
- [ ] `dot --upgrade` flag functions correctly
- [ ] Installation script runs without errors
- [ ] Brewfile maintains minimal package set
- [ ] No unintended packages get installed

## Recommended Immediate Actions
1. Apply critical bug fixes and compatibility updates
2. Keep Brewfile minimal but update version references
3. Add cleanup.zsh for potential Docker cleanup needs
4. Update dot command with --upgrade option
5. Keep fork-specific CLAUDE.md

## Sync Commands Reference
```bash
# View differences
git fetch upstream
git diff main upstream/main --stat

# Check specific file differences
git diff main upstream/main -- apps/homebrew/Brewfile

# View recent upstream commits
git log upstream/main --oneline -20

# Cherry-pick specific commit
git cherry-pick <commit-hash>

# Manual merge with careful review
git merge upstream/main --no-commit --no-ff
git status
# Review and selectively stage changes
git add -p
```