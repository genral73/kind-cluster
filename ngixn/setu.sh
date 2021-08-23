helm repo add ingress-nginx https://kubernetes.github.io/ingress-nginx
helm repo update

helm install [RELEASE_NAME] ingress-nginx/ingress-nginx

 helm pull ingress-nginx/ingress-nginx --version 3.35.0