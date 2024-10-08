#!/bin/bash

if [[ $(minikube status) =~ "Running" ]]; then
  echo "Minikube is already running. Skipping minikube start."
else
  minikube start
fi
minikube status

kubectl apply -f k8s-resources/postgres-configmap.yaml
kubectl apply -f k8s-resources/postgres-persistent-volume.yaml
kubectl apply -f k8s-resources/postgres-persistent-volume-claim.yaml
kubectl apply -f k8s-resources/postgres-service.yaml
kubectl apply -f k8s-resources/postgres-deployment.yaml

#SCRIPT_DIR=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )
#minikube mount "$SCRIPT_DIR":/data/postgres