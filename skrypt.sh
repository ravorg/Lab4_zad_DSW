#!/bin/bash

ARGS=$(getopt -a --options dlh --long "date,logs,help" -- "$@")
eval set -- "$ARGS"
date="false"
logs="false"
help="false"
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
        liczbaplik=$3
        for ((i=1; i<=liczbaplik; i++))
        do
            filename="log${i}.txt"
            echo "Nazwa pliku: $filename" > $filename
            echo "Nazwa skryptu: skrypt.sh" >> $filename
            echo "Data utworzenia: $(date)" >> $filename
        done
      logs="true"
      shift;;
    --help)
        echo "Dostępne opcje: [-d --date Data] [-l [x] --logs [x] Tworzy [x] plików] [-h --help Wyświetla pomoc]"
      help="true"
      shift;;
    --)
      break;;
     *)
      printf "Błędna opcja %s\nDostępne opcje: [-d --date Data] [-l --logs Tworzy plików] [-h --help Wyświetla pomoc]" "$1"
      exit 1;;
  esac
done