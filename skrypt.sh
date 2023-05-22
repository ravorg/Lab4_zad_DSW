#!/bin/bash

ARGS=$(getopt -a --options d --long "date,logs" -- "$@")
eval set -- "$ARGS"
date="false"
logs="false"
while true; do
  case "$1" in
    --date)
        echo $(date)
      date="true"
      shift;;
    --logs)
        if [[ $3 -eq 0 ]]; then
            for ((i=1; i<=100; i++))
            do
                filename="log${i}.txt"
                echo "Nazwa pliku: $filename" > $filename
                echo "Nazwa skryptu: skrypt.sh" >> $filename
                echo "Data utworzenia: $(date)" >> $filename
            done
        fi
      logs="true"
      shift;;
    --)
      break;;
     *)
      printf "Błędna opcja %s\nDostępne opcje: [--date Data] [--logs Tworzy 100 plików]" "$1"
      exit 1;;
  esac
done