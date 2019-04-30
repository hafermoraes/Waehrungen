# Informacoes de cambio
# Fonte: oanda.com através do pacote tseries do R
library(scales)
library(ggplot2)
library(gridExtra)


# importa tabela Matriz
Matriz <- read.table(
                     file = "../../tabela/Matriz",
                     header = TRUE,
                     sep = "|",
                     colClasses = c("Date", "numeric", "character", "character")
                    )


grafico.cambio <- function( MOEDA ){

  graf <- ggplot( subset( Matriz, Partida == MOEDA ), aes( Data, Cambio ) ) +
          labs(x = "", y = "" ) +
          geom_line() +
          theme_bw() +
          scale_x_date( labels = date_format( "%Y/%m" ), breaks = "6 months" ) +
          facet_wrap( ~ Tipo, scales = "free" )

  return( graf )
}

LARGURA <- 25 / 2.54
COMPRIM <-  13 / 2.54

pdf(file = "../../graficos/EUR.pdf", width = LARGURA, height = COMPRIM)
 grafico.cambio("EUR")
dev.off()


pdf(file = "../../graficos/USD.pdf", width = LARGURA, height = COMPRIM)
 grafico.cambio("USD")
dev.off()
