if ( -not (Test-Path "C:\Users\Public\nvidiaProfileInspector")) {
Invoke-WebRequest -Uri "https://github.com/Orbmu2k/nvidiaProfileInspector/releases/download/2.4.0.4/nvidiaProfileInspector.zip" -OutFile "C:\Users\Public\nvidiaProfileInspector.zip"
Expand-Archive C:\Users\Public\nvidiaProfileInspector.zip C:\Users\Public\nvidiaProfileInspector
Remove-Item C:\Users\Public\nvidiaProfileInspector.zip -Force
Invoke-WebRequest -Uri "https://raw.githubusercontent.com/BySaDaS/nvidiaProfileInspector/main/my_profile.nip" -OutFile C:\users\public\nvidiaprofileinspector\my_profile.nip
}
cd "C:\users\Public\nvidiaprofileinspector"
.\nvidiaprofileinspector.exe -silentImport my_profile.nip