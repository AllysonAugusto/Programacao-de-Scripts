#!/bin/bash

exibir_menu() {
    clear
    echo "===== Monitoramento do Sistema ====="
    echo "1 - Tempo ligado (uptime)"
    echo "2 - Últimas Mensagens do Kernel"
    echo "3 - Memória Virtual"
    echo "4 - Uso da CPU por núcleo"
    echo "5 - Uso da CPU por processos"
    echo "6 - Uso da Memória Física"
    echo "7 - Sair"
    echo "====================================="
    read -p "Escolha uma opção: " opcao
    processar_opcao "$opcao"
}


processar_opcao() {
    case "$1" in
        1) mostrar_uptime ;;
        2) mostrar_dmesg ;;
        3) mostrar_vmstat ;;
        4) mostrar_mpstat ;;
        5) mostrar_pidstat ;;
        6) mostrar_free ;;
        7) exit 0 ;;
        *) echo "Opção inválida!" ; sleep 2 ; exibir_menu ;;
    esac
}

tela_limpa_espera() {
    read -p "Pressione ENTER para voltar ao menu..."
    exibir_menu
}

mostrar_uptime() {
    clear
    echo "=== Tempo ligado (uptime) ==="
    uptime
    tela_limpa_espera
}

mostrar_dmesg() {
    clear
    echo "=== Últimas Mensagens do Kernel ==="
    dmesg | tail -n 10
    tela_limpa_espera
}

mostrar_vmstat() {
    clear
    echo "=== Memória Virtual ==="
    vmstat 1 10
    tela_limpa_espera
}

mostrar_mpstat() {
    clear
    echo "=== Uso da CPU por núcleo ==="
    mpstat -P ALL 1 5
    tela_limpa_espera
}

mostrar_pidstat() {
    clear
    echo "=== Uso da CPU por processos ==="
    pidstat 1 5
    tela_limpa_espera
}

mostrar_free() {
    clear
    echo "=== Uso da Memória Física ==="
    free -m
    tela_limpa_espera
}


exibir_menu

