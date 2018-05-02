Add-Content $PROFILE '

if ( Test-Path "$env:USERPROFILE\Google Drive" ) {
	New-PSDrive -Name gd -PSProvider FileSystem -Root "$env:USERPROFILE\Google Drive"
}
if ( Test-Path gd:\Powershell\profile.ps1 ) {
	. gd:\Powershell\profile.ps1
}
'

