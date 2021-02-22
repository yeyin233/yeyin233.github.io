#!/bin/bash -e

args=$1

if [ -z $args ]; then
    echo 'please input args'
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