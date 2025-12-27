# Ensure the directory exists or download the tool
$destDir = "C:\Users\Public\nvidiaProfileInspector"
$zipPath = "C:\Users\Public\nvidiaProfileInspector.zip"

if (-not (Test-Path $destDir)) {
    New-Item -ItemType Directory -Path $destDir -Force
    
    Write-Host "Downloading Nvidia Profile Inspector..."
    Invoke-WebRequest -Uri "https://github.com/Orbmu2k/nvidiaProfileInspector/releases/latest/download/nvidiaProfileInspector.zip" -OutFile $zipPath
    
    Write-Host "Extracting files..."
    Expand-Archive -Path $zipPath -DestinationPath $destDir -Force
    Remove-Item $zipPath -Force
    
    Write-Host "Downloading custom profile..."
    Invoke-WebRequest -Uri "https://raw.githubusercontent.com/BySaDaS/nvidiaProfileInspector/main/my_profile.nip" -OutFile "$destDir\my_profile.nip"
}

# Change directory and run the import
Set-Location $destDir
if (Test-Path ".\nvidiaProfileInspector.exe") {
    Write-Host "Importing profile..."
    .\nvidiaProfileInspector.exe "-silentImport" "my_profile.nip"
} else {
    Write-Warning "nvidiaProfileInspector.exe not found in $destDir"
}
