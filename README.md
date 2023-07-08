# PAPJ
Aplicação que gera arquivos de PDF e Word a partir de cada resposta no formulário do Plano de Atuação das Promotorias de Justiça.

# Funcionamento

Salva o arquivo em Excel

Copia para um banco

Gera o PDF

Envia para e-mail 

# Output

Todos formulários que são encaminhados estão salvos na pasta ./output

Banco de dados SQLite com espelho do arquivo *.xlsx resultante dos formulários na pasta ./src

# Como rodar

Instale o R e o LaTex (ou MikTex para Windows).

Crie na pasta raiz um arquivo chamado config.cfg, edite e salve com a seguinte configuração:

  USER=seuemail@email.com
  PWD=suasenha

Rode o arquivo requirements.R (só precisa na primeira vez para instalar os pacotes)

Rode o arquivo main.R


# Files (melhorar)


Tentei separar em módulos, mas não ficou perfeito. Mas vou descrever o que cada arquivo faz:
   
script.r: É o main da aplicação. Ordena a execução de cada parte
requirements.R: instala no R todos pacotes necessários para aplicação, porém não é acionado pelo script.r
secrets.r: consome o usuário e senha do e-mail
email.R: carrega as configurações de e-mail e anexo da aplicação
papg.Rmd: é onde o arquivo pdf e word é gerado pelo knit


