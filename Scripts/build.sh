#!/bin/bash

title='Detekcja choroby Alzheimera i stadium demencji z użyciem narzędzi uczenia maszynowego w środowisku .NET'
pdfFilename="$title.pdf"
generatedPdfPath="./out/thesis.pdf"
destinationPdfPath="../$pdfFilename"

rm "$generatedPdfPath" 2>/dev/null

if ! command -v latexmk >/dev/null; then
    echo "Latex error: Command 'latexmk' not found. Please install it and add it to your PATH."
    exit 1
fi

latexmk -synctex=1 -interaction=nonstopmode -file-line-error -pdf -outdir=out thesis.tex

if [ $? -ne 0 ]; then
    echo "Latex error: Document build using 'latexmk' has failed."
    exit 1
fi

cp "$generatedPdfPath" "$destinationPdfPath"

# Try detexifying documents using detexify.py script
if ! command -v python >/dev/null; then
    echo "Python 3 not found. Skipping detexifying."
else
    detexifyScriptPath="../Scripts/detexify.py"
    python3 "$detexifyScriptPath"
    echo "Documents detexified."
fi
