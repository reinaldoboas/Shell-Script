#!/bin/bash
# Data: 31/03/2022
# Criador: Reinaldo Garcia
# DescriÃao: Ferramenta de Ping Sweep


for ip in $(seq 1 254); do ping -c 1 172.30.0.$ip -w 1; done | grep "64 bytes"
