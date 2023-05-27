$title = 'Detekcja choroby Alzheimera i stadium demencji z użyciem narzędzi uczenia maszynowego w środowisku .NET'
$pdfFilename = "$title.pdf"
$generatedPdfPath = ".\out\thesis.pdf"
$destinationPdfPath = "..\$pdfFilename"

Remove-Item "$generatedPdfPath" -ErrorAction SilentlyContinue

if (-not (Get-Command latexmk -ErrorAction SilentlyContinue)) {
    Write-Error "Command 'latexmk' not found. Please install it and add it to your PATH."
    Exit 1
}

latexmk -synctex=1 -interaction=nonstopmode -file-line-error -pdf -outdir=out thesis.tex

if ($LASTEXITCODE -ne 0) {
    Write-Error "Error while building the document."
    Exit 1
}

Copy-Item "$generatedPdfPath" "$destinationPdfPath"

# Try detexifying documents using detexify.py script
if (-not (Get-Command python -ErrorAction SilentlyContinue)) {
    Write-Host "Python 3 not found. Skipping detexifying."
} else {
    $detexifyScriptPath = "../Scripts/detexify.py"
    python3 $detexifyScriptPath
    Write-Host "Documents detexified."
}
