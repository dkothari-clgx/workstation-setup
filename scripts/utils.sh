#!/bin/bash

# Creates backup of given file with date
bk () { cp $1{,.bk_`date +%m%d%Y`}; }
# Adds ssh key with username and server info
addKey () { cat ~/.ssh/$1_rsa.pub | ssh $1@$2 "mkdir -p .ssh; cat >> ~/.ssh/authorized_keys"; }
