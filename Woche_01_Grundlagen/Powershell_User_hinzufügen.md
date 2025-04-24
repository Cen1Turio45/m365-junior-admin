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
4. CSV Datei ersellen
5. Powershell Benutzer hinzufügen:
