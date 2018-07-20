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

  alias todo="todo.sh"

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

  alias mldl="cd $HOME/development/exnilio/skm/mldl"
  alias cc="cd $HOME/development/exnilio/skm/ccops"
 
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
  # TODO: removing this to debug
  # if [ -f `brew --prefix`/etc/bash_completion ]; then
  #   # . `brew --prefix`/etc/bash_completion
  # fi

# debug:
#echo "this is darwin_bashrc.sh"

echo "using Darwin-specific bashrc"

