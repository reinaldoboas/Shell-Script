#!/bin/bash

# ./pesquisa.sh
# Data: 03/02/2022
# Criador: Reinaldo Garcia
# Versão: 1.0
# Descrição: Script para pesquisar no google por arquivos e links com certa extensão
# Modo de uso: ./pesquisa.sh http://site.com.br php


lynx -dump "http://google.com/search?num=500&q=site:"$1"+ext:"$2"" | cut -d '=' -f2 | grep "$2" | grep "$1" | egrep -v "site:|google" | sed s'/...$//'g
