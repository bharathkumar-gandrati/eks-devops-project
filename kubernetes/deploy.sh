#!/bin/sh

# Change directory to the location of the script
cd "$(dirname "$0")"

# Define paths to YAML files relative to the script's location
NAMESPACE_FILE="namespace.yaml"
DEPLOYMENT_FILE="deployment.yaml"
SERVICE_FILE="service.yaml"

# Apply Kubernetes resources using the defined paths
kubectl apply -f "$NAMESPACE_FILE"
kubectl apply -f "$DEPLOYMENT_FILE"
kubectl apply -f "$SERVICE_FILE"
