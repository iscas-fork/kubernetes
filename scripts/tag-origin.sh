#! /bin/bash
###############################################
##
##  Copyright (2024, ) Institute of Software
##      Chinese Academy of Sciences
##          wuheng@iscas.ac.cn
##
###############################################

base="v1.29.3-iscas"

tag="v1.29.3.2"

push="$tag"

git tag $tag

for name in `ls ../staging/src/k8s.io/`
do
  echo "staging/src/k8s.io/"$name"/"$tag
  git tag "staging/src/k8s.io/"$name"/"$tag
  push=$push" staging/src/k8s.io/"$name"/"$tag
done

echo $push
git push origin  $push
