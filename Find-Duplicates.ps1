param (
    [string] $Path = '~\Downloads\2003\' #define path to folders to find duplicate files
)

$Files = Get-ChildItem -File -Recurse -path $Path | sort name | Select-Object -property FullName,Length,Name

Write-Host "$($Path) : $($Files.Count) files found"
for ($i = 0; $i -lt $Files.Count-1; $i++){
    Write-Progress -Activity "Processing Files" -status "Processing File $i / $($Files.Count)" -PercentComplete ($i / $Files.Count * 100)

    $item = $Files[$i]
    $candidates = $Files[($i+1)..($Files.Count-1)]
    foreach($candidate in $candidates){
        if ($item.Length -ne $candidate.Length) { break }
        if ((Get-Content $item.FullName -Head 1) -ne (Get-Content $candidate.FullName -Head 1)) { break }
        if ((Get-Content $item.FullName -Tail 1) -ne (Get-Content $candidate.FullName -Tail 1)) { break }

        Write-Host $item.FullName "->" $candidate.FullName
        #Remove-Item $candidate.FullName
    }
}
