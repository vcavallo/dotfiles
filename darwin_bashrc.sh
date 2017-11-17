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
    local IGREEN="\[\e[0;30;102m\]"
    local WHITE_ON_RED="\[\e[0;1;41m\]"
    local ENDC="\[\e[0m\]" # ends a color declaration

    local USER="\u"
    local HOST="\H"
    local TIME="\t"
    local WORKING_PATH="\w"
    local DATE="\D{%Y-%m-%d}"
    # build the prompt variable here:
    local PROMPT="[ $LGRAY$USER@$HOST $IPURPLE$DATE, $TIME $ENDC] $IBLUE$WORKING_PATH\n$IGREEN\$git_branch$WHITE_ON_RED\$git_dirty$IBLUE \$$ENDC "

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
    # export NODE_PATH="/usr/local/lib/node_modules:$NODE_PATH"

    # export VIRTUALENVWRAPPER_PYTHON=/Library/Frameworks/Python.framework/Versions/3.5/bin/python3
    # export WORKON_HOME=~/Envs
    # source /usr/local/bin/virtualenvwrapper.sh
 
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
    export VAGRANT_HOME="/Volumes/vagrant-boxes/vagrant.d/" # if vagrant is on a USB
 
  # Paths
 
    # export USR_PATHS="/usr/games/bin:/usr/local:/usr/local/bin:/usr/local/sbin:/usr/bin"

    if [ -d "$HOME/bin" ] ; then
     PATH="$HOME/bin:$PATH"
    fi

# Helpful Functions
# =====================

  # case-insensitive auto-complete
  bind "set completion-ignore-case on"

  # show all if ambiguous
  bind "set show-all-if-ambiguous on"

  function dots {
    cd /Users/$USER/dotfiles/$@
  }

  function dev {
    cd /Users/$USER/development/$@
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
 
 
  # LS
   alias l="ls -lahG | cut -f 6- -d ' '"
  #  alias l="ls -lahG"
 
  # Git
  alias gst="git status"
 
  # CD
  alias cd..='cd ..'
 
  # Emacs
  alias emacs='emacs-24.3'
  alias em='emacs-24.3'
 
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
 
  # Git Bash Completion
  # Will activate bash git completion if installed
  # via homebrew
  if [ -f `brew --prefix`/etc/bash_completion ]; then
    . `brew --prefix`/etc/bash_completion
  fi

[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm"
export PATH="$HOME/.rvm/bin:$PATH" # Add RVM to PATH for scripting

echo "using Darwin-specific bashrc"
