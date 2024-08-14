#!/usr/bin/env bash

# Copyright 2014 The Kubernetes Authors.
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

# Clean out the output directory on the docker host.
set -o errexit
set -o nounset
set -o pipefail

KUBE_ROOT=$(dirname "${BASH_SOURCE[0]}")/..
source "${KUBE_ROOT}/build/common.sh"

kube::build::verify_prereqs false
kube::build::clean

## Define the array of process names you want to search for
#PROCESS_NAMES=("kube-apiserver" "kube-controller-manager" "kube-scheduler" "kubelet" "kube-proxy" "kubectl")
#
## Loop through each process name
#for PROCESS_NAME in "${PROCESS_NAMES[@]}"; do
#  # Use ps -aux and grep to find the process
#  PROCESS_ID=$(ps -aux | grep "$PROCESS_NAME" | grep -v "grep" | awk '{print $2}')
#
#  # Check if the process was found
#  if [ -z "$PROCESS_ID" ]; then
#    echo "Process not found: $PROCESS_NAME"
#  else
#    echo "Process found: $PROCESS_NAME, PID: $PROCESS_ID"
#
#    # Kill the process
#    kill -9 $PROCESS_ID
#    echo "Process $PROCESS_NAME has been killed"
#  fi
#done



