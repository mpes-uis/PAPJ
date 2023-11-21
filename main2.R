#####################
#                   #
#        PAPJ - Ação#
#                   #
#####################

##### Instale as bibliotecas necessárias!

#install.packages("RSQLite")
#install.packages("readxl")
#install.packages("dplyr")
#install.packages("rmarkdown")

#### Iniciando aplicação

print("Let's go")

#### Read the user and password for the e-mail think

source("src2/secrets.R")

#### Criação e operação do banco de dados

source("src2/database.R")


#### Daqui pra baixo a coisa acontece

# 1 - Verifica se o número de linhas do data frame é menor que do banco (situação atual)
# 2 - Gera o report
# 3 - Manda o e-mail
# 4 - Itera no banco

####


#pacotes necessários no loop
library(rmarkdown)
library(dplyr)


while(nrow(df) >= valor_atual) {
  
  linha <- as.character(valor_atual)
  
  report <- "src2/papg.Rmd"
  
  cat("iterando a linha", linha)
  
  render(report, output_format = c("pdf_document", "word_document"), output_file = linha, output_dir = "./output")
  
  # Nome para usar de anexo no e-mail
  filename_pdf <- paste("output/", linha, ".pdf", sep="")
  filename_word <- paste("output/", linha, ".docx", sep="")
  
  Sys.sleep(10)
  
  source("src2/email.R")
  
  # Some 1 ao valor atual
  valor_atual <- valor_atual + 1
  
  Sys.sleep(10)
  
  # Atualize o valor no banco de dados
  dbExecute(con, paste("UPDATE configuracoes SET valor = ", valor_atual, "WHERE id = 1"))
}

# Feche a conexão com o banco de dados
dbDisconnect(con)

