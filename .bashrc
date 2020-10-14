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

# railsを強制終了するエイリアス
alias rails-server-kill="cat tmp/pids/server.pid > /dev/null 2>/dev/null && (cat tmp/pids/server.pid 2> /dev/null | xargs kill -9 2> /dev/null && echo \"[OK] Rails server was killed...\" || echo \"[NG] Already exit...\") || echo \"[NG] Move to rails root directory path.\""
