#!/bin/bash

read -p "Informe o arquivo: " arquivo

if [ ! -f "$arquivo" ]; then 
   echo "arquivo nao encontrado"
   exit 1
fi


cat "$arquivo" | tr -s '[:space:][:punct:]' '\n' | sort | uniq -c  | while read -r contagem palavra; do
   echo "$palavra: $contagem"
done




#Outra maneira de fazer
#
#!/bin/bash
#
#read -p "Informe o arquivo: " arquivo
#
#if [ ! -f "$arquivo" ]; then
#    echo "Arquivo não encontrado"
#    exit 1
#fi
#
#palavras=$(cat "$arquivo" | sed 's/[[:punct:]]//g')
#
# Criar uma lista única de palavras para contar
#palavras_unicas=$(echo "$palavras" | tr ' ' '\n' | sort -u)
#
# Contar cada palavra manualmente
#for palavra in $palavras_unicas; do
#    contagem=0
#    for palavra_atual in $palavras; do
#        if [ "$palavra" = "$palavra_atual" ]; then
#            contagem=$((contagem + 1))
#        fi
#    done
#    echo "$palavra: $contagem"
#done
