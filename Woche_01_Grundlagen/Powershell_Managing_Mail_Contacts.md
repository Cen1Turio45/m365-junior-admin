# Mail-Kontakte verwalten mit PowerShell (Exchange Online)

**Aktion:** Kontakt erstellen, anzeigen, bearbeiten, löschen  

## Voraussetzungen

- PowerShell 7
- Berechtigungen für Exchange Online
- ExchangeOnlineManagement Modul installiert

## Schritte:

1. Import-Module Microsoft.Graph
2. Install-Module ExchangeOnlineManagement -Scope CurrentUser -Force
3. Connect-ExchangeOnline -UserPrincipalName LucasWessner@LucasTest186.onmicrosoft.com

4. Mail Kontakt hinzufügen:
    New-MailContact `
   -Name "Test Test04" `
   -ExternalEmailAddress "test04@example.com" `
   -FirstName "Test" `
   -LastName "Test04" `
 

5. Alle Mail Kontakt anzeigen:
Get-MailContact | Format-Table Name, ExternalEmailAddress

6. nur ein bestimmter Mail Kontakt:
Get-MailContact -Identity "Test Test04"

7. Kontakt bearbeiten:
Set-MailContact -Identity "Test Test04" -DisplayName "Externer Supportpartner"

8. Kontakt löschen:
Remove-MailContact -Identity "Externer Partner"

 9. Mehrere Kontakte mit CSV hinzufügen:
$kontakte = Import-Csv "C:\Users\lucas\OneDrive\Desktop\Systemadministrator\M365\E-Mail.csv"

foreach ($kontakt in $kontakte) {
    New-MailContact -Name $kontakt.Name -ExternalEmailAddress $kontakt.ExternalEmailAddress
    Write-Host "✅ Erstellt: $($kontakt.Name)"
}




## Hinweise
- Exchange Domain muss auch abgeändert werden
- CSV Datei muss so aussehen:
Name,ExternalEmailAddress
Externer Kunde1,externer1@example.com
Externer Kunde2,externer2@example.com
- Pfad muss auch angepasst werden, Achtung OneDrive
- Lädt teilweise kurz, Geduld haben

## Screenshots

![image](https://github.com/user-attachments/assets/d33ffde7-81f2-44ec-973c-8ac71e457b40)

![image](https://github.com/user-attachments/assets/2f16af43-9d71-4f31-91e3-fac4fb04c878)

![image](https://github.com/user-attachments/assets/f828ee05-ddae-4887-8f9a-39ede9583302)

![image](https://github.com/user-attachments/assets/eecb89fb-fccb-4e63-a1e4-e3e02ee84d01)

![image](https://github.com/user-attachments/assets/11904a8c-7eb1-4263-bd16-5398d72da710)

![image](https://github.com/user-attachments/assets/50152b33-185c-4528-8442-d209fbc62945)

![image](https://github.com/user-attachments/assets/1a1de28f-2dc9-4295-8c94-ff70e64e847e)

![image](https://github.com/user-attachments/assets/1988b6d8-08ad-4d12-ae03-8f9a35886c47)

![image](https://github.com/user-attachments/assets/b6a79889-e549-4556-8e68-c16b2de83c8a)

![image](https://github.com/user-attachments/assets/bd044c17-1218-46cb-bf06-44d690b0159f)

![image](https://github.com/user-attachments/assets/a14f329a-2c35-4385-9383-f51a121707a9)
