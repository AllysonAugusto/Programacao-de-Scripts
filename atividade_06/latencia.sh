#!/bin/bash

if [ "$#" -ne 1 ]; then
    echo "erro: voce nao forneceu o arquivo com ip"
    exit 1
fi

arquivo=$1

if [ ! -f "$arquivo" ]; then
    echo "erro: arquivo '$arquivo' nao encontrado."
    exit 1
fi

NUM_PACOTES=10

while read -r ip; do
    tempo_medio=$(ping -c "$NUM_PACOTES" "$ip" | tail -n 1 | cut -d '/' -f5)

    if [ -n "$tempo_medio" ]; then
        echo -e "$ip\t$tempo_medio ms"
    else
        echo "erro ao pingar o IP: $ip"
    fi
done < "$arquivo" | sort -n -k2

