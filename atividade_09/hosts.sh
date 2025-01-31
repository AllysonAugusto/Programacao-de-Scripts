#!/bin/bash

arquivo="hosts.db"

adicionar() {
   if grep -E -q "^$2$" ${arquivo}; then
      echo "O IP informado já existe"
      exit 1
   fi
   echo "$1 $2" >> ${arquivo}
   echo "Adicionado: $1, $2"
}

remover() {
   if ! grep -E -q "^$1 " ${arquivo}; then
      echo "O hostname $1 não existe"
      exit 1
   else
      sed -i "/^$1 /d" ${arquivo}
      if [ $? -eq 0 ]; then
         echo "Removido"
      else
         echo "Erro ao remover"
      fi
   fi
}

procurar() {
   grep -E "^$1 " "$arquivo" || echo "Não encontrado: $1"
}

buscar_reverso() {
   grep -E " $1$" "$arquivo" | awk '{print $1}' || echo "Não encontrado: $1"
}

listar() {
   cat ${arquivo}
}

while getopts "a:i:d:r:l" opt; do
   case $opt in
      a)
         maquina=$OPTARG
         ;;
      i)
         ip=$OPTARG
         if [[ -n "$maquina" && -n "$ip" ]]; then
            adicionar "$maquina" "$ip"
         else
            echo "Erro: Você deve fornecer um hostname com -a e um IP com -i"
            exit 1
         fi
         ;;
      d)
         remover "$OPTARG"
         ;;
      l)
         listar
         ;;
      r)
         buscar_reverso "$OPTARG"
         ;;
      \?)
         echo "Opção Inválida: -$OPTARG" >&2
         ;;
   esac
done 

if [ $OPTIND -eq 1 ] && [ $# -gt 0 ]; then
   procurar "$1"
fi


