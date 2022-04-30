#!/bin/sh

set -eu

cd ~

# Install Homebrew
if [ ! -f /opt/homebrew/bin/brew ]
	then
		echo "Installing Homebrew..."
		/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)"
	else
		echo "Homebrew already installed."
fi

# Install chezmoi
if [ ! -f /opt/homebrew/bin/chezmoi ]
	then
		echo "Installing chezmoi..."
		brew install chezmoi
	else
		echo "chezmoi already installed."
fi

echo "Clone dotfiles..."
chezmoi init https://github.com/mannjaro/dotfiles && chezmoi apply

echo "Brew install packages"
brew bundle --global

echo "Install ZIM"
curl -fsSL https://raw.githubusercontent.com/zimfw/install/master/install.zsh | zsh

