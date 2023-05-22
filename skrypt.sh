#!/bin/bash

ARGS=$(getopt -a --options d --long "date" -- "$@")
eval set -- "$ARGS"
date="false"
while true; do
  case "$1" in
    --date)
        echo $(date)
      date="true"
      shift;;
    --)
      break;;
     *)
      printf "Błędna opcja %s\nDostępne opcje: [--date Data]" "$1"
      exit 1;;
  esac
done
