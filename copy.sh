#!/bin/sh
DOTFILES_DIR=~/.dotfiles
while read filepath
do
  mkdir -p `dirname $DOTFILES_DIR/$filepath`
  cp -r ~/$filepath $DOTFILES_DIR/$filepath
done < dotfiles.list
