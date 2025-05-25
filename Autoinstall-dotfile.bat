::Instalando os programas
winget install --id=Opera.OperaGX  -e
winget install --id=LGUG2Z.komorebi  -e
winget install --id=AmN.yasb  -e

:: Criando os links sybolocos

mklink "%USERPROFILE%\komorebi.json" "%~dp0komorebi.json"
mklink "%userprofile%\masir.ps1" "%~dp0masir.ps1"
mklink "%userprofile%\masir.exe" "%~dp0masir.exe"
