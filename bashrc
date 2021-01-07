killbg() {
  kill -9 $(jobs -p);
}

# If not running interactively, don't do anything
case $- in
    *i*) ;;
      *) return;;
esac

# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto'
    #alias dir='dir --color=auto'
    #alias vdir='vdir --color=auto'

    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
fi

# some more ls aliases
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'

# for making sure node_modules is ignored globally!
export FZF_DEFAULT_COMMAND='ag --ignore node_modules -g ""'
# ctrl-y to copy filename to clipboard
export FZF_DEFAULT_OPTS="--bind='ctrl-y:execute-silent(echo {+} | xclip -sel clip)'"
export FZF_CTRL_T_COMMAND=$FZF_DEFAULT_COMMAND

alias fzfp="fzf --preview 'bat --style=numbers --color=always --line-range :500 {}'"

alias n="neuron"
alias z="cd ~/zettelkasten"
alias d="todo.sh -d ~/.todo.cfg"
alias vim="nvim" # goodbye, old friend.
alias r7fe="cd ~/code/r7feed-web-client"
alias r7be="cd ~/code/r7feed-api"
alias jssp="cd ~/code/jssp-af"
alias ldxbe="cd ~/code/ldx-api"
alias ldxfe="cd ~/code/ldx-api/ldx-frontend"

alias rserver="ruby -run -ehttpd"

export TODO_DIR=/home/vcavallo/Dropbox
export TODO_FILE="$TODO_DIR/todo.txt"
export TODO_DONE_FILE="$TODO_DIR/todo-done.txt"
export TODO_REPORT_FILE="$TODO_DIR/todo-report.txt"
export TODO_ACTIONS_DIR="$HOME/.config/todo-txt/actions"
export TODOTXT_DEFAULT_ACTION=ls
export TODOTXT_PRIORITY_ON_ADD=Z

# enable programmable completion features (you don't need to enable
# this, if it's already enabled in /etc/bash.bashrc and /etc/profile
# sources /etc/bash.bashrc).
if ! shopt -oq posix; then
  if [ -f /usr/share/bash-completion/bash_completion ]; then
    . /usr/share/bash-completion/bash_completion
  elif [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
  fi
fi

if [ -f /etc/bash_completion ]; then
  . /etc/bash_completion
fi

source "/etc/profile.d/rvm.sh"

# also need to symlink ~/Dropbox/.timetrap/.timetrap.db to ~/.timetrap.db because the autocomplete script assumes ~/.timetrap.db
source /home/vcavallo/.rvm/gems/ruby-2.5.3/gems/timetrap-1.15.2/completions/bash/timetrap-autocomplete.bash 

# debug:
# echo "this is bashrc"

# this is the root folder where all globally installed node packages will  go
# export NPM_PACKAGES="/usr/local/npm_packages"
# export NODE_PATH="$NPM_PACKAGES/lib/node_modules:$NODE_PATH"
# add to PATH
# export PATH="$NPM_PACKAGES/bin:$PATH"

# export PATH="/home/vcavallo/local/bin:$PATH"
export PATH="/home/vcavallo/.rbenv/bin:$PATH"
export PATH="/home/vcavallo/.rbenv/shims:$PATH"

export PATH="/home/vcavallo/bin:$PATH"
export PATH="/home/vcavallo/scripts:$PATH"
export PATH=$PATH:/usr/local/go/bin

export GOPATH=$HOME/go
export GOROOT=/usr/local/go
export GOBIN=$GOPATH/bin
export PATH=$PATH:$GOBIN

# used for os-specific functions
os=`uname -s`

# ~/.xsetwacom.sh

export GDK_SCALE=2
export GDK_DPI_SCALE=0.5

export PATH=$PATH:/opt/gradle/gradle-5.6.2/bin

export PATH=$PATH:/usr/bin/npm
export PATH=$PATH:$HOME/.npm-global/bin

# export LANG=en_NZ.ISO-8859-1

source ~/scripts/set-title.sh

echo "base .bashrc has run"

 case $os in
   "Darwin" )
     source ~/dotfiles/darwin_bashrc.sh;;
   "Linux" )
     source ~/dotfiles/linux_bashrc.sh;;
 esac

#. /home/vcavallo/.nix-profile/etc/profile.d/nix.sh

if [ -e /home/vcavallo/.nix-profile/etc/profile.d/nix.sh ]; then . /home/vcavallo/.nix-profile/etc/profile.d/nix.sh; fi # added by Nix installer

export NVM_DIR="/home/vcavallo/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

[ -f ~/.fzf.bash ] && source ~/.fzf.bash
