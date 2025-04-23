# Bulk User Recovery

## Ziel 
Die 2 gelöschten Test User mit Powershell wiederherstellen

## Schritte
1. Csv Datei erstellen
2. Powershell öffnen
3. Csv Datei uplaoden oben links bei Manage Files
4. Mit cd und ls schauen ob Datei hochgeladen wurde
5. Microsoft Device Login Befehl in Powershell eingeben:
Connect-MgGraph -Scopes "User.ReadWrite.All"
6. Webseite öffnen und Code einfügen und anmelden
7. Module installieren:
   Install-Module Microsoft.Graph -Scope CurrentUser -Force
8.Skript laufen lassen:


## Screenshots
![image](https://github.com/user-attachments/assets/89c19af9-7bd1-4680-98b0-5be028ea4d83)

![image](https://github.com/user-attachments/assets/533a3ebf-5d51-4388-84bf-ebc66589fd96)

![image](https://github.com/user-attachments/assets/bdf35bac-fd07-4db0-8f23-e4b2dc66e6cd)

![image](https://github.com/user-attachments/assets/1683465f-9ff7-4a66-a770-d0cc299012d0)

![image](https://github.com/user-attachments/assets/b367f0e9-8eda-4394-89ea-d651a590127f)

## Hinweise
Bei der erstmaligen Installation müssen erst alle Module intsalliert werden, sonst klappt es nicht!



## Powershell Code

Connect-MgGraph -Scopes "User.ReadWrite.All"

$users = Import-Csv -Path "C:\Pfad\zu\users_to_restore.csv"

foreach ($user in $users) {
    $deletedUser = Get-MgDirectoryDeletedUser -Filter "UserPrincipalName eq '$($user.UserPrincipalName)'"
    if ($deletedUser) {
        Restore-MgDirectoryDeletedUser -UserId $deletedUser.Id
        Write-Host "✅ Wiederhergestellt: $($user.UserPrincipalName)"
    } else {
        Write-Host "⚠️ Nicht gefunden: $($user.UserPrincipalName)"
    }
}
