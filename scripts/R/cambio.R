# Informacoes de cambio
# Fonte: oanda.com através do pacote tseries do R
#library(scales)
#library(ggplot2)
#library(gridExtra)

# importa tabela Matriz
Matriz <- read.table(
                     file = paste( Projeto.path, 'tabela/Matriz', sep = "" ),
                     header = TRUE,
                     sep = "|",
                     colClasses = c("Date", "numeric", "character", "character")
                    )

# Função que armazena a cotação atual da moeda, em formato EUR/Moeda ou USD/Moeda
atual <- function( Moeda, Dados = Matriz ){
  t <- subset(
              Dados,
              ( Data == max( Data ) ) & ( Tipo == Moeda )
             )
  return( format( t$Cambio, digits = 2, nsmall = 2 ) )
}



