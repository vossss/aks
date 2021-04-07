#!/bin/bash
# =====================================
#     Author: voss
#     Email: 
#     HomePage: 
# =====================================

cd kubeconfig

helm init --kubeconfig ./kubeconfig --client-only --stable-repo-url http://mirror.azure.cn/kubernetes/charts/
helm repo add master https://mbbservicepreprod.azurecr.cn/helm/v1/repo --username mbbservicepreprod --password Np8pCy6T1gDuI9wC90iJ+SdTUP4B12qs
helm repo update

helm --kubeconfig ./kubeconfig upgrade certmanager master/h-109-cert-manager --tiller-namespace=kube-system \
    --set image.repository=https://mbbservicepreprod.azurecr.cn/certmanager/cert-manager-controller \
    --set image.tag=v0.10.1 \
    --install --namespace default
