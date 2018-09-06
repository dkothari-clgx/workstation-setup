#! /usr/bin/env bash

function cnjk {
    JKE=$(curl -X GET -H 'Content-Type: application/json' https://api.icndb.com/jokes/random 2>/dev/null | jq .value.joke)
    if [ "$JKE" != "" ]; then
        echo $JKE | cowsay
    else
        fortune | cowsay
    fi
}
