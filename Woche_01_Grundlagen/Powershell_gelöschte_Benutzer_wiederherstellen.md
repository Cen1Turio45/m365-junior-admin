# Bulk User Recovery

## Ziel 
Die 2 gelöschten Test User mit Powershell wiederherstellen

## Schritte
1. Csv Datei erstellen
2. Powershell öffnen
3. Microsoft.Graph Module installieren
4. Microsoft Device Login Befehl in Powershell eingeben
5. Cs Datei laden + überprüfen
6. Skript laufen lassen

Alle wichtigen Daten sind unter Powershell Code zu finden!


## Screenshots

![image](https://github.com/user-attachments/assets/bad1d381-cc6e-42d9-bd7e-ddb9676aa49d)

![image](https://github.com/user-attachments/assets/635b1b10-0e62-45c0-9756-36207a20ee3c)

![image](https://github.com/user-attachments/assets/3615ad8b-6b0a-4c4b-800b-631cea37930b)

![image](https://github.com/user-attachments/assets/b9e862aa-bbfb-48c5-aa5e-eb9ee634559d)

![image](https://github.com/user-attachments/assets/745ad83a-8f25-4524-91ce-58cca4e5d405)

![image](https://github.com/user-attachments/assets/de1a4a5a-084c-4978-9e32-ce51795ad1d5)

## Hinweise
Beim öffnen von Powershell müssen alle Module intsalliert werden, 
sonst klappt es nicht.

Windows 11 spiechert deinen Desktop bei OneDrive und nicht direkt auf dem Benutzer.

Powershell-Code immer in Notepad einfügen und dann mit Strg A Strg kopieren.



## Powershell Code
Module:
Import-Module Microsoft.Graph

M365 Login:
Connect-MgGraph -Scopes "User.ReadWrite.All"

CS Datei Laden:
$users = Import-Csv -Path "C:\Users\lucas\OneDrive\Desktop\Systemadministrator\users_to_restore.csv"
$deleted = Get-MgDirectoryDeletedUser

Skript:

Beim Skript erst einmal den $deleted= part eingen und enter und danach das Skript!

$deleted = Get-MgDirectoryDeletedUser

foreach ($target in $users) {
    $match = $deleted | Where-Object { $_.DisplayName -eq $target.DisplayName }
    if ($match) {
        Invoke-MgGraphRequest -Method POST -Uri "https://graph.microsoft.com/v1.0/directory/deletedItems/$($match.Id)/restore"
        Write-Host "✅ Wiederhergestellt: $($match.DisplayName)"
    } else {
        Write-Host "⚠️ Nicht gefunden: $($target.DisplayName)"
    }
}
