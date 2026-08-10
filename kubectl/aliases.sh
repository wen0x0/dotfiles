#!/usr/bin/env bash

# Core
alias k='kubectl'
alias kg='kubectl get'
alias kd='kubectl describe'
alias kl='kubectl logs'
alias ke='kubectl edit'
alias ka='kubectl apply'
alias kdel='kubectl delete'
# kubectl exec [OPTIONS] POD -- COMMAND [ARGS...]
alias kexec='kubectl exec'

# Pods
alias kgp='kubectl get pods'
alias kdp='kubectl describe pod'

# Deployments
alias kgd='kubectl get deployments'
alias kdd='kubectl describe deployment'

# Services
alias kgs='kubectl get svc'
alias kds='kubectl describe svc'

# Nodes
alias kgn='kubectl get nodes'
alias kdn='kubectl describe node'

# Events 
alias kge='kubectl get events --sort-by=.metadata.creationTimestamp'

# YAML output 
alias kgy='kubectl get -o yaml'
alias kgw='kubectl get -o wide'
