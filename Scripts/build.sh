#!/bin/bash

# Use argument to check whether to use onesided or twosided document
documentType="$1"

if [ "$documentType" = "onesided" ]; then
    documentName="thesis-onesided"
elif [ "$documentType" = "twosided" ]; then
    documentName="thesis-twosided"
elif [ -z "$documentType" ]; then
    documentName="thesis-twosided"
else
    echo "Unknown argument '$documentType'" >&2
    cd "$originalLocation" || exit 1
    exit 1
fi

title='Detekcja choroby Alzheimera i stadium demencji z użyciem narzędzi uczenia maszynowego w środowisku .NET'
pdfFilename="$title.pdf"
generatedPdfPath="./out/$documentName.pdf"
destinationPdfPath="../$pdfFilename"
detexifyScriptPath="../Scripts/detexify.py"

originalLocation=$(pwd)

if [ ! -f "$documentName.tex" ]; then
    if [ -d "./Thesis" ]; then
        cd "./Thesis"
    elif [ -d "../Thesis" ]; then
        cd "../Thesis"
    else
        echo "Error: The build script should only be run from the root repository directory, Thesis directory or Scripts directory." >&2
        exit 1
    fi
fi

rm "$generatedPdfPath" 2>/dev/null

if ! command -v latexmk &> /dev/null; then
    echo "Error: Command 'latexmk' not found. Please install it and add it to your PATH." >&2
    cd "$originalLocation"
    exit 1
fi

latexmk -synctex=1 -interaction=nonstopmode -file-line-error -pdf -outdir=out "$documentName.tex"

if [ "$?" -ne 0 ]; then
    echo "Error: Document build using 'latexmk' has failed." >&2
    cd "$originalLocation"
    exit 1
fi

cp "$generatedPdfPath" "$destinationPdfPath"

# Try detexifying documents using detexify.py script
if command -v python3 &> /dev/null; then
    python3 "$detexifyScriptPath"
    echo "Documents detexified."
else
    echo "Python 3 was not found. Skipping detexifying." >&2
fi

cd "$originalLocation"
