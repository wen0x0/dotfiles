#!/usr/bin/env bash

# Core
alias d='docker'
alias di='docker images'
alias dp='docker ps'
alias dpa='docker ps -a'
alias dr='docker run'
alias dexec='docker exec'
alias db='docker build'

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

# System
alias ds='docker system'

# Inspect / debug
alias dins='docker inspect'
alias dstats='docker stats'
