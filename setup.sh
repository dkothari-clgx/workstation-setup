#!/usr/bin/env bash

BASEDIR=$(dirname "$0")

#Load Installation Functions
source ./$BASEDIR/install.sh

#Install Tools
install_homebrew
install_git
install_java
install_chrome
install_virtualization
install_utilities
install_communication_tools
install_cloudfoundry_tools
