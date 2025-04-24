# Hinweis: Um Module zu laden + anmelden schau bei Erstinstallation M365

#CSV Datei:
DisplayName
Max Mustermann
Julia Beispiel

#CSV Datei einfügen:
$csvPath = Read-Host "Pfad zur CSV-Datei mit gelöschten Benutzern (z. B. C:\users_to_restore.csv)"
$users = Import-Csv -Path $csvPath

# Alle gelöschten Benutzer anzeigen:
$deletedUsers = Get-MgDirectoryDeletedUser

# Gelöschte Benutzer aus CSV-Datei wiederherstellen:
foreach ($target in $users) {
    $match = $deletedUsers | Where-Object { $_.DisplayName -eq $target.DisplayName }

    if ($match) {
        # Benutzer wiederherstellen per Graph-API-Aufruf
        Invoke-MgGraphRequest -Method POST -Uri "https://graph.microsoft.com/v1.0/directory/deletedItems/$($match.Id)/restore"

        Write-Host "✅ Wiederhergestellt: $($target.DisplayName)" -ForegroundColor Green
    }
    else {
        Write-Host "⚠️ Nicht gefunden (gelöscht oder Name stimmt nicht): $($target.DisplayName)" -ForegroundColor Yellow
    }
}
