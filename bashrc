

  # used for os-specific functions
  os=`uname -s`
   
  case $os in
    "Darwin" )
      source ~/dotfiles/darwin_bashrc.sh;;
    "Linux" )
      source ~/dotfiles/linux_bashrc.sh;;
  esac

  # This function is called in your prompt to output your active git branch.
  function parse_git_branch {
    git branch --no-color 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ (\1)/'
  }
 
  # This function builds your prompt. It is called below
  function prompt {
    # Define some local colors
    local         RED="\[\033[0;31m\]" # This syntax is some weird bash color thing I never
    local   LIGHT_RED="\[\033[1;31m\]" # really understood
    local        CHAR="♥"
    # ♥ ☆ - Keeping some cool ASCII Characters for reference
 
    # Here is where we actually export the PS1 Variable which stores the text for your prompt
    export PS1="\e]2;\u@\h\a\[\e[37;44;1m\]\t\[\e[0m\]$RED$(parse_git_branch) \e[0m[\[\e[32m\]\w\[\e[0m\]]\n\[\e[0;31m\]$ \[\e[0m\]"
      PS2='> '
      PS4='+ '
    }
 
  # Finally call the function and our prompt is all pretty
  prompt

## ~/.bashrc: executed by bash(1) for non-login shells.
## see /usr/share/doc/bash/examples/startup-files (in the package bash-doc)
## for examples

## Configuring The Prompt
## ======================
 
#  # This function is called in your prompt to output your active git branch.
#  function parse_git_branch {
#    git branch --no-color 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ (\1)/'
#  }
 
#  # This function builds your prompt. It is called below
#  function prompt {
#    # Define some local colors
#    local         RED="\[\033[0;31m\]" # This syntax is some weird bash color thing I never
#    local   LIGHT_RED="\[\033[1;31m\]" # really understood
#    local        CHAR="♥"
#    # ♥ ☆ - Keeping some cool ASCII Characters for reference
 
#    # Here is where we actually export the PS1 Variable which stores the text for your prompt
#    export PS1="\[\e]2;\u@\h\a[\[\e[37;44;1m\]\t\[\e[0m\]]$RED\$(parse_git_branch) \e[0m\][\[\e[32m\]\w\[\e[0m\]]\n\[\e[0;31m\]$ \[\e[0m\]"
#      PS2='> '
#      PS4='+ '
#    }
 
#  # Finally call the function and our prompt is all pretty
#  prompt

## Environment Variables
## =====================
#  # Library Paths
#  # These variables tell your shell where they can find certain
#  # required libraries so other programs can reliably call the variable name
#  # instead of a hardcoded path.
 
#    # NODE_PATH
#    # Node Path from Homebrew I believe
#    export NODE_PATH="/usr/local/lib/node_modules:$NODE_PATH"
 
#    # PYTHON_SHARE
#    # Python Shared Path from Homebrew I believe
#    # export PYTHON_SHARE='/usr/local/share/python' [I commented this out on 9/24/(2013?) for brew doctor message - VOC]
 
#    # Those NODE & Python Paths won't break anything even if you
#    # don't have NODE or Python installed. Eventually you will and
#    # then you don't have to update your bash_profile
 
#  # Configurations
 
#    # GIT_MERGE_AUTO_EDIT
#    # This variable configures git to not require a message when you merge.
#    export GIT_MERGE_AUTOEDIT='no'
 
#    # Editors
#    # Tells your shell that when a program requires various editors, use sublime.
#    # The -w flag tells your shell to wait until sublime exits
#    export VISUAL="vim -w"
#    export SVN_EDITOR="vim -w"
#    export GIT_EDITOR="vim -w"
#    export EDITOR="vim -w"
 
#  # Paths
 
#    # The USR_PATHS variable will just store all relevant /usr paths for easier usage
#    # Each path is seperate via a : and we always use absolute paths.
 
#    # A bit about the /usr directory
#    # The /usr directory is a convention from linux that creates a common place to put
#    # files and executables that the entire system needs access too. It tries to be user
#    # independent, so whichever user is logged in should have permissions to the /usr directory.
#    # We call that /usr/local. Within /usr/local, there is a bin directory for actually
#    # storing the binaries (programs) that our system would want.
#    # Also, Homebrew adopts this convetion so things installed via Homebrew
#    # get symlinked into /usr/local
#    export USR_PATHS="/usr/games/bin:/usr/local:/usr/local/bin:/usr/local/sbin:/usr/bin"
 
