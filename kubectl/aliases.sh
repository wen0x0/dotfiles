#!/usr/bin/env bash

# =========================
# Kubectl Aliases - Productivity Boost
# =========================

# Core
alias k='kubectl'
alias kg='kubectl get'
alias kd='kubectl describe'
alias kl='kubectl logs'
alias ke='kubectl edit'
alias kap='kubectl apply -f'
alias kdel='kubectl delete'

# Context / cluster
alias kctx='kubectl config current-context'
alias kctxs='kubectl config get-contexts'
alias kuse='kubectl config use-context'

# Namespace
alias kns='kubectl config set-context --current --namespace'
alias kgns='kubectl get namespaces'

# Pods
alias kgp='kubectl get pods'
alias kgpw='kubectl get pods -w'
alias kdp='kubectl describe pod'
alias klog='kubectl logs -f'
alias kexec='kubectl exec -it'

# Deployments
alias kgd='kubectl get deployments'
alias kdd='kubectl describe deployment'
alias krs='kubectl rollout status'
alias kru='kubectl rollout undo'

# Services
alias kgs='kubectl get svc'
alias kds='kubectl describe svc'

# Nodes
alias kgn='kubectl get nodes'
alias kdn='kubectl describe node'

# Events 
alias kge='kubectl get events --sort-by=.metadata.creationTimestamp'

# Quick debugging combo
alias ktop='kubectl top pod'
alias ktopn='kubectl top node'

# YAML output 
alias kgy='kubectl get -o yaml'
alias kgo='kubectl get -o wide'
