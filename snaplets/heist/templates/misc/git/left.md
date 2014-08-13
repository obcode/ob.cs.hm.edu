## Git

[Git](http://git-scm.com/) ist ein verteiltes Versionskontrollsystem das ich
in vielen Lehrveranstaltung für die Abgabe von Aufgaben verwende.

Um Git zu nutzen brauchen Sie eine Git-Installation auf dem von Ihnen verwendeten
Rechner. Unter <http://git-scm.com/downloads> können Sie Git und verschiedene GUIs
herunterladen. Unter Windows empfiehlt sich die Verwendung von
<http://msysgit.github.io/>. Ein nettes und kostenfreies Git-GUI für Windows und Mac
ist [SourceTree](http://www.sourcetreeapp.com/).

## Zu Allererst: Die eigene Identität

Nach der Installation von Git und **vor** dem Start mit Git stellen Sie sicher, dass
Git Ihren korrekten Namen und Ihre korrekte E-Mail-Adresse kennt. Geben Sie dazu
folgendes so ein, dass Sie `MEIN NAME` und `MEINE E-MAIL-ADRESSE` durch Ihren
Namen und Ihre E-Mail-Adresse ersetzen:

    git config --global user.name "MEIN NAME"
    git config --global user.email "MEINE E-MAIL-ADRESSE"

## Ressourcen

Einen umfassenden Überblick über Git bietet das [Pro
Git-Buch](http://git-scm.com/book/de). Einen guten Einstieg bieten außerdem die
[Git-Tutorials](https://www.atlassian.com/de/git) von Atlassian. Um zu testen ob Sie
sich schon gut in Git auskennen, gibt es ein nettes
[Git-Spiel](http://pcottle.github.io/learnGitBranching/).

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
