#!/bin/sh
DOTFILES_DIR=~/.dotfiles
while read filepath
do
  ORG_PATH=$DOTFILES_DIR/$filepath
  LINK_PATH=~/$filepath
  mkdir -p `dirname $LINK_PATH`
  if [ -e $LINK_PATH -a ! -L $LINK_PATH ]; then
    mv ${LINK_PATH} ${LINK_PATH}.`date +"%Y%m%d"`
  fi
  ln -fs $ORG_PATH $LINK_PATH
done < dotfiles.list
