# Lizenzen verwalten mit PowerShell

**Benutzername:** Max Mustertest  
**E-Mail:** max@LucasTest186.onmicrosoft.com  
**Aktion:** Lizenz zugewiesen  
**Lizenz:** Microsoft 365 Business Standard  


## Voraussetzungen

- PowerShell 7
- Modul `Microsoft.Graph` installiert
- Admin-Rechte im Tenant

## Schritte

1. PowerShell als Admin öffnen

2. Module installieren:
  - Import-Module Microsoft.Graph
  - Install-Module Microsoft.Graph -Scope CurrentUser -Force -AllowClobber
  - Import-Module Microsoft.Graph.Users -Force


3. Bei Microsoft Graph anmelden:
Connect-MgGraph -Scopes "User.ReadWrite.All"

4. Liznez-ID anzeigen:
Get-MgSubscribedSku | Select SkuPartNumber, SkuId

5. Lizenz hinzufügen:

$User = Get-MgUser -UserPrincipalName "test01@LucasTest186.onmicrosoft.com"

   $AddLicense = @{
       AddLicenses = @(@{
           SkuId = "f245ecc8-75af-4f8e-b61f-27d8114de5f3"
       })
       RemoveLicenses = @()
   }

   Set-MgUserLicense -UserId $User.Id -BodyParameter $AddLicense

6. Lizenz entfernen:

$User = Get-MgUser -UserPrincipalName "test01@LucasTest186.onmicrosoft.com"

$RemoveLicense = @{
    AddLicenses = @()
    RemoveLicenses = @(
        "f245ecc8-75af-4f8e-b61f-27d8114de5f3"
    )
}

Set-MgUserLicense -UserId $User.Id -BodyParameter $RemoveLicense

## Hinweise
- SkuldID mit tatsächlicher ID erstzen
- Powershell code immer in Notepad einfügen und dann über Strg A + Strg C, Strg V einfügen

## Screenshots

![image](https://github.com/user-attachments/assets/c6b3e306-25c6-4774-9e97-4480b1041493)

![image](https://github.com/user-attachments/assets/3026e14b-64fc-4aa9-b19d-f7a796377ffa)

![image](https://github.com/user-attachments/assets/7c93e7d7-fbb4-4464-85c7-cd9deba6595f)

![image](https://github.com/user-attachments/assets/ff2d1a28-7790-4078-bf66-abeed272647c)


