::Instalando os programas
setlocal

:: Função para instalar se o programa não estiver instalado
call :install_if_missing "Opera GX" "Opera.OperaGX"
call :install_if_missing "komorebi" "LGUG2Z.komorebi"
call :install_if_missing "JetBrainsMono Nerd Font" "DEVCOM.JetBrainsMonoNerdFont"
call :install_if_missing "Character Map UWP" "9WZDNCRDXF41"
call :install_if_missing "yasb" "AmN.yasb"

goto :eof

:install_if_missing
winget list --name "%~1" | findstr /I "%~1" >nul
if errorlevel 1 (
    echo Instalando %~1...
    winget install --id=%~2 -e --accept-package-agreements --accept-source-agreements
) else (
    echo %~1 ja esta instalado. Pulando...
)
:: Criando os links sybolocos
rmdir /s /q "%userprofile%\.config"
mklink /d "%USERPROFILE%\.config" "%~dp0.config"
mklink "%USERPROFILE%\komorebi.json" "%~dp0komorebi.json"
mklink "%userprofile%\masir.ps1" "%~dp0masir.ps1"
mklink "%userprofile%\masir.exe" "%~dp0masir.exe"
