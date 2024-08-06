#! /bin/bash
###############################################
##
##  Copyright (2024, ) Institute of Software
##      Chinese Academy of Sciences
##          wuheng@iscas.ac.cn
##
###############################################

git remote add upstream git@github.com:k3s-io/kubernetes.git
git fetch upstream
git fetch --tags upstream
git push origin --tags
git push -f origin refs/remotes/upstream/*:refs/heads/*


