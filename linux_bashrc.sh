# Configuring The Prompt
# ======================

  # This function is called in your prompt to output your active git branch.
  function parse_git_branch {
    git branch --no-color 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ (\1)/'
  }

  if [ -d ~/.bash/git-aware-prompt ]; then
    export GITAWAREPROMPT=~/.bash/git-aware-prompt
    source "${GITAWAREPROMPT}/main.sh"
  else
    echo "git-aware prompt not installed"
    echo "get it here: https://github.com/jimeh/git-aware-prompt"
  fi

  # thanks brett terpstra:
  fmt_time () { #format time just the way I likes it
      if [ `date +%p` = "PM" ]; then
          meridiem="pm"
      else
          meridiem="am"
      fi
      date +"%l:%M:%S$meridiem"|sed 's/ //g'
  }

  # This function builds your prompt. It is called below
  function prompt {
    # Define some local colors
    # \[ is the opening of a non-printing element
    # \e starts every color block
    # ii;cc;bb i = bold, c = color, b = background
    # m ends all colors blocks
    # \] closes a non-printing element
    local RED="\[\e[0;31m\]"
    local IRED="\[\e[0;91m\]"
    local LIGHT_RED="\[\e[1;31m\]"
    local BLUE="\[\e[0;34m\]"
    local IBLUE="\[\e[0;94m\]"
    local YELLOW="\[\e[0;33m\]"
    local IYELLOW="\[\e[1;93m\]"
    local IPURPLE="\[\e[0;95m\]"
    local LGRAY="\[\e[0;37m\]"
    local BBLACK_ON_IGREEN="\[\e[0;30;102m\]"
    local ENDC="\[\e[0m\]" # ends a color declaration

    local USER="\u"
    local HOST="\h"
    local TIME=`fmt_time`
    local WORKING_PATH="\w"
    local DATE="\d"
    # build the prompt variable here:
    local PROMPT="[ $LGRAY$USER@$HOST $IPURPLE$DATE, $TIME $ENDC] $IBLUE$WORKING_PATH\n$IYELLOW\$git_branch$BBLACK_ON_IGREEN\$git_dirty$IRED\$$ENDC "

    export PS1=$PROMPT
      PS2='> '
      PS4='+ '
  }

  # call the prompt function
  prompt

  # for tmux-powerline PWD and Git integration:
  PS1="$PS1"'$([ -n "$TMUX" ] && tmux setenv TMUXPWD_$(tmux display -p "#D" | tr -d %) "$PWD")'

# Environment Variables
# =====================
  # Library Paths
  # These variables tell your shell where they can find certain
  # required libraries so other programs can reliably call the variable name
  # instead of a hardcoded path.

    # NODE_PATH
    # Node Path from Homebrew I believe
    export NODE_PATH="/usr/local/lib/node_modules:$NODE_PATH"

    # PYTHON_SHARE
    # Python Shared Path from Homebrew I believe
    # export PYTHON_SHARE='/usr/local/share/python' [I commented this out on 9/24/(2013?) for brew doctor message - VOC]

    # Those NODE & Python Paths won't break anything even if you
    # don't have NODE or Python installed. Eventually you will and
    # then you don't have to update your bash_profile

  # Configurations

    # GIT_MERGE_AUTO_EDIT
    # This variable configures git to not require a message when you merge.
    export GIT_MERGE_AUTOEDIT='no'

    # Editors
    # Tells your shell that when a program requires various editors, use sublime.
    # The -w flag tells your shell to wait until sublime exits
    export VISUAL="vim"
    export SVN_EDITOR="vim"
    export GIT_EDITOR="vim"
    export EDITOR="vim"

  # Paths

    # The USR_PATHS variable will just store all relevant /usr paths for easier usage
    # Each path is seperate via a : and we always use absolute paths.

    # A bit about the /usr directory
    # The /usr directory is a convention from linux that creates a common place to put
    # files and executables that the entire system needs access too. It tries to be user
    # independent, so whichever user is logged in should have permissions to the /usr directory.
    # We call that /usr/local. Within /usr/local, there is a bin directory for actually
    # storing the binaries (programs) that our system would want.
    # Also, Homebrew adopts this convetion so things installed via Homebrew
    # get symlinked into /usr/local
    export USR_PATHS="/usr/games/bin:/usr/local:/usr/local/bin:/usr/local/sbin:/usr/bin"

    # Hint: You can interpolate a variable into a string by using the $VARIABLE notation as below.

    # We build our final PATH by combining the variables defined above
    # along with any previous values in the PATH variable.

    # Our PATH variable is special and very important. Whenever we type a command into our shell,
    # it will try to find that command within a directory that is defined in our PATH.
    # Read http://blog.seldomatt.com/blog/2012/10/08/bash-and-the-one-true-path/ for more on that.
    export PATH="$USR_PATHS:$PYTHON_SHARE:$PATH"

    # If you go into your shell and type: $PATH you will see the output of your current path.

    export PATH="$PATH:/home/$USER/bin"

