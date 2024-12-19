#!/bin/bash

if [ $# -ne 2 ]; then
    echo "erro: a estrutura é $0 intervalo diretorio"
    exit 1
fi

intervalo=$1
diretorio=$2
arquivolog="$diretorio/dirSensors.log"

if [ ! -d "$diretorio" ]; then
    echo "diretório nao encontrado: $diretorio"
    exit 1
fi

if [ ! -f "$arquivolog" ]; then
    echo "arquivo nao encontrado"
    exit 1
fi

cd "$diretorio" || exit

arquivos_anterior=$(ls)
quantidade_anterior=$(echo "$arquivos_anterior" | wc -l)

while true; do
    sleep "$intervalo"

    arquivos_atual=$(ls)
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

        mensagem="$data_atual alteração! $quantidade_anterior->$quantidade_atual."
        
        if [ "$arquivos_adicionados" != "" ]; then
            mensagem="$mensagem adicionados: $arquivos_adicionados"
        fi

        if [ "$arquivos_removidos" != "" ]; then
            mensagem="$mensagem removidos: $arquivos_removidos"
        fi

        echo "$mensagem"
        echo "$mensagem" >> "$arquivolog"

        arquivos_anterior=$arquivos_atual
        quantidade_anterior=$quantidade_atual
    fi
done
