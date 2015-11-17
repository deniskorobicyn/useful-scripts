#!/bin/bash

set -o nounset
set -o errexit

bin_dir=~/bin
dir=$(pwd)

cd ../helpers
files=`git ls-tree --name-only master`

rm -rf $bin_dir

if ! grep -q "# init bin" ~/.bash_profile; then
  echo "
  # init bin
  PATH=\$PATH:\$HOME/bin
  export PATH" >> ~/.bash_profile
fi

mkdir -p $bin_dir
for file in $files
do
	cp "$file" "$bin_dir/$file"
        chmod +x "$bin_dir/$file"
done

cd $dir

