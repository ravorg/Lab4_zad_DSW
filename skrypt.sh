#!/bin/bash

ARGS=$(getopt -a --options dlhie --long "date,logs,help,innit,error" -- "$@")
eval set -- "$ARGS"
date="false"
logs="false"
help="false"
innit="false"
error="false"
while true; do
  case "$1" in
    -d | --date)
        echo $(date)
      date="true"
      shift;;
    -l | --logs)
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
    -h | --help)
        echo "Dostępne opcje: [--date Data] [--logs [x] Tworzy [x] plików] [--help Wyświetla pomoc]"
      help="true"
      shift;;
    -i | --innit)
      git https://github.com/ravorg/Lab4_zad_DSW.git
      SKRYPT_DIR=$(pwd)
      echo "export PATH=\$PATH:$SKRYPT_DIR" >> ~/.bashrc
      source ~/.bashrc
      echo "Inicjalizacja zakończona."
      innit="true"
      shift;;
    -e | --errors)
        if [[ $3 -eq 0 ]]; then
            for ((i=1; i<=100; i++))
            do
                filename="error${i}.txt"
                echo "Nazwa pliku: $filename" > $filename
                echo "Nazwa skryptu: skrypt.sh" >> $filename
                echo "Data utworzenia: $(date)" >> $filename
            done
        fi
        liczbaplik=$3
        for ((i=1; i<=liczbaplik; i++))
        do
            filename="error${i}.txt"
            echo "Nazwa pliku: $filename" > $filename
            echo "Nazwa skryptu: skrypt.sh" >> $filename
            echo "Data utworzenia: $(date)" >> $filename
        done
      error="true"
      shift;;
    --)
      break;;
     *)
      printf "Błędna opcja %s\nDostępne opcje: [--date Data] [--logs Tworzy plików] [--help Wyświetla pomoc]" "$1"
      exit 1;;
  esac
done