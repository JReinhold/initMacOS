#!/usr/bin/env bash
#######################################
# FUNCTIONS
# Used different install scripts
#######################################

# Highly readable echo to announce what is going on
announce () {
    echo " "
    echo "@@@@@@@@@@@@@@@@@@@@@@@@@@"
    echo "@"
    echo "@ $1"
    echo "@"
    echo "@@@@@@@@@@@@@@@@@@@@@@@@@@"
    echo " "
}

# utility to add an app to manually install to the appList.txt file on desktop
manual () {
    printf "MANUAL: $1\n" >> ~/Desktop/appList.txt
}

# Install tools with brew, and announce it
brewi () {
    announce "Installing $* with brew"
    brew install $*
    printf "INSTALLED: $*\n" >> ~/Desktop/appList.txt
}

# Install function, with notification support
# first parameter is app to install
caski () {
    announce "Installing $* with brew cask"
	if brew install --cask $* ; then
		terminal-notifier -message "$1 installed successfully 🎉🎈" -title "🍺 Cask Install" -sound default -timeout 10
        printf "INSTALLED: $*\n" >> ~/Desktop/appList.txt
	else
		printf "FAILED: $*\n" >> ~/Desktop/appList.txt
		terminal-notifier -message " ⛔️ $1 INSTALLATION FAILED" -title "⚠️  Cask Install" -sound default -timeout 10
	fi
}