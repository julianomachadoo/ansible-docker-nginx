#!/bin/bash

# Carregar variáveis do .env
if [ -f .env ]; then
    export $(cat .env | grep -v '^#' | xargs)
fi

# Gerar arquivo hosts
cat > hosts <<EOF
[rocky_vm]
${VM_IP} ansible_user=${ANSIBLE_USER}
EOF

echo "Arquivo hosts gerado com IP: ${VM_IP}"
