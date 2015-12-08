#!/bin/bash

#set -e

last_dir=`pwd`
current_dir="$(cd "$(dirname "$0")" && pwd)"

common_dir=$current_dir/../../common

common_dir=`readlink -f $common_dir`
ln -sf $common_dir/.vimrc ~/.vimrc
mkdir -p ~/.vimtemp
cd $last_dir

