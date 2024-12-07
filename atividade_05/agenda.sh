#!/bin/bash

if [ "$1" = "adicionar" ]; then
	if  [ -e "./agenda.db" ]; then
		echo "$2:$3" >> agenda.db
		echo "Usuário $2 Adicionado."
	else
		touch agenda.db
		echo "Arquivo Criado!!!"
		echo "$2:$3" >> agenda.db
		echo "Usuário $2 Adicionado."
	fi
elif [ "$1" = "listar" ]; then
	if [ -s agenda.db ]; then
		cat ./agenda.db
	else 
		echo "Arquivo Vazio!!!"
	fi
elif [ "$1" = "remover" ]; then
	if grep -q $2 agenda.db; then
		nome=$(grep $2 agenda.db|cut -d ":" -f1)
		sed -i "/$2/d" agenda.db
		echo "Usuário $nome Removido."
	else
		echo "Este Email de Usuário não Existe."
	fi
fi
