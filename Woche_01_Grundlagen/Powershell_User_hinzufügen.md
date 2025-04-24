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
3. CSV Datei ersellen
4. Powershell Benutzer hinzufügen:

Connect-MgGraph -Scopes "User.ReadWrite.All", "Directory.ReadWrite.All"

$users = Import-Csv -Path "C:\Users\lucas\OneDrive\Desktop\Systemadministrator\M365\USer_hinzufügen.csv"

foreach ($user in $users) {
    Write-Host "🔄 Erstelle Benutzer: $($user.DisplayName)" -ForegroundColor Cyan

    $passwordProfile = New-Object -TypeName Microsoft.Graph.PowerShell.Models.MicrosoftGraphPasswordProfile
    $passwordProfile.Password = $user.Password
    $passwordProfile.ForceChangePasswordNextSignIn = $true

    try {
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


##  Screenshots:

![image](https://github.com/user-attachments/assets/0a30a167-1890-4c87-b727-4ab4bf98ec7f)

![image](https://github.com/user-attachments/assets/5a5adfde-fd0f-49dc-888d-d2cbeaca8d01)

![image](https://github.com/user-attachments/assets/a6fad2ef-a180-4eeb-9dba-7574aebad297)


## Hinweise 
Bei Problemen Powershell schließen und neu laden.
Wenn amn Module einmal installiert hat braucht man diese nicht mehr.

