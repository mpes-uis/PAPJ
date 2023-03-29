#### Importando Secrets

# Leia o conteúdo do arquivo "config.cfg"
config <- readLines("config.cfg")

# Crie um vetor com as linhas do arquivo
config <- unlist(strsplit(config, "\n"))

# Converta o vetor em um data.frame
config_df <- as.data.frame(do.call(rbind, strsplit(config, "=")), stringsAsFactors = FALSE)

# Defina as variáveis "username" e "password"
username <- config_df[1,2]
password <- config_df[2,2]
