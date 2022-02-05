$Source = 'W:\Immagini\2004\' 
$Target = '~\Downloads\2004_b\'

$Files = Get-ChildItem -File -Recurse -path $Source | sort name | Select-Object -property FullName,Length,Name
Write-Host "$($Source) : $($Files.Count) files found"

if ( -not (Test-Path -Path $Target)) { New-Item -ItemType Directory -Path $Target }

for ($i = 0; $i -lt $Files.Count; $i++){

    Write-Progress -Activity "Processing Files" -status "Processing File $i / $($Files.Count)" -PercentComplete ($i / $Files.Count * 100)


    $file = $Files[$i]
    if ( $file.Length -eq 0 ) {
        Write-Host "Skipping empty file: $($file.Name)"
        continue
    }

    $targetPath = "$($Target)$($file.Name)"

    if ((Test-Path -PathType Leaf -Path $targetPath)){
        $hash = (Get-FileHash $file.FullName).Hash.substring(0,10)
        $newName = "$($hash)_$($file.Name)"
        Write-Host $file.Name "->" $newName
        $targetPath = "$($Target)$($newName)"
    }

    Copy-Item -Path $file.FullName -Destination $targetPath
}