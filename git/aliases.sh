#!/usr/bin/env bash

# Basic shortcuts
alias g='git'
alias gs='git status'
alias ga='git add'
alias gaa='git add .'
alias gc='git commit'
alias gcm='git commit -m'
alias gca='git commit --amend'
alias gcan='git commit --amend --no-edit'
alias gm='git merge'
alias gmt='git mergetool'
alias grb='git rebase'

# Branching
alias gb='git branch'
alias gba='git branch -a'
alias gco='git checkout'
alias gsw='git switch'

# Logs
alias gl='git log'
alias glo='git log --oneline --graph --decorate'

# Remote
alias gps='git push'
alias gpl='git pull'
alias gf='git fetch'

# Diff
alias gd='git diff'
alias gds='git diff --staged'

# Reset / cleanup
alias gr='git reset'
alias grh='git reset --hard'
alias grs='git reset --soft'
alias gclean='git clean'

# Stash
alias gst='git stash'
alias gstp='git stash pop'
alias gstd='git stash drop'
alias gstl='git stash list'
