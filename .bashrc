#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias vi=nvim
alias ls='ls --color=auto'
PS1='[\u@\h \W]\$ '

export PATH=$PATH:~/.local/bin:~/.nimble/bin

# Autostart if not already in tmux.
if [[ ! -n $TMUX ]]; then
  tmux new-session
fi
