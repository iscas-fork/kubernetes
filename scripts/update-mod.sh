#! /bin/bash
###############################################
##
##  Copyright (2024, ) Institute of Software
##      Chinese Academy of Sciences
##          wuheng@iscas.ac.cn
##
###############################################

# 设置搜索的起始目录  
# search_dir="../staging/src/k8s.io"  
search_dir="../staging/src/k8s.io"  
  
# 使用find命令查找所有包含go.mod文件的目录，并只输出这些目录的路径  
# 注意：-exec ... {} \; 中的 {} 表示find命令找到的每个文件/目录的路径  
# 我们使用-type f来找到文件，然后通过dirname来获取目录路径，并用sort -u去重  
find "$search_dir" -type f -name 'go.mod' -exec dirname {} \; | sort -u | while read -r dir; do  
    # 进入每个目录并执行go mod tidy  
    echo "Processing directory: $dir"  
    (cd "$dir" && go mod tidy)  
done

cd ../
go mod tidy
