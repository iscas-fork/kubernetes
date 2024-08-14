#!/bin/bash

# Define the array of process names you want to search for
PROCESS_NAMES=("kube-apiserver" "kube-controller-manager" "kube-scheduler" "kubelet" "kube-proxy" "kubectl")

# Loop through each process name
for PROCESS_NAME in "${PROCESS_NAMES[@]}"; do
  # Use ps -aux and grep to find the process
  PROCESS_ID=$(ps -aux | grep "$PROCESS_NAME" | grep -v "grep" | awk '{print $2}')

  # Check if the process was found
  if [ -z "$PROCESS_ID" ]; then
    echo "Process not found: $PROCESS_NAME"
  else
    echo "Process found: $PROCESS_NAME, PID: $PROCESS_ID"

    # Kill the process
    kill -9 $PROCESS_ID
    echo "Process $PROCESS_NAME has been killed"
  fi
done
