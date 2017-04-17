#!/usr/bin/env bash

#######################################
# CLI-SETOUP
# Installs CLI-tools
#######################################

#Bash Completion - autocomplete for Bash, if you still want to use that...
brew install bash-completion
touch ~/.bash_profile
echo "if [ -f $(brew --prefix)/etc/bash_completion ]; then" >> ~/.bash_profile
echo "  . $(brew --prefix)/etc/bash_completion" >> ~/.bash_profile
echo "fi" >> ~/.bash_profile
brew tap homebrew/completions

#install brew cask - CLI-installer for GUI apps
brew install cask homebrew/completions/brew-cask-completion

#wget - Grab remote files with a URL
brew install wget

#dockutil - CLI to manage dock items
brew install dockutil

#Git and Git Flow - add Git Flow extension to Git
#NOTE: git is already installed by default on OSX, but it's outdated, this ensures latest version and Bash Completion
brew install git git-flow

#Fish shell
brew install fish
echo "/usr/local/bin/fish" | sudo tee -a /etc/shells
chsh -s /usr/local/bin/fish #make fish shell default
curl -L https://get.oh-my.fish | fish
omf install brew git-flow osx pure
