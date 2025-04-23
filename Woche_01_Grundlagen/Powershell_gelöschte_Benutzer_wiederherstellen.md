# Bulk User Recovery

## Ziel 
Die 2 gelöschten Test User mit Powershell wiederherstellen

## Schritte
1. Csv Datei erstellen

2. Powershell öffnen

3. Module installieren:
   Import-Module Microsoft.Graph
   Install-Module Microsoft.Graph -Scope CurrentUser -Force -AllowClobber

5. Microsoft Device Login Befehl in Powershell eingeben:
   Connect-MgGraph -Scopes "User.ReadWrite.All"

6. Cs Datei laden + überprüfen:
   $users = Import-Csv -Path "C:\Users\lucas\OneDrive\Desktop\Systemadministrator\users_to_restore.csv"
   $users | Format-Table

7. Skript laufen lassen:

![image](https://github.com/user-attachments/assets/1656059e-9367-449c-a5b9-25d5945dd932)


## Screenshots
![image](https://github.com/user-attachments/assets/bad1d381-cc6e-42d9-bd7e-ddb9676aa49d)

![image](https://github.com/user-attachments/assets/635b1b10-0e62-45c0-9756-36207a20ee3c)





## Hinweise
Beim öffnen von Powershell müssen alle Module intsalliert werden, 
sonst klappt es nicht.

Windows 11 spiechert deinen Desktop bei OneDrive und nicht direkt auf dem Benutzer.

Powershell-Code immer in Notepad einfügen und dann mit Strg A Strg kopieren.



## Powershell Code

Connect-MgGraph -Scopes "User.ReadWrite.All"

$users = Import-Csv -Path "C:\Users\lucas\OneDrive\Desktop\Systemadministrator\users_to_restore.csv"

foreach ($user in $users) {
    $deletedUser = Get-MgDirectoryDeletedUser -Filter "UserPrincipalName eq '$($user.UserPrincipalName)'"
    if ($deletedUser) {
        Restore-MgDirectoryDeletedUser -UserId $deletedUser.Id
        Write-Host "✅ Wiederhergestellt: $($user.UserPrincipalName)"
    } else {
        Write-Host "⚠️ Nicht gefunden: $($user.UserPrincipalName)"
    }
}
