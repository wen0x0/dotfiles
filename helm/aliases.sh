#!/usr/bin/env bash

# =========================
# Helm Aliases - Productivity Boost
# =========================

# Core Helm
alias h='helm'
alias hi='helm install'
alias hu='helm upgrade'
alias hui='helm upgrade --install'
alias hr='helm rollback'
alias hs='helm search repo'
alias hsr='helm search repo'
alias hse='helm search repo --regexp'

# Charts
alias hct='helm create'
alias hlt='helm lint'
alias hpl='helm pull'
alias hup='helm repo update'

# Releases
alias hls='helm list'
alias hlsa='helm list --all-namespaces'
alias hst='helm status'
alias hgt='helm get'
alias hgv='helm get values'
alias hga='helm get all'

# Debug / inspect
alias htpl='helm template'
alias hval='helm show values'
alias hsch='helm show chart'
alias hschr='helm show readme'

# Repo management
alias hrepo='helm repo'
alias hrepoa='helm repo add'
alias hrepou='helm repo update'
alias hrepol='helm repo list'

# Uninstall
alias hd='helm uninstall'

# Quick workflow shortcuts
alias hh='helm history'
alias hdiff='helm diff upgrade'   # requires helm-diff plugin
alias hdeps='helm dependency update'
