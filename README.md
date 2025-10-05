# Ansible Docker Nginx

Playbook Ansible para instalar Docker e subir um container Nginx em servidores Rocky Linux. No meu laboratório, foi utilizada uma VM criada atraves do VirtualBox

## Pre-requisitos

- Ansible instalado na maquina de controle

## Estrutura

```
.
playbook.yml    # Playbook principal
```

## Como configurar

1. Edite o arquivo .env.example e adicione o IP da VM de destino e o usuário previamente configurado no sudoers

2. Execute o script generate_inventory.sh para criar o arquivo hosts com os valores declarados no .env

```bash
chmod u+x ./generate_inventory.sh
./generate_inventory.sh
```

3. Execute o script ssh_config para criar a chave e copiar a mesma para o servidor de destino utilizando as variaveis declaradas no .env

```bash
chmod u+x ./ssh_config.sh
./ssh_config.sh
```

## Como executar

1. Carregue as variaveis de ambiente
```bash
source .env
```

2. Execute o playbook:

```bash
ansible-playbook -i inventario playbook.yml
```

Ou se estiver usando o inventario padrao:

```bash
ansible-playbook playbook.yml
```

## O que o playbook faz

1. Atualiza os pacotes do sistema
2. Instala dependencias necessarias
3. Adiciona o repositorio oficial do Docker
4. Instala Docker CE e Docker Compose
5. Inicia e habilita o servico Docker
6. Sobe um container Nginx nas portas 80 e 443

## Verificar instalacao

Apos a execucao, voce pode acessar o Nginx em:

```
http://${IP_VM}$
```

Para verificar o status do container:

```bash
ssh seu-usuario@seu-servidor.com "docker ps"
```