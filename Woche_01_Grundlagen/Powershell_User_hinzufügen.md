# Benutzer mit PowerShell in Microsoft 365 erstellen

**Benutzername:** Max Mustertest01  
**E-Mail:** max01@LucasTest186.onmicrosoft.com  
**Rolle:** Standardbenutzer  
**Lizenz:** Noch nicht zugewiesen  

## Ziel

Ein Benutzerkonto in Microsoft 365 per PowerShell mit dem Microsoft Graph-Modul anlegen.

## Schritte

1. Import-Module Microsoft.Graph
2. Connect-MgGraph -Scopes "User.ReadWrite.All", "Directory.ReadWrite.All"
3. Microsft Entra Admin Cnter öffnen > ganz oben Übersicht > Eigenschaften > ganz unten Sicherheitsstandard verwalten > deaktivieren
5. CSV Datei ersellen
6. Powershell Benutzer hinzufügen:
$users = Import-Csv -Path "C:\Users\lucas\OneDrive\Desktop\Systemadministrator\M365\USer_hinzufügen.csv"

foreach ($user in $users) {
    Write-Host "🔄 Verarbeite Benutzer: $($user.DisplayName)..." -ForegroundColor Cyan

    $passwordProfile = New-Object -TypeName Microsoft.Graph.PowerShell.Models.MicrosoftGraphPasswordProfile
    $passwordProfile.Password = $user.Password
    $passwordProfile.ForceChangePasswordNextSignIn = $true

    try {
        New-MgUser -DisplayName $user.DisplayName `
                   -GivenName $user.GivenName `
                   -Surname $user.Surname `
                   -UserPrincipalName $user.UserPrincipalName `
                   -MailNickname $user.MailNickname `
                   -PasswordProfile $passwordProfile `
                   -AccountEnabled:$true `
                   -UsageLocation $user.UsageLocation

        Write-Host "✅ Benutzer $($user.DisplayName) erfolgreich erstellt." -ForegroundColor Green
    }
    catch {
        Write-Host "❌ Fehler bei $($user.DisplayName): $_" -ForegroundColor Red
    }
}

##  Screenshots:
![image](https://github.com/user-attachments/assets/9c55bc7e-5094-461a-9add-8849d18709da)

## Hinweise 
klappt noch nicht


