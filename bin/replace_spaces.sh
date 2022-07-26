#!/bin/bash

# Taken from
# https://vitux.com/how-to-replace-spaces-in-filenames-with-underscores-on-the-linux-shell/

for f in *
do
  new="${f// /_}"
  if [ "$new" != "$f" ]
  then
    if [ -e "$new" ]
    then
      echo not renaming \""$f"\" because \""$new"\" already exists
    else
      echo moving "$f" to "$new"
    mv "$f" "$new"
  fi
fi
done
