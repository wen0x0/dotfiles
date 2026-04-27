#!/usr/bin/env bash

# =========================
# Git Aliases - Productivity Boost
# =========================

# Basic shortcuts
alias g='git'
alias gs='git status'
alias ga='git add'
alias gaa='git add .'
alias gc='git commit'
alias gcm='git commit -m'
alias gca='git commit --amend'
alias gcan='git commit --amend --no-edit'

# Branching
alias gb='git branch'
alias gba='git branch -a'
alias gco='git checkout'
alias gcb='git checkout -b'
alias gsw='git switch'
alias gswc='git switch -c'

# Logs
alias gl='git log'
alias glo='git log --oneline --graph --decorate --all'
alias glp='git log -p'

# Remote
alias gp='git push'
alias gpf='git push --force-with-lease'
alias gpl='git pull'
alias gf='git fetch'

# Diff
alias gd='git diff'
alias gds='git diff --staged'

# Reset / cleanup
alias gr='git reset'
alias grh='git reset --hard'
alias gclean='git clean -fd'

# Stash
alias gst='git stash'
alias gstp='git stash pop'
alias gstd='git stash drop'
alias gstl='git stash list'

# Status + quick workflow combo
alias gss='git status -sb'
alias gac='git add . && git commit'
