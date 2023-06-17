$title = 'Detekcja choroby Alzheimera i stadium demencji z użyciem narzędzi uczenia maszynowego w środowisku .NET'
$pdfFilename = "$title.pdf"
$generatedPdfPath = "./out/thesis.pdf"
$destinationPdfPath = "../$pdfFilename"
$detexifyScriptPath = "../Scripts/detexify.py"

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
if (Get-Command py -ErrorAction SilentlyContinue) {
    py $detexifyScriptPath
    Write-Host "Documents detexified."
} elseif (Get-Command wsl -ErrorAction SilentlyContinue) {
    Write-Host "Python 3 not found. Trying to use WSL to detexify documents..."
    # Try detexifying documents using detexify.py script in WSL
    wsl --exec python3 $detexifyScriptPath
    if ($LASTEXITCODE -ne 0) {
        Write-Host "Couldn't detexify documents using WSL, probably because Python 3 is not installed in WSL"
    } else {
        Write-Host "Documents successfully detexified using WSL Python 3."
    }
} else {
    Write-Host "Neither Python 3 nor WSL were found. Skipping detexifying."
}
