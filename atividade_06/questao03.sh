#!/bin/bash

if [ -z "$1" ]; then
   echo "erro: voce nao forneceu diretorio como parametro"
   exit 1
fi

diretorio=$1

if [ ! -d "$diretorio" ]; then
   echo "erro: o diretorio '$diretorio' nao existe"
   exit 1
fi

find "$diretorio" -type f -name "*.txt" | while read arquivo; do
   contagem=$(wc -l < "$arquivo")
   echo "$contagem $arquivo"
done | sort -n


#utilizando for:
#
#cd "$diretorio"
#for arquivo in *.txt; do
#   contagem=$(wc -l < "$arquivo")
#   echo "$contagem $arquivo"
#done | sort -n

