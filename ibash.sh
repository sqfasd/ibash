#!/bin/bash

source "$BASH_IT/aliases.bash"
source "$BASH_IT/themes/sexy.theme.bash"
source "$BASH_IT/lib/composure.sh"
cite _about _param _example _group _author _version

function LoadAll() {
  local subdir="$1"
  if [ ! -d "$BASH_IT/$subdirectory" ]
  then
    continue
  fi
  local FILES="$BASH_IT/$subdir/*.bash"
  for file in $FILES
  do
    if [ -e "$file" ]; then
      source $file
    fi
  done
}

for file_type in "lib" "completion" "plugins"
do
  LoadAll $file_type
done
