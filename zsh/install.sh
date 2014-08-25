#!/bin/sh
#
# oh-my-zsh
#
# This installs oh-my-zsh

# Check for oh-my-zsh

if [ ! -d "$HOME/.oh-my-zsh" ]; then
  echo "  Installing Oh My Zsh for you."
  curl -L http://install.ohmyz.sh | sh
fi

exit 0