#    # Hint: You can interpolate a variable into a string by using the $VARIABLE notation as below.
 
#    # We build our final PATH by combining the variables defined above
#    # along with any previous values in the PATH variable.
 
#    # Our PATH variable is special and very important. Whenever we type a command into our shell,
#    # it will try to find that command within a directory that is defined in our PATH.
#    # Read http://blog.seldomatt.com/blog/2012/10/08/bash-and-the-one-true-path/ for more on that.
#    export PATH="$USR_PATHS:$PYTHON_SHARE:$PATH"
 
#    # If you go into your shell and type: $PATH you will see the output of your current path.
 
#    # export PATH="$PATH:/Users/vinney/bin"

## Helpful Functions
## =====================
 
#  # case-insensitive auto-complete
#  bind "set completion-ignore-case on"
   
#  # show all if ambiguous
#  bind "set show-all-if-ambiguous on"
   
#  # Functions to CD into folders from anywhere
#  # so you just type "folder-name".
#  # HINT: It uses the built in USER variable to know your OS X username
   
#  # USE: desktop
#  #      desktop subfolder

#  function desktop {
#    cd /Users/$USER/Desktop/$@
#  }
   
#  function dev {
#    cd /Users/$USER/development/$@
#  }
   
#  function nytm {
#    cd /Users/$USER/development/projects/clients/nytm/nytm-membership-v2/$@
#  }
   
#  function kpmg {
#    cd /Users/$USER/development/projects/clients/dopamine/kpmg_trivia/$@
#  }
   
#  function dopa {
#    cd /Users/$USER/development/projects/clients/dopamine/$@
#  }
   
#  function fin_lit {
#    cd /Users/$USER/development/projects/clients/dopamine/fin_lit/$@
#  }
   
#  function allegiance {
#    cd /Users/$USER/development/projects/clients/dopamine/allegiance/$@
#  }
   
#  function blog {
#    cd /Users/$USER/development/code/vcavallo.github.io/$@
#  }
   
#  function blog_posts {
#    cd /Users/$USER/development/code/vcavallo.github.io/source/_posts/$@
#  }
   
#  function flatiron {
#    cd /Users/$USER/flatiron/$@
#  }
   
#  # A function to easily grep for a matching process
#  # USE: psg postgres
#  function psg {
#    FIRST=`echo $1 | sed -e 's/^\(.\).*/\1/'`
#    REST=`echo $1 | sed -e 's/^.\(.*\)/\1/'`
#    ps aux | grep "[$FIRST]$REST"
#  }
   
#  # A function to extract correctly any archive based on extension
#  # USE: extract imazip.zip
#  #      extract imatar.tar
#  function extract () {
#      if [ -f $1 ] ; then
#          case $1 in
#              *.tar.bz2)  tar xjf $1      ;;
#              *.tar.gz)   tar xzf $1      ;;
#              *.bz2)      bunzip2 $1      ;;
#              *.rar)      rar x $1        ;;
#              *.gz)       gunzip $1       ;;
#              *.tar)      tar xf $1       ;;
#              *.tbz2)     tar xjf $1      ;;
#              *.tgz)      tar xzf $1      ;;
#              *.zip)      unzip $1        ;;
#              *.Z)        uncompress $1   ;;
#              *)          echo "'$1' cannot be extracted via extract()" ;;
#          esac
#      else
#          echo "'$1' is not a valid file"
#      fi
#  }
   
#  # A function to easily grep for a matching file
#  # USE: lg filename
#  function lg {
#    FIRST=`echo $1 | sed -e 's/^\(.\).*/\1/'`
#    REST=`echo $1 | sed -e 's/^.\(.*\)/\1/'`
#    ls -la | grep "[$FIRST]$REST"
#  }
   
#  # USE: new-repo repo-name
#  function new-repo () {
#    curl -u 'vcavallo' https://api.github.com/user/repos -d "{\"name\":\"$1\"}"
#  }
 
## Aliases
## =====================
 
