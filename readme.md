# Dotfiles

## to use this set of dotfiles on another system

### installing home directory files

```
cd ~/dotfiles
chmod +x makesymlinks.sh
./makesymlinks.sh
```

### installing karabiner xml

find your `~/Library/Application\ Support/Karabiner` directory. Delete or rename
the existing `private.xml` (it's just a placeholder) and then `ln -s
~/dotfiles/private.xml .` here.

## updating this collection

**When adding new dotfiles to this grouping that you intend to end up in your
home directory, be sure to add them to the files list in `makesymlinks.sh`**
