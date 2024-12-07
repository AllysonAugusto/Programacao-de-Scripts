#!/bin/bash

echo "Olá $(whoami),"|tee -a saudacao.log
date +"Hoje é dia %d, do mês %m do ano de %Y."|tee -a saudacao.log
