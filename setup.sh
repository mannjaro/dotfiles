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

echo "Brew install packages"
brew bundle --global

bw login --quiet "takuson2525zt@gmail.com" $BW_PASS

echo "Clone dotfiles..."
chezmoi init https://github.com/mannjaro/dotfiles && chezmoi -v apply

bw logout

echo "Install ZIM"
if [ ! ~/.zim ]
	then
		echo "Install ZIM..."
		curl -fsSL https://raw.githubusercontent.com/zimfw/install/master/install.zsh | zsh
	else
		echo "ZIM already installed."
fi
