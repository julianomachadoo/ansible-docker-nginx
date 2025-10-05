#!/bin/bash

# Carregar variáveis do .env
if [ -f .env ]; then
    export $(cat .env | grep -v '^#' | xargs)
fi  

# Gera par de chaves ssh
ssh-keygen -t rsa -b 4096 -C "seu_email@exemplo.com" -f ./id_rsa_custom

# Copia a chave pública para o servidor remoto
#ssh-copy-id -i ./id_rsa_custom.pub ${ANSIBLE_USER}@${VM_IP}

cat ./id_rsa_custom.pub | ssh -i ./id_rsa_custom ${ANSIBLE_USER}@${VM_IP} "mkdir -p ~/.ssh && cat >> ~/.ssh/authorized_keys && chmod 600 ~/.ssh/authorized_keys && chmod 700 ~/.ssh"
