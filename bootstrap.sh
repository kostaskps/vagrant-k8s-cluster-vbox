#!/bin/bash

# Install required packages
echo "[TASK 1] Install required packages"
yum install -y nano wget


# Verify all the cluster component health statuses
#   kubectl get --raw='/readyz?verbose'

# Install Metrics server pod
#   kubectl apply -f https://raw.githubusercontent.com/techiescamp/kubeadm-scripts/main/manifests/metrics-server.yaml
# view metrics: kubectl top nodes