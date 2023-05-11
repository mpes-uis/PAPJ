# PAPJ
Aplicação que gera arquivos de PDF e Word a partir de cada resposta no formulário do Plano de Atuação das Promotorias de Justiça.

# Funcionamento

O conteiner copia os arquivos do Git e roda localmente.

A fonte de dados é inserida no storage por meio de DAGs do Apache Airflow e depois processada.

O arquivo config.cfg é necessário do diretório raiz com o user e pwd do e-mail que enviará os formulários em pdf e docx.

# Output

Todos formulários que são encaminhados estão salvos na pasta ./output

Banco de dados SQLite com espelho do arquivo *.xlsx resultante dos formulários

# To do

Alterar formulário para o modelo da corregedoria

Trocar o nome dos arquivos do output de acordo com informações de quem preencheu.

Criar bash script para automatizar o download do arquivo do onedrive e mover para o container

Criar pasta compartilhada host/container no docker build

Colocar em produção
