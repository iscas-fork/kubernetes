#! /bin/bash
###############################################
##
##  Copyright (2024, ) Institute of Software
##      Chinese Academy of Sciences
##          wuheng@iscas.ac.cn
##
###############################################

base_dir="../../staging/src/k8s.io/client-go"
exclude_dirs=("admission" "admissionregistration" "authentication" "authorization" "autoscaling" "certificates" "networking" "policy" "rbac" "storage" "testdata") 
target_dirs=("applyconfigurations" "informers" "listers" "kubernetes/typed")

function delete_version()
{
  counter=0
  for item in "$1"/*; do
  if [ -d "$item" ]; then
    name=$(basename "$item")
    if [[ " ${exclude_dirs[*]} " == *" $2 "* ]]; then
       echo "skip $item"
    else
       if [ "$counter" -eq 0 ]; then  
	  echo "skip $item"
	  counter=$(expr $counter + 1)  
       else  
          echo "delete $item" 
	  rm -rf $item 
       fi
    fi
  fi
  done
}

function find_dir()
{
   for root_dir in "${target_dirs[@]}"; do
       for dir in "$base_dir"/$root_dir/*; do  
       if [ -d "$dir" ]; then  
         #echo $(basename "$dir")
         delete_version $dir $(basename "$dir")
       fi
       done 
   done
}

find_dir