#  # Rspec
#  alias rs="rspec"
 
#  # Ruby
#  alias rb="ruby"
	
#  # CS function
#          function cs () {
#                cd $1; ls "-lahG"
#  }	
 
#  # Touch and Go
#  create() {
#    touch $1
#    subl $1
#  }
 
#  # FTP to vinneycavallo.com
#  alias vcftp="ftp ftp://vcavallo@vinneycavallo.com"
 
#  # LS
#   alias l="ls -lahG | cut -f 6- -d ' '"
#  #  alias l="ls -lahG"
 
#  # Git
#  alias gst="git status"
#  alias gl="git pull"
#  alias gp="git push"
#  alias gd="git diff | mate"
#  alias gc="git commit -v"
#  alias gca="git commit -v -a"
#  alias gb="git branch"
#  alias gba="git branch -a"
 
#  # CD
#  alias cd..='cd ..'
#  alias cdbox='cd ~/Dropbox/computers'
 
#  # Emacs
#  alias emacs='emacs-24.3'
#  alias em='emacs-24.3'
 
#  # GREP
#  alias grep='grep -n --color=auto'
 
#  # Mou.app
#  alias mou="open /Applications/Mou.app"
 
#  # Restart POW server for this app
#  alias restart="touch tmp/restart.txt"
 
#  # pb - wrap c or v in `these` to evalute in the command
#  # pb copy
#  alias c="pbcopy"
 
#  # pb paste
#  alias v="pbpaste"
 
 
## Final Configurations and Plugins
## =====================
 
#  # free up control-s for forward history search
#  stty -ixon
 
#  # Git Bash Completion
#  # Will activate bash git completion if installed
#  # via homebrew
#  if [ -f `brew --prefix`/etc/bash_completion ]; then
#    . `brew --prefix`/etc/bash_completion
#  fi

#### stuff below was already here

# If not running interactively, don't do anything
case $- in
    *i*) ;;
      *) return;;
esac

# don't put duplicate lines or lines starting with space in the history.
# See bash(1) for more options
HISTCONTROL=ignoreboth

# append to the history file, don't overwrite it
shopt -s histappend

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
HISTSIZE=1000
HISTFILESIZE=2000

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# If set, the pattern "**" used in a pathname expansion context will
# match all files and zero or more directories and subdirectories.
#shopt -s globstar

# make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

# set variable identifying the chroot you work in (used in the prompt below)
if [ -z "${debian_chroot:-}" ] && [ -r /etc/debian_chroot ]; then
    debian_chroot=$(cat /etc/debian_chroot)
fi

# set a fancy prompt (non-color, unless we know we "want" color)
case "$TERM" in
    xterm-color) color_prompt=yes;;
esac

# uncomment for a colored prompt, if the terminal has the capability; turned
# off by default to not distract the user: the focus in a terminal window
# should be on the output of commands, not on the prompt
#force_color_prompt=yes

if [ -n "$force_color_prompt" ]; then
    if [ -x /usr/bin/tput ] && tput setaf 1 >&/dev/null; then
	# We have color support; assume it's compliant with Ecma-48
	# (ISO/IEC-6429). (Lack of such support is extremely rare, and such
	# a case would tend to support setf rather than setaf.)
	color_prompt=yes
    else
	color_prompt=
    fi
fi

if [ "$color_prompt" = yes ]; then
    PS1='${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$ '
else
    PS1='${debian_chroot:+($debian_chroot)}\u@\h:\w\$ '
fi
unset color_prompt force_color_prompt

# If this is an xterm set the title to user@host:dir
case "$TERM" in
xterm*|rxvt*)
    PS1="\[\e]0;${debian_chroot:+($debian_chroot)}\u@\h: \w\a\]$PS1"
    ;;
*)
    ;;
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

# Add an "alert" alias for long running commands.  Use like so:
#   sleep 10; alert
alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'

# Alias definitions.
# You may want to put all your additions into a separate file like
# ~/.bash_aliases, instead of adding them here directly.
# See /usr/share/doc/bash-doc/examples in the bash-doc package.

if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi

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

export PATH="$PATH:$HOME/.rvm/bin" # Add RVM to PATH for scripting
source ~/.rvm/scripts/rvm
