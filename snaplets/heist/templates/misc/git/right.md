## Git auf ob.cs.hm.edu

Die Git-Repos auf diesem Server werden mit [Gitolite](http://gitolite.com/) verwaltet.
Um Zugriff auf ausgewählte Repositories zu bekommen, ist es notwendig, dass Sie sich
ein [SSH](http://de.wikipedia.org/wiki/Secure_Shell)-Key-Pair generieren und mir
den Public Key zukommen lassen. Um den Administrationsaufwand, gerade zu Beginn des
Semesters, in einem vernünftigen Rahmen zu halten, werden Sie in einer der ersten
Lehrveranstaltung genau erfahren **wie** Sie mir den Schlüssel zur Verfügung stellen
müssen.

Wie Sie den Schlüssel am Besten generieren, finden Sie auf dieser Seite unter
der Überschrift **SSH-Keys generieren**.

### Erstmal `testing`

Sobald ich Ihren Schlüssel hinzugefügt habe, können Sie loslegen. Sie haben alle
Zugriff auf das `testing`-Repository mit dem Sie nach Belieben Dinge ausprobieren
können.

Clonen Sie dazu das Repository auf der Kommandozeile mit dem Befehl:

    git clone ssh://git@ob.cs.hm.edu:8022/testing.git

Die URL besteht dabei aus verschiedenen Bestandteilen:

-   *ssh* ist das zu verwendende Protokoll. Ich biete nur SSH an.
-   *git* ist der User unter dem Gitolite auf dem Server läuft.
-   *ob.cs.hm.edu* ist der Servername.
-   *8022* ist der Port unter dem der SSH-Daemon läuft.
-   *testing.git* ist der Repository-Name.

Wenn das Kommando erfolgreich durch läuft, haben Sie anschließend das
`testing`-Repository in dem aktuellen Verzeichnis.

### Infos von Gitolite

Die Verwendung von Gitolite mit SSH hat den Vorteil, dass Sie auch verschiedene
Informationen abrufen können. Dazu benötigen Sie das `ssh`-Kommando.

Informationen über Ihre Zugriffsrechte bekommen Sie über

    ssh -p 8022 git@ob.cs.hm.edu info

Auch hier finden Sie wieder die Informationen zu Port, Git-User und Servername;
nur in einer leicht differierenden Syntax.

Mit diesem Kommando finden Sie insbesondere die Namen--- und damit die URLs ---Ihrer Repositories heraus und wissen so genau welches Repo Sie clonen bzw. in welches Sie
pushen sollen.

Ob ich Ihnen weitere Kommandos zur Verfügung stelle, erfahren Sie jeweils in der
Lehrveranstaltung.

## Troubleshooting

Bevor Sie sich an mich wenden, weil Sie keinen Zugriff haben, überprüfen Sie bitte
folgendes:

-   Hat mein Git-Programm Zugriff auf den zum Public SSH-Key passenden Secret SSH-Key?
-   Kann ich das `testing`-Repo clonen?
-   Welche Zugriffrechte habe ich laut Gitolite?

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

## Vorhandene SSH-Keys nutzen

Wenn Sie bereits ein SSH-Schüsselpaar im OpenSSH-Format haben, können Sie dieses
selbstverständlich verwenden. Auch wenn Sie auf mehreren Rechnern arbeiten wollen,
können Sie den privaten Schlüssel einfach an die entsprechende Stelle (`~/.ssh/` bzw.
`c:\Benutzer\.ssh\`) auf den verschiedenen Rechnern kopieren.

