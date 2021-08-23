# ArgoCD

## Installation

0. create kind01-clusetr
```bash
bash kind-with-registry.sh
```

<!-- 1. apply ingress-nginx
```bash
kubectl create -f ingress-ngnix
```
 
2. Install Kubedb oprater
Type the following into your shell:
```bash
helm repo add appscode https://charts.appscode.com/stable/
helm repo update
helm install kubedb-operator appscode/kubedb --version v2021.06.23 -n kube-system 
helm install kubedb-catalog  appscode/kubedb-catalog -f kubedb-values.yaml --version v2021.06.23 -n kube-system
``` -->
3. 
```bash
kubectl apply -f argocd-src.yaml
```
5. 
use the following command to install argocd instance:
```bash
helm repo add argo https://argoproj.github.io/argo-helm ; helm repo update
helm install argocd argo/argo-cd -f ./argocd-values.yaml --version=3.6.11 -n argocd

kubectl get pod -w
```

6. 
```bash
kubectl apply -f k8s-tools.yaml
Go  https://argocd.localhost/
```

7.
```bash
sudo curl -sSL -o /usr/local/bin/argocd https://github.com/argoproj/argo-cd/releases/latest/download/argocd-linux-amd64
sudo chmod +x /usr/local/bin/argocd

kubectl -n argocd get secret argocd-initial-admin-secret -o jsonpath="{.data.password}" | base64 -d

argocd login argocd.localhost --insecure --grpc-web
    Username: admin
    Passwrod: mSREsfvioljZISHm
argocd account update-password --server localhost:8080 --insecure --grpc-web
    *** Enter current password: mSREsfvioljZISHm
    *** Enter new password: admin
    *** Confirm new password: admin
    Password updated
    Context 'argocd.localhost' updated
```



8.
```bash
kubectl get pods --all-namespaces | grep metrics-serverdarkstore
kubectl get --raw /apis/metrics.k8s.io/v1beta1/namespaces/test/pods/busybox | jq
kubectl get --raw /apis/metrics.k8s.io/v1beta1/nodes/kind01-worker | jq

```