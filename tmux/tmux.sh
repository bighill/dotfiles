#!/bin/bash

PROJ=foo

###

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"
cd $DIR

# Kill the tmux session if this script is run with the parameter "kill".
if [ "$1" = "kill" ]; then
  tmux kill-session -t $PROJ
  exit 0
fi

# Attach to session.
fn_att() {
  [ -n "${TMUX:-}" ] &&
    tmux switch-client -t "=$PROJ" ||
    tmux attach-session -t "=$PROJ"
}

# If session already exists, attach and quit.
if tmux has-session -t "=$PROJ" 2> /dev/null; then
  fn_att
  exit 0
fi

# Create 4 pane session
fn_4_pane() {
  # Create new session
  tmux new-session -d -s $PROJ

  # Split 2 rows & move to top row
  tmux split-window -v
  tmux select-pane -U

  # Top left pane
  tmux send-keys 'echo "Im top left"' Enter

  # Top right pane
  tmux split-window -h
  tmux send-keys 'echo "Im top right"' Enter

  # Bottom left pane
  tmux select-pane -D
  tmux send-keys 'echo "Im bottom left"' Enter

  # Bottom right pane
  tmux split-window -h
  tmux send-keys 'echo "Im bottom right"' Enter
}

# Create 2 pane x 2 window session
fn_2_pane_2_window() {
  # Create new session
  tmux new-session -d -s $PROJ

  # Window 0, top pane
  tmux send-keys 'echo "Im top of window 0"' Enter

  # Window 0, bottom pane
  tmux split-window -v
  tmux send-keys 'echo "Im bottom of window 0"' Enter

  # Window 1, top pane
  tmux new-window
  tmux send-keys 'echo "Im top of window 1"' Enter

  # Window 1, bottom pane
  tmux split-window -v
  tmux send-keys 'echo "Im bottom of window 1"' Enter

  # Switch back to initial window
  tmux select-window -t $PROJ:0
}

# Split 4 panes in 2 windows for small screen devices
# or default to 4 panes in 1 window
if [ "$1" = "small" ]; then
  fn_2_pane_2_window
else
  fn_4_pane
fi

# Attach to new session
fn_att
