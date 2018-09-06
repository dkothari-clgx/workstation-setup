#!/bin/bash
RED='\033[0;31m'
NC='\033[0m'
GREEN='\033[0;32m'

add-vpn() {
  pwd=$(pwd)
  cd ~/Downloads
  mkdir -p ~/.cisco/certificates/client/private
  openssl pkcs12 -in SecureAuth-$1-cert.pfx -out enabled-$1.pem -nokeys -clcerts
  openssl pkcs12 -in SecureAuth-$1-cert.pfx -out enabled-$1.key
  mv enabled-$1.pem ~/.cisco/certificates/client
  mv enabled-$1.key ~/.cisco/certificates/client/private
  cd $pwd
}

vpn() {
  if [ "$1" == "disconnect" ]; then
    /opt/cisco/anyconnect/bin/vpn disconnect
  elif [ "$1" == "status" ]; then
    /opt/cisco/anyconnect/bin/vpn status
  else
  pwd=$(pwd)
  cd ~/.cisco/certificates/client/

  for filename in enabled*.pem; do
    mv "$filename" "disabled-${filename:8}" 2>/dev/null ;
    done;

    mv disabled-$1.pem enabled-$1.pem 2>/dev/null || {
        echo -e "${RED}Failure! $1 is not a registered vpn certificate${NC}"
        cd $pwd
            return 1
    }
  echo -e "${GREEN}Success! $1 is now enabled vpn user!${NC}"
  cd $pwd
  /opt/cisco/anyconnect/bin/vpn connect vpn.wtc.corelogic.com/isc
  if [ "$?" -ne 0 ]; then
    /opt/cisco/anyconnect/bin/vpn connect vpn.ptc.corelogic.com/isc
  fi
fi
}