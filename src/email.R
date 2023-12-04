library("devtools")
library(sendmailR)

#texto email

email <- (as.character(df[linha, 4]))
nome <- (as.character(df[linha, 5]))
texto <- paste("Exmo(a) Dr(a) ", nome, ", ","\n","\n", "Segue em anexo o documento em PDF contendo a “Identificação e Diagnóstico” do Plano de Atuação de Promotoria de Justiça (PAPJ), conforme registrado na ferramenta Microsoft Forms. Utilize-o para instruir o procedimento Sei! que irá formalizar o Plano de Atuação.","\n","\n", "   Para mais informações, acesse o link https://intranet.mpes.mp.br/age/papj-2024/.","\n","   Em caso de dúvidas, entre contato com os servidores Ana Paula Senna Dan Rossoni ou Fabricio Ferraz Pêgo (equipe da Unidade de Planejamento e Projetos) da AGE.","\n","\n","Respeitosamente","\n","\n","Equipe da Assessoria de Gestão Estratégica (AGE)", sep="")

cat("Processando linha", nrow(df), "|", "email:", email)

#### Envia o e-mail com authentication and SSL
sendmail(from="age@mpes.mp.br", 
         to=c(email), 
         subject="Formulário de Identificação e Diagnóstico", 
         msg=list(mime_part(texto), mime_part(filename_pdf)), 
         #msg=list(mime_part(texto), mime_part(filename_pdf), mime_part(filename_word)), 
         engine = "curl", 
         engineopts = list(username = username, password = password), 
         control=list(smtpServer="smtp://smtp.office365.com:587", verbose = TRUE) 
)
