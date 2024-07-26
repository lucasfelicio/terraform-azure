# Terraform on Azure

<img src="/assets/azure-terraform.png">

___

## Principais comandos

### 1. Init
```bash
terraform init
```
Este comando inicializa um diretório de trabalho contendo arquivos de configuração do Terraform com base no provider utilizado. <b>Este é o primeiro comando que deve ser executado após escrever uma nova configuração do Terraform ou clonar uma existente do controle de versão.</b>

### 2. Plan
```bash
terraform plan
```
Este comando cria um plano de execução, permitindo que você visualize as alterações que o Terraform planeja fazer na sua infraestrutura. Ele simula um apply sem executar efetivamente.

### 3. Apply
```bash
terraform apply
```
Este comando executa as ações propostas em um plano do Terraform. Ele cria e altera as instâncias/objetos no provider conforme o plano de execução.

### 5. Show
```bash
terraform show
```
Este comando apresenta um resumo do status de toda a sua infraestrutura terraform.

### 6. Output
```bash
terraform output
```
Este comando exibe um valor de uma variável output. 

### 7. Destroy
```bash
terraform destroy
```
Este comando para e destroi todos os objetos gerenciados por uma configuração do terraform.

___

Copyright (c) 2024 Lucas Felício

