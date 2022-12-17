#!/bin/bash
LOG="${HOME}/Library/Logs/dotfiles.log"
GITHUB_USER='mannjaro'
GITHUB_REPO='dotfiles'
DIR="/usr/local/opt/${GITHUB_REPO}"

_process() {
  echo "$(date) PROCESSING:  $@" >> $LOG
  printf "$(tput setaf 6) %s...$(tput sgr0)\n" "$@"
}

_success() {
  local message=$1
  printf "%s✓ Success:%s\n" "$(tput setaf 2)" "$(tput sgr0) $message"
}

download_dotfiles() {
  _process "→ Creating directory at ${DIR} and setting permissions"
  mkdir -p "${DIR}"

  _process "→ Downloading repository to /tmp directory"
  curl -#fLo /tmp/${GITHUB_REPO}.tar.gz "https://github.com/${GITHUB_USER}/${GITHUB_REPO}/tarball/main"

  _process "→ Extracting files to ${DIR}"
  tar -zxf /tmp/${GITHUB_REPO}.tar.gz --strip-components 1 -C "${DIR}"

  _process "→ Removing tarball from /tmp directory"
  rm -rf /tmp/${GITHUB_REPO}.tar.gz

  [[ $? ]] && _success "${DIR} created, repository downloaded and extracted"

  # Change to the dotfiles directory
  cd "${DIR}"
}

install_homebrew() {
  if [ ! -f /opt/homebrew/bin/brew ]
  then
    _process "Installing Homebrew"
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)"
  else
    _process "Homebrew already installed"
  fi
  _process "→ Running brew doctor"
  brew doctor
  _process "brew install packages"
  brew bundle --global
  [[ $? ]] && _success "brew and packages installed"
}

install_chezmoi() {
  if [ ! -f /opt/homebrew/bin/chezmoi ]
  then
    echo "Installing chezmoi..."
    brew install chezmoi
  else
    echo "chezmoi already installed."
  fi
  local prefix=$(brew --prefix)
  ${prefix}/bin/chezmoi init https://github.com/${GITHUB_USER}/${GITHUB_REPO}
  ${prefix}/bin/chezmoi -v apply
  [[ $? ]] && _success "dotfiles have copied"
}

install() {
  if [ "$(uname)" = 'Darwin' ];
  then
    install_homebrew
  fi
  install_chezmoi
}
# execute install scripts
install
