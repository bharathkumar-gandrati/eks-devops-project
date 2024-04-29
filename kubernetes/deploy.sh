#!/bin/sh

# Change directory to the location of the script
cd "$(dirname "$0")"

kubectl apply -f namespace.yaml
kubectl apply -f deployment.yaml
kubectl apply -f service.yaml