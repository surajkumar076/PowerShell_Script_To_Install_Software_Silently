#Source file location
$source = 'https://www.win-rar.com/fileadmin/winrar-versions/winrar/winrar-x64-611.exe'

#destination to save the file
$destination_dir = "C:\Software_folder"
$Installation_file = "$destination_dir\winrar.exe"
$softwareName = 'winrar'

if ((Get-ItemProperty HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Uninstall\*).DisplayName -like "$softwareName"){
     Write-Output "Software is already installed"
     Write-Host "-------> Exiting <--------" -ForegroundColor Red -BackgroundColor Yellow
     # Exit;

} else {
      Write-Output "Software not installed. Proceeding with installation"
}

#Download the file at the specified location
if (-not ( Test-Path $Installation_file)){
       
       New-Item $destination_dir -ItemType Directory -Force
       Invoke-WebRequest -Uri $source -OutFile $Installation_file -Verbose
}

Write-Output "Installing software: $softwareName"
Start-Process $Installation_file /S -NoNewWindow -Wait -PassThru
