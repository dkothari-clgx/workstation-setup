#!/usr/bin/env bash

BASE_DIR="$( cd "$( dirname "$0" )" && pwd)"

function retry () {
    exit_status="0"
    for i in $(seq 1 $2); do
        eval $1
        exit_status="$?"
        if [ "$exit_status" = "0" ]; then
            break;
        fi
    done
    if [ $exit_status -ne "0" ]; then
        exit $exit_status
    fi
}

function install_homebrew() {
    /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
    set -e
    brew doctor
    brew update
    set +e
}

function install_git() {
    retry "brew tap git-duet/tap" 2
    retry "brew update" 2
    retry "brew install git" 2
    git clone --depth=1 https://github.com/Bash-it/bash-it.git $BASE_DIR/../bash_it
    $BASE_DIR/../bash_it/install.sh -s
    retry "brew install git-duet" 2
    retry "brew install git-secrets" 2
}

function install_commandline_tools() {
    retry "brew install jq" 2
    retry "brew install nmap" 2
    retry "brew install openssl" 2
    retry "brew install tmux" 2
}

function install_programming_tools() {
    retry "brew tap caskroom/versions" 2
    retry "brew update" 2
    retry "brew cask install java8" 2
    retry "brew install gradle" 2
    retry "brew install maven" 2
    retry "brew install node" 2
    retry "npm install --global grunt-cli" 2
    retry "npm install --global gulp-cli" 2
    retry "brew install go" 2
    retry "brew install ruby" 2
    retry "brew install rbenv" 2
}

function install_chrome() {
    retry "brew cask install google-chrome" 2
}

function install_cloudfoundry_tools() {
    retry "brew tap cloudfoundry/tap" 2
    retry "brew update" 2
    retry "brew install cf-cli" 2
    retry "brew install bosh-cli" 2
    retry "gem install cf-uaac" 2
}

function install_virtualization() {
    retry "brew cask install docker" 2
    retry "brew cask install virtualbox" 2
    retry "brew cask install vagrant" 2
    retry "vagrant plugin install vagrant-vbguest" 2
    #curl https://download.virtualbox.org/virtualbox/5.2.12/Oracle_VM_VirtualBox_Extension_Pack-5.2.12.vbox-extpack
}

function install_utilities() {
    retry "brew cask install flycut" 2
    retry "brew cask install iterm2" 2
    retry "brew cask install shiftit" 2
    retry "brew cask install macdown" 2
}

function install_other_utilities() {
    retry "brew cask install dropbox" 2
    retry "brew cask install jxplorer" 2
    retry "brew cask install keystore-explorer" 2
    retry "brew cask install postman" 2
}

function install_communication_tools() {
    retry "brew cask install slack" 2
}

function cloud_management_tools() {
    retry "brew install terraform" 2
    retry "brew install packer" 2
    retry "brew install ansible" 2
    retry "brew install awscli" 2
    retry "brew install vault" 2
}