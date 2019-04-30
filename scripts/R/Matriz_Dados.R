# Informacoes de cambio
# Fonte: oanda.com através do pacote quantmod do R
library(quantmod)
library(scales)

#conecta com o site do Oanda.com e baixa as cotacoes do Dolar e do Euro
  Cota <- function( tipo ) {
      # Função para baixar as cotações das diferentes moedas em EUR e USD
      # Argumento:
      #   tipo    : string que contém EUR/Moeda ou USD/Moeda, onde Moeda traz o código ISO (3 letras maiúsculas)
      # Retorna:
      #   Matriz com colunas Data, Cambio e Tipo

      aux <- getSymbols.oanda(  # <-- função do pacote tseries que baixa o vetor de cotações da moeda (instrument)
          Symbols       = tipo,
          return.class  = "zoo",
          from          = Sys.Date() - 170
      )
      aux <- as.data.frame( aux )  # <-- o vetor tem o formato 'zoo' mas deve ser transformado para data.frame
      aux <- cbind.data.frame(     # <-- reestrutura a tabela para conter
                   Data    = as.Date( row.names( aux ) ),  # <-- Data em formato AAAA-MM-DD
                   Cambio  = aux[, 1 ],                    # <-- Valor do Câmbio
                   Tipo    = tipo,                         # <-- EUR/Moeda ou USD/Moeda
                   Partida = substr( tipo, 1, 3 )          # <-- Moeda de Partida: EUR ou USD
                  )
      return(aux)
  }




Matriz <- rbind.data.frame(
    ##-- Euros para moedas locais
    Cota( tipo = "EUR/ANG" ),
    Cota( tipo = "EUR/ARS" ),
    Cota( tipo = "EUR/BOB" ),
    Cota( tipo = "EUR/BRL" ),
    Cota( tipo = "EUR/CLP" ),
    Cota( tipo = "EUR/COP" ),
    Cota( tipo = "EUR/GTQ" ),
    Cota( tipo = "EUR/HTG" ),
    Cota( tipo = "EUR/MXN" ),
    Cota( tipo = "EUR/PEN" ),
    Cota( tipo = "EUR/PYG" ),
    Cota( tipo = "EUR/USD" ),
    Cota( tipo = "EUR/UYU" ),
    Cota( tipo = "EUR/VEF" ),
    Cota( tipo = "EUR/XCD" ),
    ##-- Dólares para moedas locais
    Cota( tipo = "USD/ANG" ),
    Cota( tipo = "USD/ARS" ),
    Cota( tipo = "USD/BOB" ),
    Cota( tipo = "USD/BRL" ),
    Cota( tipo = "USD/CLP" ),
    Cota( tipo = "USD/COP" ),
    Cota( tipo = "USD/GTQ" ),
    Cota( tipo = "USD/HTG" ),
    Cota( tipo = "USD/MXN" ),
    Cota( tipo = "USD/PEN" ),
    Cota( tipo = "USD/PYG" ),
    Cota( tipo = "USD/EUR" ),
    Cota( tipo = "USD/UYU" ),
    Cota( tipo = "USD/VEF" ),
    Cota( tipo = "USD/XCD" )
)

# Exporta o data.frame Matriz para o arquivo /tabela/Matriz
write.table(
            Matriz,
            file      = "../../tabela/Matriz",
            quote     = FALSE,
            row.names = FALSE,
            sep       = "|"
           )
