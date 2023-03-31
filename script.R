# Instale as bibliotecas necessárias

#install.packages("RSQLite")
#install.packages("readxl")
#install.packages("dplyr")
#install.packages("rmarkdown")

# Iniciando

print("Let's go")


# Conecte-se ao banco de dados

source("secrets.R")

library(RSQLite)

con <- dbConnect(SQLite(), dbname = "PAPG.sqlite")

# Verifique se a tabela "configuracoes" existe
if(!dbExistsTable(con, "configuracoes")) {
  # Crie a tabela "configuracoes"
  dbExecute(con, "CREATE TABLE configuracoes (id INTEGER PRIMARY KEY AUTOINCREMENT, valor INTEGER)")
  
  # Insira o valor 1 na tabela
  dbExecute(con, "INSERT INTO configuracoes (valor) VALUES (1)")
}

# Grava a tabela no banco de dados



# Leia o valor atual do banco de dados
valor_atual <- dbGetQuery(con, "SELECT valor FROM configuracoes")$valor[1]

# Leia o data frame do arquivo Excel
library(readxl)
#df <- read_excel("data/PAPJ.xlsx", sheet = "Form1")
df <- read_excel("D:/docker/PAPJ/data/PAPJ.xlsx", sheet = "Form1")

linha <- dbGetQuery(con, "SELECT valor FROM configuracoes")$valor[1]

dbWriteTable(con, "forms", df, overwrite = TRUE)

# Verifique se o número de linhas do data frame é menor que do banco (situação atual)

library(rmarkdown)
library(dplyr)


while(nrow(df) >= valor_atual) {
  
  linha <- as.character(valor_atual)
  
  report <- "papg.Rmd"
  
  #texto email
  email <- (as.character(df[linha, 4]))
  nome <- (as.character(df[linha, 5]))
  texto <- paste("Excelentíssimo(a) Dr(a) ", nome, ", ", "segue em anexo formulário do Plano de Atuação da Promotoria de Justiça registrado no sistema.", sep="")
  
  
  cat("Processando linha", nrow(df), "|", "email:", email)
  
  print(email)
  
  cat("iterando a linha", linha)
  
  render(report, output_format = c("pdf_document", "word_document"), output_file = linha, output_dir = "./output")
  
  # Nome para usar de anexo no e-mail
  filename_pdf <- paste("output/", linha, ".pdf", sep="")
  filename_word <- paste("output/", linha, ".docx", sep="")
  
  Sys.sleep(10)
  
  # Some 1 ao valor atual
  valor_atual <- valor_atual + 1
  
  source("email.R")
  
  Sys.sleep(10)
  
  # Atualize o valor no banco de dados
  dbExecute(con, paste("UPDATE configuracoes SET valor = ", valor_atual, "WHERE id = 1"))
}

 # Feche a conexão com o banco de dados
dbDisconnect(con)

