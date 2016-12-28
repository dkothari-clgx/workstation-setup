#!/usr/bin/env bash

basedir=$(PWD)

#Load Installation Functions
source ./basedir/install.sh

#Install Tools
install_homebrew
install_git
install_java
install_chrome
install_virtualization
install_utilities
install_communication_tools
install_cloudfoundry_tools
