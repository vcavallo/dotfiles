if [ -f ~/.bashrc ]; then
  source ~/.bashrc
fi
export PATH="/usr/local/opt/qt@5.5/bin:$PATH"

if [ -f ~/.Xmodmap ]; then
  xmodmap ~/.Xmodmap
fi

# Setting PATH for Python 3.5
# The original version is saved in .bash_profile.pysave
PATH="/Library/Frameworks/Python.framework/Versions/3.5/bin:${PATH}"
export PATH
