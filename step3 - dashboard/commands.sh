kubectl create -f dashboard.yaml
kubectl create -f admin-user.yaml

kubectl get pods -n kubernetes-dashboard
kubectl get sa -n kubernetes-dashboard
kubectl describe sa dashboard-admin -n kubernetes-dashboard
kubectl describe secret dashboard-admin-token-[random] -n kubernetes-dashboard

# open http://localhost:8001/api/v1/namespaces/kubernetes-dashboard/services/https:kubernetes-dashboard:/proxy/

# info at https://kubernetes.io/docs/tasks/access-application-cluster/web-ui-dashboard/

kubectl proxy
