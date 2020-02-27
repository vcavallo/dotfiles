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

alias fzfp="fzf --preview 'head -100 {}'"

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

# export GOPATH=$HOME/go
# export PATH=$PATH:$GOPATH/bin

 # used for os-specific functions
 os=`uname -s`

 ~/.xsetwacom.sh

export GDK_SCALE=2
export GDK_DPI_SCALE=0.5

export PATH=$PATH:/opt/gradle/gradle-5.6.2/bin

export PATH=$PATH:/usr/bin/npm

# export LANG=en_NZ.ISO-8859-1

echo "base .bashrc has run"

 case $os in
   "Darwin" )
     source ~/dotfiles/darwin_bashrc.sh;;
   "Linux" )
     source ~/dotfiles/linux_bashrc.sh;;
 esac

export NVM_DIR="/home/vcavallo/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

[ -f ~/.fzf.bash ] && source ~/.fzf.bash
