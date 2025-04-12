#!/bin/bash
set -e

eval $(minikube docker-env)
docker build -t server:v1.0 .
docker pull alpine/curl

kubectl apply -f configmap.yaml -f deployment.yaml -f service.yaml -f daemonset.yaml -f cronjob.yaml

echo "Ожидание Deployment"
kubectl rollout status deployment/server-deployment

echo "Ожидание DaemonSet"
kubectl rollout status daemonset/server-daemonset

kubectl port-forward service/server-service 8080:80