# Helpful Functions
# =====================

  # case-insensitive auto-complete
  bind "set completion-ignore-case on"

  # show all if ambiguous
  bind "set show-all-if-ambiguous on"

  # Functions to CD into folders from anywhere
  # so you just type "folder-name".
  # HINT: It uses the built in USER variable to know your OS X username

  # USE: desktop
  #      desktop subfolder

  function desktop {
    cd /home/$USER/Desktop/$@
  }

  function dotfiles {
    cd /home/$USER/dotfiles/$@
  }

  function dev {
    cd /home/$USER/development/$@
  }

  function wu {
    cd /home/$USER/development/exnilio/walkup/$@
  }

  function nytm {
    cd /home/$USER/development/projects/clients/nytm/nytm-membership-v2/$@
  }

  function kpmg {
    cd /home/$USER/development/projects/clients/dopamine/kpmg_trivia/$@
  }

  function dopa {
    cd /home/$USER/development/projects/clients/dopamine/$@
  }

  function fin_lit {
    cd /home/$USER/development/projects/clients/dopamine/fin_lit/$@
  }

  function allegiance {
    cd /home/$USER/development/projects/clients/dopamine/allegiance/$@
  }

  function dotfiles {
    cd /home/$USER/dotfiles/$@
  }

  # A function to easily grep for a matching process
  # USE: psg postgres
  function psg {
    FIRST=`echo $1 | sed -e 's/^\(.\).*/\1/'`
    REST=`echo $1 | sed -e 's/^.\(.*\)/\1/'`
    ps aux | grep "[$FIRST]$REST"
  }

  # A function to extract correctly any archive based on extension
  # USE: extract imazip.zip
  #      extract imatar.tar
  function extract () {
      if [ -f $1 ] ; then
	  case $1 in
	      *.tar.bz2)  tar xjf $1      ;;
	      *.tar.gz)   tar xzf $1      ;;
	      *.bz2)      bunzip2 $1      ;;
	      *.rar)      rar x $1        ;;
	      *.gz)       gunzip $1       ;;
	      *.tar)      tar xf $1       ;;
	      *.tbz2)     tar xjf $1      ;;
	      *.tgz)      tar xzf $1      ;;
	      *.zip)      unzip $1        ;;
	      *.Z)        uncompress $1   ;;
	      *)          echo "'$1' cannot be extracted via extract()" ;;
	  esac
      else
	  echo "'$1' is not a valid file"
      fi
  }

  # A function to easily grep for a matching file
  # USE: lg filename
  function lg {
    FIRST=`echo $1 | sed -e 's/^\(.\).*/\1/'`
    REST=`echo $1 | sed -e 's/^.\(.*\)/\1/'`
    ls -la | grep "[$FIRST]$REST"
  }

  # USE: new-repo repo-name
  function new-repo () {
    curl -u 'vcavallo' https://api.github.com/user/repos -d "{\"name\":\"$1\"}"
  }

# Aliases
# =====================

  # Rspec
  alias rs="rspec"

  # Ruby
  alias rb="ruby"
	
  # CS function
	  function cs () {
		cd $1; ls "-lahG"
  }	

  alias vpn='/opt/cisco/anyconnect/bin/vpn'

  # Touch and Go
  create() {
    touch $1
    vim $1
  }

  # LS
   alias l="ls -lahG | cut -f 6- -d ' '"
  #  alias l="ls -lahG"

  # Git
  alias gst="git status"
  alias gl="git pull"
  alias gp="git push"
  alias gd="git diff | mate"
  alias gc="git commit -v"
  alias gca="git commit -v -a"
  alias gb="git branch"
  alias gba="git branch -a"

  # CD
  alias cd..='cd ..'

  # GREP
  alias grep='grep -n --color=auto'

  # Restart POW server for this app
  alias restart="touch tmp/restart.txt"

  # pb - wrap c or v in `these` to evalute in the command
  # pb copy
  alias c="pbcopy"

  # pb paste
  alias v="pbpaste"

# Final Configurations and Plugins
# =====================

  # free up control-s for forward history search
  stty -ixon

  #setxkbmap -option ctrl:swapcaps

[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm"

export PATH="$HOME/.rvm/bin:$PATH" # Add RVM to PATH for scripting
eval "$(rbenv init -)"

export PATH="$HOME/.rbenv/bin:$PATH"
eval "$(rbenv init -)"

export PATH="$HOME/.rbenv/plugins/ruby-build/bin:$PATH"

echo "using Linux-specific bashrc"
