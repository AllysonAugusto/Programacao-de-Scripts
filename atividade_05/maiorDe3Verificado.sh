#!/bin/bash

n1=$1
n2=$2
n3=$3

if ! [[ ${n1} =~ ^-?[0-9]+$ ]]; then
    echo "Opa!!! ${n1} não é número."
    exit
fi

if ! [[ ${n2} =~ ^-?[0-9]+$ ]]; then
    echo "Opa!!! ${n2} não é número."
    exit
fi

if ! [[ ${n3} =~ ^-?[0-9]+$ ]]; then
    echo "Opa!!! ${n3} não é número."
    exit
fi

if [ ${n1} -ge ${n2} ] && [ ${n1} -ge ${n3} ]; then
    echo "${n1}"
    exit
fi

if [ ${n2} -ge ${n1} ] && [ ${n2} -ge ${n3} ]; then
    echo "${n2}"
    exit
fi

if [ ${n3} -ge ${n1} ] && [ ${n3} -ge ${n2} ]; then
    echo "${n3}"
    exit
fi
