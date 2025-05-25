# Obtém o estado atual do Komorebi
$stateJson = komorebic state | ConvertFrom-Json

# Verifica se o Komorebi está pausado
if ($stateJson.paused -eq $true) {
    # Se estiver pausado, retoma o Komorebi
    komorebic toggle-pause
    # Reativa a transparência
    komorebic toggle-transparency
} else {
    # Se estiver ativo, desativa a transparência
    komorebic toggle-transparency
    # Pausa o Komorebi
    komorebic toggle-pause
}
