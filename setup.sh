#!/usr/bin/env bash

BASEDIR="$( cd "$( dirname "$0" )" && pwd)"

#Load Installation Functions
source ./$BASEDIR/install.sh

#Install Tools
install_homebrew
install_git
install_commandline_tools
install_java
install_chrome
install_virtualization
install_utilities
install_communication_tools
install_cloudfoundry_tools
