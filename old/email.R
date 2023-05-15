library("devtools")
library(sendmailR)



#### Envia o e-mail com authentication and SSL
sendmail(from="pberger@mpes.mp.br", 
         to=c(email), 
         subject="Formulário do Plano de Atuação das Promotorias de Justiça", 
         msg=list(mime_part(texto), mime_part(filename_pdf), mime_part(filename_word)), 
         engine = "curl", 
         engineopts = list(username = username, password = password), 
         control=list(smtpServer="smtp://smtp.office365.com:587", verbose = TRUE) 
)
