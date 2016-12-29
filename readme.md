# Dotfiles

## TODO!

- [ ] make separate files for different OSes
    - [ ] allow os-probing to determine which to use
- [ ] allow for local [dotfile].local to overwrite the suggested global dotfile
  provided by this repo. What if I want to use solarized at work but smyck at
  home...?
    - [ ] probably would help to use an 'install' concept similar to how i'm
      using my scripts repo

## to use this set of dotfiles on another system

**note** - various things don't carry across OSes so cleanly. for instance, the `home` path between linux and os x (for timetrap, for example). Because of this, you'll need to update a few things locally after cloning this as well as after any updates :(

### Things to check by OS:

- paths (`timetrap.yml`)
- clipboard things (`tmux.conf`)

### installing home directory files

```
cd ~/dotfiles
chmod +x makesymlinks.sh
./makesymlinks.sh
```

### install tmux-plugins

https://github.com/tmux-plugins/tpm

### install tmux-powerline

- https://github.com/erikw/tmux-powerline
- Move `tmux-powerline-mytheme.sh` to `~/tmux-powerline/themes/`
- Make sure to set the theme properly in `~/.tmux-powerlinerc`:  
```
  # The theme to use.
    export TMUX_POWERLINE_THEME="CHANGE_ME_TO_ABOVE"
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
