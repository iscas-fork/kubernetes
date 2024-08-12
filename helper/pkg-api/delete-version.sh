#! /bin/bash
###############################################
##
##  Copyright (2024, ) Institute of Software
##      Chinese Academy of Sciences
##          wuheng@iscas.ac.cn
##
###############################################

base_dir="../../pkg/apis"
exclude_dirs=("admission" "admissionregistration" "authentication" "authorization" "autoscaling" "certificates" "networking" "policy" "rbac" "storage" "testdata" "abac" "apidiscovery" "core" "apiserverinternal") 
target_dirs=("fuzzer" "helper" "install" "validation" "internalbootstrap" "util")

function delete_version()
{
  counter=0
  for item in "$1"/*; do
  #echo "this is $item"
  if [ -d "$item" ]; then
    name=$(basename "$item")
    echo "this is $name"
    if [[ " ${target_dirs[*]} " == *" $name "* ]]; then
       echo "  skip $item"
    else
       if [ "$counter" -eq 0 ]; then  
	  echo "  skip $item"
	  counter=$(expr $counter + 1)  
       else  
          echo "  delete $item"
	  rm -rf $item 
       fi
    fi
  fi
  done
}

function find_dir()
{
   for dir in $base_dir/*; do
     name=$(basename "$dir")
     if [[ " ${exclude_dirs[*]} " == *" $name "* ]]; then
       echo "" 
     else
       delete_version $dir
     fi
   done
}

find_dir
