# Bulk User Recovery

## Ziel 
Die 2 gelöschten Test User mit Powershell wiederherstellen

## Schritte
1. Csv Datei erstellen

2. Powershell öffnen

3. Module installieren:
   Install-Module Microsoft.Graph -Scope CurrentUser -Force und mit Y bestätigen

4. Microsoft Device Login Befehl in Powershell eingeben:
   Connect-MgGraph -Scopes "User.ReadWrite.All"

5. Cs Datei laden + überprüfen:
   $users = Import-Csv -Path "C:\Users\lucas\OneDrive\Desktop\Systemadministrator\users_to_restore.csv"
   $users | Format-Table

6. Skript laufen lassen:
foreach ($user in $users) {
    $deletedUser = Get-MgDirectoryDeletedUser -Filter "UserPrincipalName eq '$($user.UserPrincipalName)'"
    if ($deletedUser) {
        Restore-MgDirectoryDeletedUser -UserId $deletedUser.Id
        Write-Host "Wiederhergestellt: $($user.UserPrincipalName)"
    } else {
        Write-Host " Nicht gefunden: $($user.UserPrincipalName)"
    }
}

## Screenshots
![image](https://github.com/user-attachments/assets/bad1d381-cc6e-42d9-bd7e-ddb9676aa49d)

![image](https://github.com/user-attachments/assets/635b1b10-0e62-45c0-9756-36207a20ee3c)





## Hinweise
Bei der erstmaligen Installation müssen erst alle Module intsalliert werden, 
sonst klappt es nicht

Windows 11 spiechert deinen Desktop bei OneDrive und nicht direkt auf dem Benutzer

Powershell-Code immer in Notepad einfügen und dann mit Strg A Strg kopieren

Bei jeder neuen Sitzung Modul neu installieren

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
