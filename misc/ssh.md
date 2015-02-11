---
title: OpenSSH-Keys generieren und nutzen
image: /img/openssh.jpg
---

<div class="row">
<div class="span6">

## SSH-Keys generieren

Es gibt verschiedene Formate in denen Schlüssel für verschiedene SSH-Versionen
vorliegen können.

**Ich brauche von Ihnen den öffentlichen Schlüssel im Standard-OpenSSH-Format.**

Das Format ist *eine* Zeile in der folgende Informationen stehen:

    <ssh-rsa> <really long string of nonsense> <username>@<host>

Andernfalls wird der Zugriff nicht funktionieren.

Haben Sie bereits ein OpenSSH-Key-Pair brauchen Sie natürlich kein neues zu
generieren.

Um die Schlüssel unter unixoiden Betriebssystemen (Linux, MacOS X, ...) 
bzw. unter Windows in der Git Bash zu generieren,
geben Sie folgendes auf der Kommandozeile ein:

    ssh-keygen -t rsa

Verwenden Sie zum Speichern die standardmäßig angegebene Lokation, `~/.ssh/id_rsa`.
Damit können die verschiedenen Git-Clients unter Unixen automatisch ihren
Secret-SSH-Key finden.

Wenn Sie eine `passphrase` für Ihren Schlüssel eingeben, sichern Sie damit den
lokalen Zugriff auf Ihren Secret-Key ab und müssen diese Passphrase bei jedem
clonen, pushen, pullen und fetchen eingeben.

Den generierte Public-Key `id_rsa.pub` müssen Sie mir dann, auf dem in der
Lehrveranstaltung besprochenen Wege, zukommen lassen.

Um Ihren Key unter Windows in [SourceTree](http://www.sourcetreeapp.com/) nutzen zu
können, müssen Sie dann beim ersten Start einfach "Use OpenSSH" auswählen.

</div>
<div class="span6">

## Vorhandene SSH-Keys nutzen

Wenn Sie bereits ein SSH-Schüsselpaar im OpenSSH-Format haben, können Sie dieses
selbstverständlich verwenden. Auch wenn Sie auf mehreren Rechnern arbeiten wollen,
können Sie den privaten Schlüssel einfach an die entsprechende Stelle (`~/.ssh/` bzw.
`c:\Benutzer\.ssh\`) auf den verschiedenen Rechnern kopieren.


</div>
</div>
