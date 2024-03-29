#!/bin/zsh

SESSIONS=$(\
  for f in $(find $TMUX_SESSIONS_PATH -name '*.sh' -not -name 'ta.sh'); \
  do echo $f | rev | cut -d'/' -f 1 | rev | cut -d'.' -f 1; \
  done \
  | gum choose)

if [ -z $SESSIONS ]; then
  echo "Ok bye!"
  exit
fi

zsh $TMUX_SESSIONS_PATH/$SESSIONS.sh

