
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
    #local TIME=`fmt_time` # this freezes the date...
    local DATETIME='\D{%a %b %d, %l:%M:%S%P}'
    local WORKING_PATH="\w"
    local DATE="\d"
    # build the prompt variable here:
    local PROMPT="$USER@$HOST $IPURPLE$DATETIME $ENDC> $IBLUE$WORKING_PATH\n$IYELLOW\$git_branch$BBLACK_ON_IGREEN\$git_dirty$IRED\$$ENDC "

    export PS1=$PROMPT
      PS2='> '
      PS4='+ '
  }

  # call the prompt function
  prompt

  # for tmux-powerline PWD and Git integration:
  PS1="$PS1"'$([ -n "$TMUX" ] && tmux setenv TMUXPWD_$(tmux display -p "#D" | tr -d %) "$PWD")'

  export GIT_MERGE_AUTOEDIT='no'

  export VISUAL="vim"
  export SVN_EDITOR="vim"
  export GIT_EDITOR="vim"
  export EDITOR="vim"

  export USR_PATHS="/usr/games/bin:/usr/local:/usr/local/bin:/usr/local/sbin:/usr/bin"


# Helpful Functions
# =====================

  # case-insensitive auto-complete
  bind "set completion-ignore-case on"

  # show all if ambiguous
  bind "set show-all-if-ambiguous on"

  # allows hitting <space> after `!!` to expand it and see what the command was
  bind Space:magic-space

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

  # Rspec
  alias rs="rspec"

  # CS function
  function cs () {
    cd $1; ls "-lahG"
  }	


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
  alias grep='grep --color=auto'

  alias z="cd ~/zettelkasten"

  # pb - wrap c or v in `these` to evalute in the command
  # pb copy
  alias c="xclip -i -selection c"
  alias v="xclip -o -selection c"

  # alias weather="curl wttr.in?nq1"
  # alias btc="curl rate.sx/btc@30d"

  output-list() { pacmd list-sinks | awk '/index/ || /name:/' ;}
  output-set() { 
    # list all apps in playback tab (ex: cmus, mplayer, vlc)
    inputs=($(pacmd list-sink-inputs | awk '/index/ {print $2}')) 
    # set the default output device
    pacmd set-default-sink $1 &> /dev/null
    # apply the changes to all running apps to use the new output device
    for i in ${inputs[*]}; do pacmd move-sink-input $i $1 &> /dev/null; done
  }
  output-playbacklist() { 
    # list individual apps
    echo "==============="
    echo "Running Apps"
    pacmd list-sink-inputs | awk '/index/ || /application.name /'

    # list all sound device
    echo "==============="
    echo "Sound Devices"
    pacmd list-sinks | awk '/index/ || /name:/'
  }
  output-playbackset() { 
    # set the default output device
    pacmd set-default-sink "$2" &> /dev/null
    # apply changes to one running app to use the new output device
    pacmd move-sink-input "$1" "$2" &> /dev/null
  }
  toggle-output() {
    output_lines=($(output-list | wc -l))
    let max_index=(output_lines/2 - 1)
    current_index=($(output-list | \grep -I '*' | \grep -Io '\([0-9]*\)'))
    let temp_index=(current_index + 1)

    if [ "$temp_index" -gt "$max_index" ];then
      new_index=0
    else
      new_index=$temp_index
    fi

    $(output-set $new_index)
  }

# free up control-s for forward history search
stty -ixon


## Add home bin to path
if [ -d "$HOME/bin" ] ; then
  PATH="$HOME/bin:$PATH"
fi

## Heroku
# export PATH="/usr/local/heroku/bin:$PATH"
# export PATH="$PATH:/home/$USER/bin"

unset GEM_HOME
# export PATH="$HOME/.rvm/bin:$PATH"

# add yarn global to path
if [ -d "$HOME/.yarn" ] ; then
  export PATH="$HOME/.yarn/bin:$PATH"
fi

alias fzfp="fzf --border --preview 'bat --style=numbers --color=always --line-range :500 {}'"

echo "linux bashrc has run"

NPM_PACKAGES="${HOME}/.npm-packages"
export PATH="$NPM_PACKAGES/bin:$PATH"
unset MANPATH
export MANPATH="$NPM_PACKAGES/share/man:$(manpath)"


echo "using Linux-specific bashrc"
