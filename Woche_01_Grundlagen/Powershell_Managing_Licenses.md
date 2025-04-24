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
- SkuldID mit tatsächlicher ID erstzen, die wir durch schritt 4 herausbekommen
- Powershell Code immer in Notepad einfügen und dann über Strg A + Strg C, Strg V einfügen
- Alle Module müssen installiert sein, sonst klappt es nicht
- Module zu installieren dauert immer eine Weile

## Screenshots

![image](https://github.com/user-attachments/assets/c6b3e306-25c6-4774-9e97-4480b1041493)

![image](https://github.com/user-attachments/assets/3026e14b-64fc-4aa9-b19d-f7a796377ffa)

![image](https://github.com/user-attachments/assets/7c93e7d7-fbb4-4464-85c7-cd9deba6595f)

![image](https://github.com/user-attachments/assets/ff2d1a28-7790-4078-bf66-abeed272647c)

![image](https://github.com/user-attachments/assets/14429c0f-b74f-4293-a29c-62b5e0bc94ef)

![image](https://github.com/user-attachments/assets/d8ab5c03-00d5-4dfd-82b6-b176e663359f)

![image](https://github.com/user-attachments/assets/d65f7a40-d318-4d25-9650-d1e20d55b84f)

![image](https://github.com/user-attachments/assets/c46e4a32-d390-478a-a3cb-2fac590b0f06)






