#!/bin/sh
while read filepath
do
  ls -l ~/$filepath
done < dotfiles.list
