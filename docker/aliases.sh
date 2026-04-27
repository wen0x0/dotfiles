#!/usr/bin/env bash

# =========================
# Docker Aliases - Productivity Boost
# =========================

# Core
alias d='docker'
alias di='docker images'
alias dp='docker ps'
alias dpa='docker ps -a'
alias dr='docker run'
alias de='docker exec -it'
alias db='docker build'
alias dba='docker build .'

# Container management
alias dstart='docker start'
alias dstop='docker stop'
alias drestart='docker restart'
alias drm='docker rm'
alias drma='docker rm $(docker ps -aq)'

# Image management
alias drmi='docker rmi'
alias drmia='docker rmi $(docker images -q)'

# Logs
alias dlogs='docker logs'
alias dlogf='docker logs -f'

# System / cleanup
alias ds='docker system'
alias dprune='docker system prune -f'
alias dprunea='docker system prune -a -f'

# Inspect / debug
alias dins='docker inspect'
alias dstats='docker stats'

# Quick workflow shortcuts
alias dex='docker exec -it'
alias dsh='docker exec -it $(docker ps -q | head -n 1) sh'
alias dbash='docker exec -it $(docker ps -q | head -n 1) bash'
