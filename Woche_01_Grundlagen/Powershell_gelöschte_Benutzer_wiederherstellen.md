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

5. Schauen ob gelöschte User angezeigt werden:
    Get-MgDirectoryDeletedUser | Format-Table DisplayName,UserPrincipalName

6. Cs Datei laden + überprüfen:
   $users = Import-Csv -Path "C:\Users\lucas\OneDrive\Desktop\Systemadministrator\users_to_restore.csv"
   $users | Format-Table

7. Skript laufen lassen:
foreach ($user in $users) {
    $deletedUser = Get-MgDirectoryDeletedUser -Filter "UserPrincipalName eq '$($user.UserPrincipalName)'"
    if ($deletedUser) {
        Restore-MgDirectoryDeletedUser -UserId $deletedUser.Id
        Write-Host "✅ Wiederhergestellt: $($user.UserPrincipalName)"
    } else {
        Write-Host "⚠️ Nicht gefunden: $($user.UserPrincipalName)"
    }
}

## Screenshots
![image](https://github.com/user-attachments/assets/89c19af9-7bd1-4680-98b0-5be028ea4d83)

![image](https://github.com/user-attachments/assets/7ae27745-8d11-4454-a185-b8a958bee846)

![image](https://github.com/user-attachments/assets/27e422f7-d0a6-4639-a26d-a86f7d74e8b0)



## Hinweise
Bei der erstmaligen Installation müssen erst alle Module intsalliert werden, sonst klappt es nicht
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
