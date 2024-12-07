#!/bin/bash

#1 - Um comando grep que encontre todas as linhas com mensagens que não são do sshd.

echo -e "\e[44mQUESTÃO 1\e[0m"
grep -Ev 'sshd' ~/atividades/atividade03/auth.log

#2 - Um comando grep que encontre todas as linhas com mensagens que indicam um login de
# sucesso via sshd cujo nome do usuário começa com a letra j.

echo -e "\e[44mQUESTÃO 2\e[0m"
grep -E 'sshd.*(session opened for user).j+' ~/atividades/atividade03/auth.log

#3 - Um comando grep que encontre todas as vezes que alguém tentou
# fazer login via root através do sshd.

echo -e "\e[44mQUESTÃO 3\e[0m"
grep -E 'sshd.*(user root)' ~/atividades/atividade03/auth.log

#4 - Um comando grep que encontre todas as vezes que alguém conseguiu fazer login com
# sucesso nos dias 11 ou 12 de Outubro.

echo -e "\e[44mQUESTÃO 4\e[0m"
grep -E '^Oct (11|12).*(session opened for user)' ~/atividades/atividade03/auth.log
