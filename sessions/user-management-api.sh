#!/bin/zsh

SESSION_NAME="user-management-api"
PROJET_DIR="$HOME/Documents/user-management-api"

# Checking if the session already exists
tmux has-session -t $SESSION_NAME 2>/dev/null

if [ $? != 0 ]; then
  # Creating a new session
  tmux new-session -s $SESSION_NAME -d -c $PROJET_DIR

  # Creating a new window (first window is for nvim)
  tmux renamew nvim
  tmux neww -n 'build/dev' -c $PROJET_DIR

  # Splitting the window horizontally
  tmux splitw -h -c $PROJET_DIR

  # Switch to the left pane
  tmux selectp -t 0

  # Splitting the window vertically
  tmux splitw -v -c $PROJET_DIR

  # Going back to first winow since I probably want to start doing stuff
  tmux selectw -t 0
fi

# Attaching to the session
tmux a -t $SESSION_NAME
