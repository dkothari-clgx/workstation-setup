#! /usr/bin/env bash

function djk {
    NAME="Darshan"
    JKE=$(curl -X GET -H 'Content-Type: application/json' https://api.icndb.com/jokes/random 2>/dev/null | jq .value.joke)
    if [ "$JKE" != "" ]; then
        echo $JKE | sed "s/Chuck\ Norris\'s/${NAME}\'s/g" | sed "s/Chuck\ Norris\'/${NAME}\'s/g" |sed "s/Chuck\ Norris/${NAME}/g" | sed "s/Chuck\'s/${NAME}\'s/g" | sed "s/Chuck/${NAME}/g" | cowsay
    else
        fortune | cowsay
    fi
}
