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
    # Passwortprofil definieren
    $passwordProfile = @{
        Password = $user.Password
        ForceChangePasswordNextSignIn = $true
    }

##  Screenshots:

![image](https://github.com/user-attachments/assets/bdeccef0-5083-4366-8235-5efa13dff586)

![image](https://github.com/user-attachments/assets/adf11624-26aa-4847-92c2-2e3a4c527b67)
