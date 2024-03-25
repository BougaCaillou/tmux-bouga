#!/bin/zsh

SESSION_NAME="boto"
BOTO_DIR="$PROJECTS_DIR/material/packages/boto"
BOTO_DOC_DIR="$PROJECTS_DIR/material/apps/boto-doc"

# Checking if the session already exists
tmux has-session -t $SESSION_NAME 2>/dev/null

if [ $? != 0 ]; then
  # Creating a new session for boto
  tmux new-session -s $SESSION_NAME -d -c $BOTO_DIR

  # Creating a new window (first window is for nvim)
  tmux renamew nvim
  tmux neww -n 'build/dev' -c $BOTO_DIR

  # Splitting the window vertically
  tmux splitw -h -c $BOTO_DOC_DIR

  # Switch to the left pane
  tmux selectp -t 0

  # Splitting the left pane horizontally
  tmux splitw -v -c $BOTO_DIR

  # Going back to first winow since I probably want to start doing stuff
  tmux selectw -t 0
fi

# Attaching to the session
tmux a -t $SESSION_NAME
