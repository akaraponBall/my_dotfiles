# Utility commands
alias list='eza --icons=always -T --level=1'

# Kubernetes commands
alias kubectl='microk8s kubectl'
alias kubedash='kubectl -n kubernetes-dashboard port-forward svc/kubernetes-dashboard-kong-proxy 8443:443'

