#!/usr/bin/env bash
echo "Caching password..."
sudo -K
sudo true;
clear

BASEDIR="$( cd "$( dirname "$0" )" && pwd)"

#Load Installation Functions
source $BASEDIR/install.sh

#Install Tools
retry "install_homebrew" 2
install_git
install_commandline_tools
install_programming_tools
install_chrome
install_virtualization
install_utilities
install_communication_tools
install_cloudfoundry_tools