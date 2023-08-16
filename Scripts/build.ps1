$title = 'Detekcja choroby Alzheimera i stadium demencji z użyciem narzędzi uczenia maszynowego w środowisku .NET'
$pdfFilename = "$title.pdf"
# Paths are relative to the Thesis directory since that is where the `latex` command should be executed
$generatedPdfPath = "./out/thesis.pdf"
$destinationPdfPath = "../$pdfFilename"
$detexifyScriptPath = "../Scripts/detexify.py"

$originalLocation = Get-Location

if (-not (Test-Path "thesis.tex")) {
    if (Test-Path "./Thesis" -PathType Container) {
        Set-Location "./Thesis"
    }
    elseif (Test-Path "../Thesis" -PathType Container) {
        Set-Location "../Thesis"
    }
    else {
        Write-Error "The build script should only be run from the root repository directory, Thesis directory or Scripts directory." -CategoryActivity "Error"
        Exit 1
    }
}

Remove-Item "$generatedPdfPath" -ErrorAction SilentlyContinue

if (-not (Get-Command latexmk -ErrorAction SilentlyContinue)) {
    Write-Error "Command 'latexmk' not found. Please install it and add it to your PATH." -CategoryActivity "Error"
    Set-Location $originalLocation
    Exit 1
}

latexmk -synctex=1 -interaction=nonstopmode -file-line-error -pdf -outdir=out thesis.tex

if ($LASTEXITCODE -ne 0) {
    Write-Error "Document build using 'latexmk' has failed." -CategoryActivity "Error"
    Set-Location $originalLocation
    Exit 1
}

Copy-Item "$generatedPdfPath" "$destinationPdfPath"

# Try detexifying documents using detexify.py script
if (Get-Command py -ErrorAction SilentlyContinue) {
    py $detexifyScriptPath
    Write-Host "Documents detexified."
}
elseif (Get-Command wsl -ErrorAction SilentlyContinue) {
    Write-Host "Python 3 not found. Trying to use WSL to detexify documents..."
    # Try detexifying documents using detexify.py script in WSL
    wsl --exec python3 $detexifyScriptPath
    if ($LASTEXITCODE -ne 0) {
        Write-Host "Couldn't detexify documents using WSL, probably because Python 3 is not installed in WSL"
    }
    else {
        Write-Host "Documents successfully detexified using WSL Python 3."
    }
}
else {
    Write-Host "Neither Python 3 nor WSL were found. Skipping detexifying."
}

Set-Location $originalLocation
