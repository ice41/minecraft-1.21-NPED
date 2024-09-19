#!/bin/bash

# Função para iniciar o servidor
start_server() {
    java -Xms1G -Xmx2G -jar paper-1.21.1-74.jar nogui
}

# Loop infinito para reiniciar o servidor caso ele pare, mas permite saída controlada
while true; do
    # Verificar se o arquivo de controle "stop.txt" existe para sair do loop
    if [ -f "stop.txt" ]; then
        echo "Arquivo de controle detectado. Parando o servidor."
        rm stop.txt  # Opcionalmente, remover o arquivo após uso
        exit 0
    fi

    echo "Iniciando o servidor Minecraft..."
    
    # Iniciar o servidor
    start_server

    # Caso o servidor pare, esperar 10 segundos antes de reiniciar
    echo "O servidor caiu. Reiniciando em 10 segundos..."
    sleep 10
done