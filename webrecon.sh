#!/bin/bash

# ./webrecon.sh
# Data: 30/01/2022
# Criador: Reinaldo Garcia
# Versão: 1.0
# Descrição: Script de recon web
# Modo de uso: ./webrecon.sh http://site.com.br php

# Recebendo as variaveis por parametro
alvo=$1
extensao=$2

echo "=============================================================="
echo "| -           KingTool - WEB RECON                      - |"
echo "| - Modo de uso: ./webrecon.sh http://site.com.br php   - |"
echo "=============================================================="

#cabecalho=$(curl -s -H "User-Agent: KingTool" --head $alvo) # Teste falho para enviar apenas uma requisição e armazenar o cabeçalho
webserver=$(curl -s -H "User-Agent: KingTool" --head $alvo | grep Server | cut -d " " -f 2)
tecnologias=$(curl -s -H "User-Agent: KingTool" --head $alvo | grep "X-Powered-By" | cut -d " " -f 2)

echo "-> WebServer identificado: $webserver"
echo "-> Tecnologias: $tecnologias"
echo "=============================================================="

echo "Buscando por arquivos: "
for palavra in $(cat /usr/share/wordlists/dirb/small.txt)
do
resposta_arquivo=$(curl -s -H "User-Agent: KingTool" -o /dev/null -w "%{http_code}" $alvo/$palavra.$extensao)
if [ $resposta_arquivo == "200" ]; then
        echo "Arquivo $extensao encontrato: $alvo/$palavra.$extensao"
fi
done

#### Buscando por diretórios
echo "=============================================================="
echo "Buscando por Diretórios e Arquivos:"
for palavra in $(cat lista2.txt)
do
resposta=$(curl -s -H "User-Agent: KingTool" -o /dev/null -w "%{http_code}" $alvo/$palavra/)

if [ $resposta == "200" ]; then
        echo "Diretório encontrado: $alvo/$palavra/"
        echo "=============================================================="
fi
done
