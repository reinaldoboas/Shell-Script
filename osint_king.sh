#!/bin/bash

# ./osint_king.sh
# Criação: 19/12/2021
# Autor: Reinaldo Garcia
# Versão 1.0
# Descrição: Script para automatizar OSINT de sites, baixar arquivos encontrados no Google e analisa-los
# Modo de uso: ./osint_king.sh target.com docx

# Recebendo as váriaveis com o alvo e o formato de arquivo por parametro
ALVO="$1"
FORMATO="$2"
PASTA="$ALVO""_$FORMATO"

if [ $# != 2 ]; then
        echo "Suporta extensões: pdf,doc,docx,xls,xlsx,ppt,pptx"
        echo "Programa depende dos softwares: lynx e exiftool"
        echo "Modo de uso: ./osint_king.sh target.com docx"
else
        echo ""; echo "==============================================="
        echo "Seu alvo é: $ALVO"
        echo "Formato de arquivos: $FORMATO"
        echo ""; echo "==============================================="
        echo "Investigando links requisitados:"
        lynx --dump "https://google.com/search?q=site:$ALVO+ext:$FORMATO" | grep ".$FORMATO" | cut -d "=" -f2 | egrep -v "site|google" | sed 's/...$//' | grep http > links_$FORMATO
        echo ""; echo "==============================================="
        echo "Links encontrados:"; cat links_$FORMATO
        echo ""; echo "==============================================="
        echo "Criando diretório: $PASTA"
        mkdir $PASTA
        echo ""; echo "==============================================="
        echo "Baixando os arquivos encontrados:"
        for url in $(cat links_$FORMATO);do wget -q $url -P $PASTA;done
        echo ""; echo "==============================================="
        echo "Analisando Metadados:"
        exiftool $PASTA/*.$FORMATO
        echo ""; echo "==============================================="
fi
