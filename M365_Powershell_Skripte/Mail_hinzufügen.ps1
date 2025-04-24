# Hinweis: Um Module zu laden + anmelden schau bei Erstinstallation M365

# E_Mail Kontakt hinzufügen:
 $name = Read-Host "Name"
        $email = Read-Host "Externe E-Mail-Adresse"
        $vorname = Read-Host "Vorname"
        $nachname = Read-Host "Nachname"

        New-MailContact -Name $name `
                        -ExternalEmailAddress $email `
                        -FirstName $vorname `
                        -LastName $nachname

        Write-Host "✅ Kontakt erstellt: $name" -ForegroundColor Green
    }

# Alle E-Mail Kontakte anzeigen:
 Get-MailContact | Format-Table Name, ExternalEmailAddress

# Einzelne E-Mail Kontakte anzeigen:
 $id = Read-Host "Name oder E-Mail des Kontakts"
        Get-MailContact -Identity $id | Format-List

# E-Mail Kontakt bearbeiten:
 $id = Read-Host "Name des zu bearbeitenden Kontakts"
        $displayName = Read-Host "Neuer Anzeigename"
        Set-MailContact -Identity $id -DisplayName $displayName
        Write-Host "✅ Kontakt aktualisiert: $displayName" -ForegroundColor Yellow

# Kontakt löschen:
$id = Read-Host "Name oder E-Mail des zu löschenden Kontakts"
        Remove-MailContact -Identity $id -Confirm:$false
        Write-Host "❌ Kontakt gelöscht: $id" -ForegroundColor Red

# Kontakte aus CSV importieren:
$pfad = Read-Host "Pfad zur CSV-Datei (z. B. C:\Pfad\kontakte.csv)"
        $kontakte = Import-Csv -Path $pfad

        foreach ($kontakt in $kontakte) {
            New-MailContact -Name $kontakt.Name `
                            -ExternalEmailAddress $kontakt.ExternalEmailAddress `
                            -FirstName $kontakt.FirstName `
                            -LastName $kontakt.LastName

            Write-Host "✅ Erstellt: $($kontakt.Name)" -ForegroundColor Green
        }
    }

    default {
        Write-Host "Ungültige Auswahl." -ForegroundColor Red
    }
}
