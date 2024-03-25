#!/bin/zsh

SESSION_NAME="k8s"
KUBERNETES_DIR="$PROJECTS_DIR/kubernetes-config"

# Checking if the session already exists
tmux has-session -t $SESSION_NAME 2>/dev/null

if [ $? != 0 ]; then
  # Creating a new session for Kubernetes
  tmux new-session -s $SESSION_NAME -d -c $KUBERNETES_DIR
  tmux renamew 'cyber-0ps'

  # Splitting the window vertically
  tmux splitw -h -t $SESSION_NAME -c $KUBERNETES_DIR

  # Switch to the left pane
  tmux selectp -t 0

  # Splitting the left pane horizontally
  tmux splitw -v -t $SESSION_NAME -c $KUBERNETES_DIR

  # Initiate connection to the bastion in the right pane
  tmux selectp -t 2
  tmux send-keys "bastion" C-m
fi

# Attaching to the session
tmux a -t $SESSION_NAME
