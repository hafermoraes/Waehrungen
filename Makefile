

# Baixa as cotações, as unifica e as exporta para /tabela/Matriz

all: Dados Graficos Relatorio


Dados:
	cd scripts/R;\
	Rscript Matriz_Dados.R

# Cria gráficos EUR/Moeda e USD/Moeda
Graficos:
	cd scripts/R;\
	Rscript exporta_graficos.R

Relatorio:
	cd relatorio;\
	Rscript -e 'Sweave("waehrungen.Rnw", encoding = "UTF-8")';\
	pdflatex waehrungen.tex;\
	pdflatex waehrungen.tex;\
	mv *.pdf ..;\
	rm *.aux *.log *.tex
	clear
	evince waehrungen.pdf&
