#!/bin/bash

# ./ghdb.sh
# Criação: 11/12/2021
# Autor: Reinaldo Garcia
# Versão: 1.0
# Descrição: Script para facilitar pesquisas com Google Dorks
# Modo de uso: ./ghdb.sh site.com

SEARCH="firefox"
ALVO="$1"

echo "Pesquisa no Pastebin"
$SEARCH "https://google.com/search?q=site:pastebin.com+$ALVO" 2>/dev/null

echo "Pesquisa no Trello"
$SEARCH "https://google.com/search?q=site:trello.com+$ALVO" 2>/dev/null

echo "Pesquisa por arquivos"
$SEARCH "https://google.com/search?q=site:$ALVO+ext:php+OR+ext:asp+OR+ext:txt+OR+ext:ovpn+OR+ext:sql+OR+ext:bak" 2> /dev/null

echo "Pesquisa por Index of"
$SEARCH "https://google.com/search?q=site:$ALVO+'index of'" 2> /dev/null

echo "Pesquisa por subdominios"
$SEARCH "https://google.com/search?q=site:$ALVO+-www" 2> /dev/null
