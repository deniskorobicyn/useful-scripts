#!/bin/bash

cur_dir=${PWD##*/}

if ! [[ -f .kateproject ]]; then
  touch .kateproject
  echo "
{
  \"name\": \"$cur_dir\", \"files\": [ {  }]
}
" > .kateproject
fi

if [[ -d ".git" ]]; then
  echo "
.kateproject
.kateproject.d/
*.kate-swp\n
    " >> .git/info/exclude
fi 

