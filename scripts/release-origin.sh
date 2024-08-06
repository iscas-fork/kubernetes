#! /bin/bash
###############################################
##
##  Copyright (2024, ) Institute of Software
##      Chinese Academy of Sciences
##          wuheng@iscas.ac.cn
##
###############################################

url="https://api.github.com/repos/iscas-fork/kubernetes/releases"

function release()
{

data=$(cat <<EOF  
{
  "tag_name": "$1",  
  "name": "$1",  
  "draft": false, 
  "prerelease": false  
}
EOF
)

curl -X POST \
  -H 'Accept: application/vnd.github+json' \
  -H 'Authorization: token xxx' \
  -H 'X-GitHub-Api-Version: 2022-11-28' \
  $url \
  -d "$data"
}

tag="v1.29.3.1"
#release $tag

for name in `ls staging/src/k8s.io/`
do
  echo "staging/src/k8s.io/"$name"/"$tag
  release "staging/src/k8s.io/"$name"/"$tag
done
