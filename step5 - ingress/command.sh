# metallb - https://metallb.universe.tf/installation/
kubectl edit configmap -n kube-system kube-proxy

## set ipvs.strictARP to true and save

kubectl apply -f https://raw.githubusercontent.com/metallb/metallb/v0.9.5/manifests/namespace.yaml
kubectl apply -f https://raw.githubusercontent.com/metallb/metallb/v0.9.5/manifests/metallb.yaml
## On first install only
kubectl create secret generic -n metallb-system memberlist --from-literal=secretkey="$(openssl rand -base64 128)"

kubectl create -f metallb-config.yaml

# ingress- nginx
helm repo add ingress-nginx https://kubernetes.github.io/ingress-nginx
helm repo update

helm install my-nginx ingress-nginx/ingress-nginx --set rbac.create=true