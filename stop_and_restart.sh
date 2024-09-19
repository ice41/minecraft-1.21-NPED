#!/bin/bash

# Função para parar o servidor de Minecraft
stop_server() {
    screen -S minecraft -p 0 -X stuff "say Server reiniciando para limpeza...\n"
    sleep 5
    screen -S minecraft -p 0 -X stuff "stop\n"
}

# Função para limpar cache de sistema
clear_cache() {
    echo "Limpando cache do sistema..."
    sync
    echo 3 > /proc/sys/vm/drop_caches
}

# Parar o servidor
stop_server

# Esperar o servidor parar completamente
sleep 10

# Limpar cache
clear_cache

# Iniciar o servidor novamente
./start_minecraft.sh
