# Bei Erstinstallation diese Module installieren:

Install-Module Microsoft.Graph -Scope CurrentUser -Force
Install-Module ExchangeOnlineManagement -Scope CurrentUser -Force
Install-Module MicrosoftTeams -Scope CurrentUser -Force
Install-Module SharePointPnPPowerShellOnline -Scope CurrentUser -Force


# Bei Erstinstalltion auch mit allem einmal verbinden:

Connect-MgGraph -Scopes "User.ReadWrite.All", "Group.ReadWrite.All", "Directory.ReadWrite.All"
Connect-ExchangeOnline
Connect-MicrosoftTeams

