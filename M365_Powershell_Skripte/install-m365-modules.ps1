# ---------------------------------------
# Installation & Import für M365 Module
# ---------------------------------------

# Installiere Microsoft.Graph komplett (enthält alle Untermodule wie Users, Groups, Mail etc.)
Install-Module Microsoft.Graph -Scope CurrentUser -Force -AllowClobber

# Wichtig: Beim ersten Mal ggf. mit -AllowClobber bestätigen, wenn andere Module ähnliche Cmdlets haben

# Optional: Nur spezifische Untermodule (wenn du schlanker arbeiten willst)
# Install-Module Microsoft.Graph.Users -Scope CurrentUser -Force
# Install-Module Microsoft.Graph.Groups -Scope CurrentUser -Force
# Install-Module Microsoft.Graph.Mail -Scope CurrentUser -Force
# Install-Module Microsoft.Graph.Identity.DirectoryManagement -Scope CurrentUser -Force

# ---------------------------------------
# Module importieren (wenn bereits installiert)
# ---------------------------------------
Import-Module Microsoft.Graph

# Optional einzeln:
# Import-Module Microsoft.Graph.Users
# Import-Module Microsoft.Graph.Groups
# Import-Module Microsoft.Graph.Mail

# ---------------------------------------
# Verbindung aufbauen (nur nötig für bestimmte Cmdlets)
# ---------------------------------------
Connect-MgGraph -Scopes "User.ReadWrite.All", "Group.ReadWrite.All", "Directory.ReadWrite.All"
