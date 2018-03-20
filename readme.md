# Dotfiles

in general:

- ENV variables in `bash_profile`, aliases and helpers in `bashrc`
- minimal OS-agnostic stuff in the base files with a call to the OS-specific stuff at the bottom of each to add more functionality
- not yet sure if this works how I expect. the difference between login/non-login shells between OSX and Linux is pretty annoying.

## TODO!

- [X] make separate files for different OSes
    - ~~[ ] allow os-probing to determine which to use~~
    - [X] make script use appropriate file per OS (using two different scripts)
- [ ] allow for local [dotfile].local to overwrite the suggested global dotfile
  provided by this repo. What if I want to use solarized at work but smyck at
  home...?
    - [ ] probably would help to use an 'install' concept similar to how i'm
      using my scripts repo

## to use this set of dotfiles on another system

~~**note** - various things don't carry across OSes so cleanly. for instance, the `home` path between linux and os x (for timetrap, for example). Because of this, you'll need to update a few things locally after cloning this as well as after any updates :(~~  
I've fixed this now. The immediately next section is therefore less important if you're
using separate OS dotfiles.

### Things to check by OS:

- paths (`timetrap.yml`)
- clipboard things (`tmux.conf`)

### installing home directory files

The `makesymlinks-linux.sh` and `makesymlinks-nix.sh` files will use different dotfiles
source files appropriate to the OS indicated.  
To **denote this when creating dotfiles**: append `__osx` or `__nix` or whatever else
you want at the end, then put _those_ files in the filename array in the `makesymlinks-*`
script. It will trim off the `__whatever` at the end of the file and use the remainder.

```
cd ~/dotfiles
chmod +x makesymlinks-osx.sh
./makesymlinks-osx.sh
```

### install tmux-plugins

https://github.com/tmux-plugins/tpm

### install tmux-powerline

- https://github.com/erikw/tmux-powerline
- Copy `tmux-powerline-mytheme.sh` to `~/tmux-powerline/themes/mytheme.sh`
- Make sure to set the theme properly in `~/.tmux-powerlinerc`:  
```
  # The theme to use.
    export TMUX_POWERLINE_THEME="CHANGE_ME_TO_ABOVE"
  # ie: export TMUX_POWERLINE_THEME="mytheme"
```

and potentially install patched fonts:

https://github.com/powerline/fonts

### install git-aware-prompt

- https://github.com/jimeh/git-aware-prompt


### installing karabiner xml (and other configs that don't live in the user's root)

find your `~/Library/Application\ Support/Karabiner` directory. Delete or rename
the existing `private.xml` (it's just a placeholder) and then `ln -s
~/dotfiles/private.xml .` here.

Do the same for `~/.config/htop/htoprc` (for OS X)

## updating this collection

**When adding new dotfiles to this grouping that you intend to end up in your
home directory, be sure to add them to the files list in `makesymlinks.sh`**

## Ubuntu-specific stuff

### install xcape

- get it here: [https://github.com/alols/xcape](xcape repo)
- make sure to use the `get-ubuntu-keys` script from my scripts repo

### if using an Apple Magic Mouse:

- check out the `set-mouse` script in the scripts repo

# Problems?

- Make sure you're using the correct symlinks script for your OS
- Make sure necessary third-party applications and scripts are installed

-----

# other software to install

- tmux
- heroku cli
- irssi
