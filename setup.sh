#!/usr/bin/env bash
echo "Caching password..."
sudo -K
sudo true;
clear

BASEDIR="$( cd "$( dirname "$0" )" && pwd)"

#Load Installation Functions
source $BASEDIR/install.sh

set -e 
#Install Tools
install_homebrew
install_git
install_commandline_tools
install_programming_tools
install_chrome
install_virtualization
install_utilities
install_communication_tools
install_cloudfoundry_tools
