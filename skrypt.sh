#!/bin/bash

ARGS=$(getopt -a --options d --long "data" -- "$@")
eval set -- "$ARGS"
date="false"
while true; do
  case "$1" in
    --data)
        echo $(date)
      date="true"
      shift;;
    --)
      break;;
     *)
      printf "Błędna opcja %s\nDostępne opcje: [-d --data Data]" "$1"
      exit 1;;
  esac
done