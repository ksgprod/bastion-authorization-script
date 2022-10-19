# Visão geral

Script sh auxiliador para liberação de acesso SSH a uma instância EC2 utilizada como Bastion Host, que fará o tunelamento para acesso a um determinado banco de dados rodando em uma instância RDS.

## Tecnologias

- [AWS CLI](https://aws.amazon.com/pt/cli/) é uma ferramenta unificada para o gerenciamento de seus produtos da AWS.

- [Shell script](https://pt.wikipedia.org/wiki/Shell_script), é o nome dado a um arquivo que será interpretado por algum programa tipo Shell.
 
# Setup da aplicação (local)

## Pré-requisito

Você precisará [criar uma conta AWS](https://portal.aws.amazon.com/billing/signup#/start/email), assim como um [usuário do IAM](https://docs.aws.amazon.com/pt_br/IAM/latest/UserGuide/id_users_create.html) na sua conta AWS com permissão para `AmazonEC2ReadOnlyAccess`.

## Execução do script

Primeiramente, você precisará setar os valores para as variáveis de ambiente:

* BASTION_EC2_INSTANCE_ID: ID da instância EC2 na qual se deseja acessar;
* KP_PEM_ABS_PATH: Caminho absoluto para o arquivo PEM (key-pair de acesso ao EC2);
* RDS_SERVER: Endpoint do RDS para tunelamento;
* RDS_LOCAL_PORT: Porta local para mapeamento à porta do banco remoto;
* RDS_REMOTE_PORT: Porta do banco remoto RDS;
* REGION: Caso deseje alterar a região AWS (padrão setada no Norte da Virginia).

Execute o script:
```
sh bastion_authorization.sh
```
Pronto. O acesso está disponível e configurado para utilização:
```
------------------------------------------------------------------------
Acesso liberado para: 
...rds.amazonaws.com no endereço *127.0.0.1:5433
------------------------------------------------------------------------
```

Um estudo de caso para utilização deste script você encontra em:

* [Segurança no acesso à recursos AWS, utilizando Bastion Host.](https://klebernox.medium.com/seguran%C3%A7a-no-acesso-%C3%A0-recursos-aws-utilizando-bastion-host-f82854d5a71)
* [Economizando recurso AWS, automatizando execução via funções Lambda.](https://klebernox.medium.com/economizando-recurso-aws-automatizando-execu%C3%A7%C3%A3o-via-fun%C3%A7%C3%B5es-lambda-e197472239f9)