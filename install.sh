#!/usr/bin/env bash

function install_homebrew() {
    /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
    brew doctor
    #need to check nothing went wrong
}

function install_git() {
    brew install git
    git clone --depth=1 https://github.com/Bash-it/bash-it.git
    ~/.bash_it
    ~/.bash_it/install.sh
}

function install_java() {
    brew cask install java
    brew install gradle
    brew install maven
    brew install node
    npm install --global grunt-cli
    npm install --global gulp-cli
}

function install_chrome() {
    brew cask install google-chrome
}

function install_cloudfoundry_tools() {
    brew tap cloudfoundry/tap
    brew install cf-cli
    sudo gem install cf-uaac
    #need to figure how to automate pcfdev download
    echo "Please go to https://network.pivotal.io/ to download PCFDev"
}

function install_virtualization() {
    brew cask install docker
    brew install terraform
    brew cask install virtualbox
    brew cask install vagrant
    vagrant plugin install vagrant-vbguest
}

function install_utilities() {
    brew cask install 1password
    brew cask install flycut
    brew cask install iterm2
    brew cask install shiftit
    brew cask install flux
}

function install_communication_tools() {
    brew cask install screenhero
    brew cask install slack
}

function cloud_management_tools() {
    brew install ansible
    vagrant plugin install vagrant-puppet-install
}

function install_commandline_tools() {
    brew install jq
}
