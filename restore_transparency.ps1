# Verifica o estado atual do Komorebi
$state = komorebic state | ConvertFrom-Json

# Caminho do registro para as configurações da barra de tarefas
$regPath = 'HKCU:\Software\Microsoft\Windows\CurrentVersion\Explorer\StuckRects3'
$settings = (Get-ItemProperty -Path $regPath).Settings

if ($state.is_paused) {
    # Se o Komorebi estiver pausado, retoma e ativa a transparência
    
    Start-Process -FilePath "C:\Program Files\Yasb\yasb.exe" -WindowStyle Hidden
    komorebic toggle-pause
    Start-Sleep -Milliseconds 100
    komorebic transparency enable

    # Ativa o ocultamento automático da barra de tarefas
    $settings[8] = 3
} else {
    # Se o Komorebi estiver ativo, desativa a transparência e pausa
    komorebic transparency disable
    Stop-Process -Name yasb -Force -ErrorAction SilentlyContinues
    Stop-Process -Name masir -Force -ErrorAction SilentlyContinues
    Start-Sleep -Milliseconds 100
    komorebic unstack-all
    komorebic toggle-pause

    # Desativa o ocultamento automático da barra de tarefas
    $settings[8] = 2
}

# Aplica as alterações no registro
Set-ItemProperty -Path $regPath -Name Settings -Value $settings

# Reinicia o processo do Explorer para aplicar as alterações
Stop-Process -Name explorer
Start-Sleep -Seconds 1

# Força o Komorebi a retilar as janelas
komorebic retile
