# PAPJ
Aplicação que gera arquivos de PDF e Word a partir de cada resposta no formulário do Plano de Atuação das Promotorias de Justiça.

# Funcionamento

O conteiner copia os arquivos do Git e roda localmente.

A fonte de dados é inserida no storage por meio de DAGs do Apache Airflow e depois processada.

O arquivo config.cfg é necessário do diretório raiz com o user e pwd do e-mail que enviará os formulários em pdf e docx.

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
