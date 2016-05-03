# Dotfiles

## TODO!

- [ ] allow for local [dotfile].local to overwrite the suggested global dotfile
  provided by this repo. What if I want to use solarized at work but smyck at
  home...?
    - [ ] probably would help to use an 'install' concept similar to how i'm
      using my scripts repo

## to use this set of dotfiles on another system

### installing home directory files

```
cd ~/dotfiles
chmod +x makesymlinks.sh
./makesymlinks.sh
```

### install tmux-plugins

https://github.com/tmux-plugins/tpm

### installing karabiner xml

find your `~/Library/Application\ Support/Karabiner` directory. Delete or rename
the existing `private.xml` (it's just a placeholder) and then `ln -s
~/dotfiles/private.xml .` here.

## updating this collection

**When adding new dotfiles to this grouping that you intend to end up in your
home directory, be sure to add them to the files list in `makesymlinks.sh`**

## Ubuntu-specific stuff

### install xcape

- get it here: [https://github.com/alols/xcape](xcape repo)
- make sure to use the `get-ubuntu-keys` script from my scripts repo

### if using an Apple Magic Mouse:

- check out the `set-mouse` script in the scripts repo
