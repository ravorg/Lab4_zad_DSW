#!/bin/bash

ARGS=$(getopt -a --options dl --long "data,logs" -- "$@")
eval set -- "$ARGS"
date="false"
logs="false"
help="false"
while true; do
  case "$1" in
    --data)
        echo $(date)
      date="true"
      shift;;
    --logs)
        for ((i=1; i<=100; i++))
        do
            filename="log${i}.txt"
            echo "Nazwa pliku: $filename" > $filename
            echo "Nazwa skryptu: skrypt.sh" >> $filename
            echo "Data utworzenia: $(date)" >> $filename
        done
      logs="true"
      shift;;
    --)
      break;;
     *)
      printf "Błędna opcja %s\nDostępne opcje: [-d --data Data] [-l --logs Tworzy plików] [-h --help Wyświetla pomoc]" "$1"
      exit 1;;
  esac
done