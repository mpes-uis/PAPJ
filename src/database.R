#### Conecte-se ao banco de dados

library(RSQLite)


con <- dbConnect(SQLite(), dbname = "PAPG.sqlite")

#### Verifique se a tabela "configuracoes" existe
if(!dbExistsTable(con, "configuracoes")) {
  
  ## Crie a tabela "configuracoes"
  dbExecute(con, "CREATE TABLE configuracoes (id INTEGER PRIMARY KEY AUTOINCREMENT, valor INTEGER)")
  
  ## Insira o valor 1 na tabela
  dbExecute(con, "INSERT INTO configuracoes (valor) VALUES (1)")
}

#### Grava a tabela no banco de dados

# Leia o valor atual do banco de dados
valor_atual <- dbGetQuery(con, "SELECT valor FROM configuracoes")$valor[1]

# Leia o data frame do arquivo Excel
library(readxl)

#df <- read_excel("D:/docker/PAPJ/data/PAPJ.xlsx", sheet = "Form1")
df <- read_excel("data/Diagnostico.xlsx", sheet = "Form1")

linha <- dbGetQuery(con, "SELECT valor FROM configuracoes")$valor[1]

dbWriteTable(con, "Diagnostico", df, overwrite = TRUE)


