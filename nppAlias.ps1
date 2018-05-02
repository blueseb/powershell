if (Test-Path 'C:\Program Files (x86)\Notepad++\notepad++.exe') {
	Set-Alias npp 'C:\Program Files (x86)\Notepad++\notepad++.exe'
	}
if (Test-Path 'C:\Program Files\Notepad++\notepad++.exe') {
	Set-Alias npp 'C:\Program Files\Notepad++\notepad++.exe'
	}
if (Test-Path C:\dev\pubs) {cd C:\dev\pubs}

Clear-Host