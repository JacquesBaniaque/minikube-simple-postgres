#!/bin/bash

if [[ $(minikube status) =~ "Running" ]]; then
  echo "Minikube is already running. Skipping minikube start."
else
  minikube start
fi
minikube status

kubectl patch pv postgres-volume -p '{"metadata":{"finalizers":null}}'
kubectl patch pvc postgres-volume-claim -p '{"metadata":{"finalizers":null}}'

kubectl delete -f k8s-resources/postgres-deployment.yaml
kubectl delete -f k8s-resources/postgres-service.yaml
kubectl delete -f k8s-resources/postgres-persistent-volume-claim.yaml
kubectl delete -f k8s-resources/postgres-persistent-volume.yaml
kubectl delete -f k8s-resources/postgres-configmap.yaml
