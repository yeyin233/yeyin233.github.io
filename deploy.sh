#!/bin/bash -e

args=$1

if [ -z $args ]; then
    echo 'please input args'
    echo './deploy.sh s  # run server to display pages'
    echo './deploy.sh d  # deploy pages to remote repo.'
    exit 1
fi

hexo clean
hexo generate

if [ $args = "s" ];then
    hexo server
else
    make -p public
    echo 'yaotingting.net' > public/CNAME
    hexo d
fi