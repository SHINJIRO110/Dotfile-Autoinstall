$processName = "masir"
$process = Get-Process -Name $processName -ErrorAction SilentlyContinue

if ($process) {
    # Se o processo estiver em execução, encerra-o
    Stop-Process -Name $processName -Force
    # Emite um som indicando que o processo foi encerrado
    [System.Console]::Beep(400, 300)
} else {
    # Se o processo não estiver em execução, inicia-o
    Start-Process -FilePath ".\masir.exe" -WindowStyle Hidden
    # Emite um som indicando que o processo foi iniciado
    [System.Console]::Beep(800, 300)
}
