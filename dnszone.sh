#!/bin/bash

# ./dnszone.sh
# Criação: 05/01/2022
# Autor: Reinaldo Garcia
# Versão: 1.0
# Descrição: Script para verificar se servidor DNS permitem transferência de zona
# Modo d uso: ./dnszone.sh site.com

for server in $(host -t ns $1 | cut -d " " -f 4):
do
host -l -a $1 $server
done
