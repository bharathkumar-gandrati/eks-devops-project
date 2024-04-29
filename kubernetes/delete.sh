#!/bin/sh

# Change directory to the location of the script
cd "$(dirname "$0")"

# Define paths to YAML files relative to the script's location
NAMESPACE_FILE="namespace.yaml"
DEPLOYMENT_FILE="deployment.yaml"
SERVICE_FILE="service.yaml"

# Apply Kubernetes resources using the defined paths
kubectl delete -f "$NAMESPACE_FILE"
kubectl delete -f "$DEPLOYMENT_FILE"
kubectl delete -f "$SERVICE_FILE"
