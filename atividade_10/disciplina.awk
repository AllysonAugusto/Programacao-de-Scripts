#!/bin/bash

BEGIN {
    print "Aluno:Situação:Média";
}

NR > 1 {
    media = ($2 + $3 + $4) / 3;
    if (media >= 7) {
        situacao = "Aprovado";
    } else if (media >= 4) {
        situacao = "Final";
    } else {
        situacao = "Reprovado";
    }
    printf "%s:%s:%.1f\n", $1, situacao, media;
    soma1 += $2;
    soma2 += $3;
    soma3 += $4;
    count++;
}

END {
    printf "Média das Provas: %.1f %.1f %.1f\n", soma1/count, soma2/count, soma3/count;
}

