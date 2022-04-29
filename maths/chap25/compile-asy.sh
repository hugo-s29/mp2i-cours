#/bin/bash

cwd=$(pwd)

file=$(basename $1)
dir=$(dirname $1)

cd $dir

asy $file || exit -1

cd $cwd
