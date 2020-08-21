#!/bin/bash
############################
# .make.sh
# This script creates symlinks from the home directory to any desired dotfiles in ~/dotfiles
############################

########## Variables

dir=~/dotfiles                    # dotfiles directory
olddir=~/dotfiles_old             # old dotfiles backup directory
files="\
  bash_profile\
  darwin_bashrc\
  linux_bashrc\
  bashrc\
  vimrc\
  gitconfig\
  gitignore\
  screenrc\
  falcon-tmux.conf\
  tmux.conf__nix\
  inputrc\
  htoprc\
  timetrap.yml__nix\
  Xmodmap\
  Xresources\
  xinitrc\
  xsetwacom.sh__nix\
  compton.conf\
  todo.cfg\
  tmux-powerlinerc"  # list of files/folders to symlink in homedir

##########

# create dotfiles_old in homedir
echo "Creating $olddir for backup of any existing dotfiles in ~"
mkdir -p $olddir
echo "...done"

# change to the dotfiles directory
echo "Changing to the $dir directory"
cd $dir
echo "...done"

# move any existing dotfiles in homedir to dotfiles_old directory, then create symlinks 
for file in $files; do
  echo "Moving existing $file (will use '${file%__*}') dotfile from ~ to $olddir"
    mv ~/.${file%__*} ~/dotfiles_old/
    echo "Creating symlink to $file (as '${file%__*}') in home directory."
    ln -s $dir/$file ~/.${file%__*}
done
