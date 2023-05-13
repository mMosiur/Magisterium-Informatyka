if ! command -v latexmk &> /dev/null
then
    echo "Command 'latexmk' not found. Please install it and add it to your PATH." >&2
    exit 1
fi

latexmk -synctex=1 -interaction=nonstopmode -file-line-error -pdf -outdir=out thesis.tex

if [ $? -ne 0 ]; then
    echo "Error while building the document." >&2
    exit 1
fi

title="Detekcja choroby Alzheimera i stadium demencji z użyciem narzędzi uczenia maszynowego w środowisku .NET"
cp out/thesis.pdf "../$title.pdf"
