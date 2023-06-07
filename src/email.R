library("devtools")
library(sendmailR)

#texto email

email <- (as.character(df[linha, 4]))
nome <- (as.character(df[linha, 5]))
texto <- paste("Exmo(a) Dr(a) ", nome, ", ", "segue em anexo formulário do Plano de Atuação da Promotoria de Justiça registrado no sistema.", sep="")

cat("Processando linha", nrow(df), "|", "email:", email)

#### Envia o e-mail com authentication and SSL
sendmail(from="age@mpes.mp.br", 
         to=c(email), 
         subject="Formulário do Plano de Atuação das Promotorias de Justiça", 
         msg=list(mime_part(texto), mime_part(filename_pdf), mime_part(filename_word)), 
         engine = "curl", 
         engineopts = list(username = username, password = password), 
         control=list(smtpServer="smtp://smtp.office365.com:587", verbose = TRUE) 
)
