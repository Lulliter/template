#
# renv per default cerca di compilare i pacchetti da sorgente per garantire maggiore riproducibilità e compatibilità tra diverse versioni di R. Questo è più sicuro ma richiede tutte le dipendenze di sistema (cairo, gettext, etc.).


# Riavvia R
.rs.restartR()

# 1. Verifica quali pacchetti sono già installati
installed.packages()[c("dplyr", "flextable", "ggplot2", "stringr", "systemfonts", "LibPath")]

# 2. Controlla lo stato di renv
renv::status()

# 1. Installa solo i pacchetti che mancano (non funziona)
renv::install(c("dplyr", "flextable", "ggplot2"))

# Copia i pacchetti dalla libreria globale (funzona)
renv::hydrate(c("dplyr", "flextable", "ggplot2"))

# Registra lo snapshot
renv::snapshot()
