# Hinweis: Um Module zu laden + anmelden schau bei Erstinstallation M365

# Verfügbare Lizenzen anzeigen
Write-Host "`n📦 Verfügbare Lizenzen:" -ForegroundColor Cyan
Get-MgSubscribedSku | Select SkuPartNumber, SkuId | Format-Table

# Benutzer & Lizenzdaten abfragen
$userUPN = Read-Host "`nGib den UserPrincipalName des Benutzers ein"
$skuId = Read-Host "Gib die Lizenz-SkuId ein, die du ZUWEISEN willst"

# Benutzer abrufen
$user = Get-MgUser -UserPrincipalName $userUPN

# Lizenz hinzufügen
$addLicense = @{
    AddLicenses    = @(@{ SkuId = $skuId })
    RemoveLicenses = @()
}

Set-MgUserLicense -UserId $user.Id -BodyParameter $addLicense

Write-Host "✅ Lizenz wurde dem Benutzer $userUPN hinzugefügt." -ForegroundColor Green


# Lizenz entfernen
$removeLicense = @{
    AddLicenses    = @()
    RemoveLicenses = @($skuId)
}

Set-MgUserLicense -UserId $user.Id -BodyParameter $removeLicense

Write-Host "❌ Lizenz wurde vom Benutzer $userUPN entfernt." -ForegroundColor Yellow
