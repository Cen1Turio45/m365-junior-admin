# Häufigste Fehler & Lösungen – PowerShell für M365

1. nicht die richtigen Module installiert gehabt, weswegen es oft Fehlercodes gab.  
   → Lösung: Vor dem Ausführen eines Skripts sicherstellen, dass alle Module installiert sind, z. B. mit `Install-Module Microsoft.Graph -Scope CurrentUser`.

2. nicht richtig angemeldet, heißt nicht auf den Fehlercode geachtet  
   → Lösung: Anmeldung immer mit Scopes und auf Rückmeldungen achten, z. B. `Connect-MgGraph -Scopes "User.ReadWrite.All", "Directory.ReadWrite.All"`.

3. Mit einer Session weitergearbeitet die bereits Fehler gespeichert hatte, statt diese neuzustarten, da ich nicht wusste dass die Anmeldung und Module installiert bleiben, wenn ich eine neue Session öffne  
   → Lösung: PowerShell bei größeren Skripten neu starten oder mit `Disconnect-MgGraph` & `Remove-Variable` aufräumen.

4. Code direkt in PowerShell eingefügt, statt diesen erst in ein Notepad einzufügen, dann mit Strg + A, Strg + C und Strg + V zu kopieren und einzufügen und dadurch oft Fehler bekommen  
   → Lösung: Skripte immer zuerst in Notepad oder VS Code schreiben und dann komplett in einem Block einfügen.
