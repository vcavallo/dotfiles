# echo "using Linux-specific bash_profile - which sources bashrc next..."

if [ -f $HOME/.bashrc ]; then
  source $HOME/.bashrc
fi

