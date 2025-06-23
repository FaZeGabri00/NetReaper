function NetReaper {
    Write-Host "[*] Enumerando información del dominio..." -ForegroundColor Cyan

    # Nombre del dominio
    $Domain = ([System.DirectoryServices.ActiveDirectory.Domain]::GetCurrentDomain()).Name
    Write-Host "`nDominio actual: $Domain"

    # Controladores de dominio
    Write-Host "`nControladores de Dominio:" -ForegroundColor Yellow
    Get-ADDomainController -Filter * | Select-Object Name, IPv4Address

    # Usuarios del dominio
    Write-Host "`nUsuarios del dominio (primeros 10):" -ForegroundColor Yellow
    Get-ADUser -Filter * -Property Name | Select-Object -First 10 Name

    # Grupos interesantes
    Write-Host "`nGrupos privilegiados:" -ForegroundColor Yellow
    Get-ADGroupMember -Identity "Domain Admins" | Select-Object Name, ObjectClass

    # Equipos del dominio
    Write-Host "`nEquipos del dominio (primeros 10):" -ForegroundColor Yellow
    Get-ADComputer -Filter * | Select-Object -First 10 Name

    # Shares en red (vecinos)
    Write-Host "`nEnumerando comparticiones SMB de la red local..." -ForegroundColor Yellow
    $targets = arp -a | ForEach-Object { ($_ -split "\s+")[1] } | Where-Object { $_ -match '\d+\.\d+\.\d+\.\d+' }
    foreach ($ip in $targets) {
        try {
            $shares = net view \\$ip 2>$null
            if ($shares -match 'Disk') {
                Write-Host "[$ip] Comparticiones encontradas:"
                $shares | ForEach-Object { $_ }
            }
        } catch { }
    }
}

NetReaper
