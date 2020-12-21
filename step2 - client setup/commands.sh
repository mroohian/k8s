scp root@172.16.16.100:/etc/kubernetes/admin.conf config

kubectl get nodes
kubectl cluster-info
kubectl get all -A

# info at https://kubernetes.io/docs/reference/kubectl/cheatsheet/

wget https://get.helm.sh/helm-v3.4.2-linux-amd64.tar.gz
chmod +x helm
mv helm /usr/local/bin
