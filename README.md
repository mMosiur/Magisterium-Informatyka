# Detekcja choroby Alzheimera i stadium demencji z użyciem narzędzi uczenia maszynowego w środowisku .NET

Kod źródłowy pracy magisterskiej z kierunku Informatyka na Uniwersytecie Marii Curie-Skłodowskiej w Lublinie.

Autor: Mateusz Piotr Moruś

Praca pisana pod przewodnictwem [dr hab. Grzegorza Wójcika](https://gmwojcik.pl/).

## Kompilacja

Wymagany `texlive` wraz z narzędziem do kompilacji `latexmk`

``` bash
cd Thesis
latexmk -synctex=1 -interaction=nonstopmode -file-line-error -pdf -outdir=out thesis.tex
cp out/thesis.pdf "../Detekcja choroby Alzheimera i stadium demencji z użyciem narzędzi uczenia maszynowego w środowisku .NET.pdf"
```
