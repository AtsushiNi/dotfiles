export PATH=$PATH:/Users/atsushi/projects/sales/.nodebrew/current/bin
export PATH="$HOME/.anyenv/bin:$PATH"
source $HOME/.git-prompt.sh
source $HOME/.git-completion.bash

GIT_PS1_SHOWDIRTYSTATE=true
export PS1='\[\w\[\033[31m\]$(__git_ps1)\[\033[00m\]\n\$ '
[ -f ~/.fzf.bash ] && source ~/.fzf.bash

# ls color
alias ls='ls -G'
export LSCOLORS=gxfxcxdxbxegedabagacad

export PROMPT_COMMAND='echo -ne "\033]0;${PWD##*/}\007"'
