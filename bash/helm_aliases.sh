#!/usr/bin/env bash

# Core
alias h='helm'
alias hi='helm install'
alias hu='helm upgrade'
alias hui='helm upgrade --install'
alias hr='helm rollback'
alias hse='helm search'
alias hser='helm search repo'

# Charts
alias hct='helm create'
alias hlt='helm lint'
alias hpl='helm pull'

# Releases
alias hl='helm list'
alias hla='helm list --all-namespaces'
alias hs='helm status'
alias hg='helm get'
alias hgv='helm get values'
alias hga='helm get all'

# Debug / inspect
alias htpl='helm template'
alias hsv='helm show values'
alias hsc='helm show chart'

# Uninstall
alias hd='helm uninstall'

# Quick workflow shortcuts
alias hh='helm history'
