#!/usr/bin/env bash

BASE_DIR="$( cd "$( dirname "$0" )" && pwd)"

function install_homebrew() {
    /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
    brew doctor
    if [ "$?" -ne 0 ]; then 
        echo "Something is wrong with brew! ^^^^^^^^^^^"
        exit 1
    fi
}

function install_git() {
    brew tap git-duet/tap
    brew install git
    git clone --depth=1 https://github.com/Bash-it/bash-it.git $BASE_DIR/../bash_it
    $BASE_DIR/../bash_it/install.sh -s
    brew install git-duet
    brew install git-secrets
}

function install_programming_tools() {
    brew tap caskroom/versions
    brew cask install java8
    brew install gradle
    brew install maven
    brew install node
    npm install --global grunt-cli
    npm install --global gulp-cli
    brew install go
    brew install rbenv
}

function install_chrome() {
    brew cask install google-chrome
}

function install_cloudfoundry_tools() {
    brew tap cloudfoundry/tap
    brew install cf-cli
    brew install bosh-cli
    sudo gem install cf-uaac
}

function install_virtualization() {
    brew cask install docker
    brew cask install virtualbox
    brew cask install vagrant
    vagrant plugin install vagrant-vbguest
}

function install_utilities() {
    brew cask install 1password
    brew cask install flycut
    brew cask install iterm2
    brew cask install shiftit
    brew cask install postman
    brew cask install macdown
    brew cask install jxplorer
    brew cask install keystore-explorer
    brew cask install dropbox
}

function install_communication_tools() {
    brew cask install slack
}

function cloud_management_tools() {
    brew install terraform
    brew install packer
    brew install ansible
    brew install awscli
    brew install vault
}

function install_commandline_tools() {
    brew install jq
    brew install nmap
    brew install openssl
    brew install tmux
}
