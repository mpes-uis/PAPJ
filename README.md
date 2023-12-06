# PAPJ
Aplicação que gera arquivos de PDF e Word a partir de cada resposta no formulário do Plano de Atuação das Promotorias de Justiça.

# Funcionamento

Abre o arquivo excel gerado pelo forms

Copia para um banco de dados

Gera o PDF e Word com os dados

Envia para e-mail 

Registra o que foi enviado

# Output

Todos formulários que são encaminhados estão salvos na pasta ./output

Banco de dados SQLite com espelho do arquivo *.xlsx

# Como rodar

Instale o R (ou Rstudio) e o LaTex (ou MikTex para Windows).

Insira o Excel do formulário da na pasta data

Edite o papg.Rmd para se adequar ao seu formulário

Crie na pasta raiz um arquivo chamado config.cfg, edite e salve com a seguinte configuração:

```
USER=seuemail@email.com
PWD=suasenha
```

Rode o arquivo requirements.R (só precisa na primeira vez para instalar os pacotes)

Rode o arquivo main.R


# Módulos

   
main.r: Orquestra a execução dos scripts, inclusive o loop de renderização e armazenamento da ordem no DB.

requirements.R: instala no R todos pacotes necessários para aplicação, é independente do main.R

database.R: Salva o arquivo excel em um banco de dados SQLite e cria banco de dados para identificar a ordem dos formulários gerados.

secrets.r: consome o usuários e senhas do config.cfg

email.R: carrega as configurações de e-mail e anexo da aplicação

papg.Rmd: é onde o arquivo pdf e word é gerado pelo knit
