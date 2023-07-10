library("devtools")
library(sendmailR)

#texto email

email <- (as.character(df[linha, 4]))
nome <- (as.character(df[linha, 5]))
texto <- paste("Exmo(a) Dr(a) ", nome, ", ","\n","\n", "Segue em anexo o documento em PDF contendo o Plano de Atuação de Promotoria de Justiça (PAPJ), conforme registrado na ferramenta “Forms”. Siga os passos abaixo para formalizar o seu Plano de Atuação:","\n","\n", "   1. Instaure um procedimento do Sei!, utilizando o Tipo de Processo: Plano de Atuação de Promotoria de Justiça;","\n","   2. Inclua no procedimento um documento “Externo”, do tipo “Plano de Ação/ Atuação”, anexando o arquivo PDF recebido neste e-mail;","\n","   3. Encaminhe, simultaneamente, o procedimento para a Unidade de Planejamento e Projetos (UPP) e para o(s) Centro(s) de Apoio, Grupo(s) Especial(ais) de Trabalho, Núcleo(s) e Comissão(ões) finalística(s) relacionada(s) à(s) temática(s).","\n","\n","A partir da análise dessas unidades o procedimento será remetido para apreciação prévia do Secretário-Geral e posterior validação da Procuradora-Geral de Justiça.","\n","Caso tenha dúvidas, entre contato com os servidores Ana Paula Senna Dan Rossoni ou Fabricio Ferraz Pego (equipe da Unidade de Planejamento e Projetos) da AGE.","\n","\n","Respeitosamente","\n","\n","Equipe da Assessoria de Gestão Estratégica (AGE)", sep="")

cat("Processando linha", nrow(df), "|", "email:", email)

#### Envia o e-mail com authentication and SSL
sendmail(from="age@mpes.mp.br", 
         to=c(email), 
         subject="Formulário do Plano de Atuação das Promotorias de Justiça", 
         msg=list(mime_part(texto), mime_part(filename_pdf)), 
         #msg=list(mime_part(texto), mime_part(filename_pdf), mime_part(filename_word)), 
         engine = "curl", 
         engineopts = list(username = username, password = password), 
         control=list(smtpServer="smtp://smtp.office365.com:587", verbose = TRUE) 
)
