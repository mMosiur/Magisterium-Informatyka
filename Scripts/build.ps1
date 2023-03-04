Try {
    Get-Command latexmk > $null
}
Catch {
    Write-Output "Command 'latexmk' not found. Please install it and add it to your PATH."
    Exit 1
}

latexmk -synctex=1 -interaction=nonstopmode -file-line-error -pdf -outdir=out thesis.tex

if ($LASTEXITCODE -ne 0) {
    Write-Output "Error while building the document."
    Exit 1
}

$title = "Detekcja choroby Alzheimera i stadium demencji z użyciem narzędzi uczenia maszynowego w środowisku .NET"
Copy-Item out/thesis.pdf "../$title.pdf"
