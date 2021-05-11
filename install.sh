#!/bin/bash
# =====================================
#     Author: voss
#     Email: 
#     HomePage: 
# =====================================


ls -lR

cd kubeconfig

pwd

export KUBECONFIG=`pwd`/kubeconfig

wget https://github.com/Azure/kubelogin/releases/download/v0.0.9/kubelogin-linux-amd64.zip
unzip kubelogin-linux-amd64.zip
cp bin/linux_amd64/kubelogin /usr/local/bin/

export AAD_SERVICE_PRINCIPAL_CLIENT_ID=xxxxxxxxx
export AAD_SERVICE_PRINCIPAL_CLIENT_SECRET=xxxxxxxxxxxxxxx

kubectl get po -A

helm init --kubeconfig ./kubeconfig --client-only --stable-repo-url http://mirror.azure.cn/kubernetes/charts/
helm repo add master https://acrshsbootstrap.azurecr.cn/helm/v1/repo --username xxxxx --password xxxxxxx+sbQ0PrOWGC
helm repo update

# helm repo add minio https://helm.min.io/
# helm repo update
# helm install --namespace=minio minio minio/minio --tiller-namespace=kube-system 

helm --kubeconfig ./kubeconfig upgrade certmanager master/h-109-cert-manager --tiller-namespace=kube-system \
    --version v0.10.1 \
    --set image.repository=mbbservicepreprod.azurecr.cn/certmanager/cert-manager-controller \
    --set image.tag=v0.10.1 \
    --install --namespace default
