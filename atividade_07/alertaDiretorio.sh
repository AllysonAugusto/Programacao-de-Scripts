#!/bin/bash

if [ $# -ne 2 ]; then
    echo "erro: a estrutura é $0 intervalo diretorio"
    exit 1
fi

intervalo=$1
diretorio=$2
arquivolog="dirSensors.log"

if [ ! -d "$diretorio" ]; then
    echo "diretório nao encontrado: $diretorio"
    exit 1
fi

if [ ! -f "$arquivolog" ]; then
    touch "$arquivolog"
fi

cd "$diretorio" || exit

arquivos_anterior=$(ls)
quantidade_anterior=$(echo "$arquivos_anterior" | wc -l)

while true; do
    sleep "$intervalo"

    arquivos_atual=$(ls -p | grep -v /)
    quantidade_atual=$(echo "$arquivos_atual" | wc -l)

    if [ "$quantidade_anterior" -ne "$quantidade_atual" ]; then
        data_atual=$(date "+[%d-%m-%Y %H:%M:%S]")

        arquivos_adicionados=""
        for arquivo in $arquivos_atual; do
            if ! echo "$arquivos_anterior" | grep -q "$arquivo"; then
                arquivos_adicionados="$arquivos_adicionados$arquivo "
            fi
        done

        arquivos_removidos=""
        for arquivo in $arquivos_anterior; do
            if ! echo "$arquivos_atual" | grep -q "$arquivo"; then
                arquivos_removidos="$arquivos_removidos$arquivo "
            fi
        done

        echo "$data_atual Alteração! $quantidade_anterior->$quantidade_atual." >> "$arquivolog"

        if [ "$arquivos_adicionados" != "" ]; then
            echo "Adicionados: $arquivos_adicionados" >> "$arquivolog"
        fi

        if [ "$arquivos_removidos" != "" ]; then
            echo "Removidos: $arquivos_removidos" >> "$arquivolog"
        fi

        arquivos_anterior=$arquivos_atual
        quantidade_anterior=$quantidade_atual
    fi
done



