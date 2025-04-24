# Hinweis: Um Module zu laden + anmelden schau bei Erstinstallation M365

# Mehrere Benutzer über CSV hinzufügen:
$csvPath = Read-Host "Pfad zur CSV-Datei eingeben (z. B. C:\Benutzer\users.csv)"
$users = Import-Csv -Path $csvPath

foreach ($user in $users) {
    Write-Host "🔄 Erstelle Benutzer: $($user.DisplayName)" -ForegroundColor Cyan

    # Passwortprofil erstellen
    $passwordProfile = New-Object -TypeName Microsoft.Graph.PowerShell.Models.MicrosoftGraphPasswordProfile
    $passwordProfile.Password = $user.Password
    $passwordProfile.ForceChangePasswordNextSignIn = $true

    try {
        # Benutzer erstellen
        $newUser = New-MgUser -DisplayName $user.DisplayName `
                              -GivenName $user.GivenName `
                              -Surname $user.Surname `
                              -UserPrincipalName $user.UserPrincipalName `
                              -MailNickname $user.MailNickname `
                              -UsageLocation $user.UsageLocation `
                              -PasswordProfile $passwordProfile `
                              -AccountEnabled:$true

        Write-Host "✅ Benutzer erstellt: $($user.UserPrincipalName)" -ForegroundColor Green
    }
    catch {
        Write-Host "❌ Fehler bei $($user.UserPrincipalName): $_" -ForegroundColor Red
    }
}

