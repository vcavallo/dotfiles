#!/bin/sh

session="vss"

# set up tmux
tmux start-server

tmux new-session -d -s $session

# first window is only vim
tmux selectp -t 1
tmux send-keys "cd ~/development/vss-rails-vue;vim ." C-m

# second window called 'srv'
tmux new-window -t $session:2 -n srv
tmux select-window -t $session:2
# start rails server
tmux send-keys "cd ~/development/vss-rails-vue" C-m
tmux send-keys "bin/rails s" C-m

# split and start webpack
tmux splitw -h -p 50
tmux send-keys "cd ~/development/vss-rails-vue" C-m
tmux send-keys "bin/webpack-dev-server" C-m

# split below that and start rails console
tmux splitw -v -p 50
tmux send-keys "cd ~/development/vss-rails-vue" C-m
tmux send-keys "bin/rails c" C-m

# create a new window called 'meta'
tmux new-window -t $session:3 -n meta

# start htop and timetrap on the left
tmux selectp -t 1
tmux splitw -h -p 50
tmux selectp -t 1
tmux send-keys "htop" C-m
tmux selectp -t 1
tmux splitw -v -p 50
tmux selectp -t 2
tmux send-keys "t" C-m

# start bare vim on the right
tmux selectp -t 3
tmux send-keys "vim" C-m

# return to first window
tmux select-window -t $session:1

# attach to tmux session
tmux attach-session -t $session
