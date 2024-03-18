# Change the value of RECIPEPREFIX to something other than a tab character.
.RECIPEPREFIX = >

all: install

# Installing this tmux config assumres your config file is located at ~/.tmux.conf
install:
> echo "Installing tmux config..."
> cp tmux.conf ~/.tmux.conf
> echo "Done!"

# This takes the config from ~/.tmux.conf and copies it to the current directory
save:
> echo "Saving tmux config..."
> cp ~/.tmux.conf tmux.conf
> echo "Done!"

