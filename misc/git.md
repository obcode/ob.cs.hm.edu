---
title: Versionskontrolle mit Git über SSH
image: http://git-scm.com/images/logo@2x.png
---

<div class="row">
<div class="span6">

## Git

[Git](http://git-scm.com/) ist ein verteiltes Versionskontrollsystem das ich
in vielen Lehrveranstaltung für die Abgabe von Aufgaben verwende.

Um Git zu nutzen brauchen Sie eine Git-Installation auf dem von Ihnen verwendeten
Rechner. Unter <http://git-scm.com/downloads> können Sie Git und verschiedene GUIs
herunterladen. Unter Windows empfiehlt sich die Verwendung von
<http://msysgit.github.io/>. Ein nettes und kostenfreies Git-GUI für Windows und Mac
ist [SourceTree](http://www.sourcetreeapp.com/).

## Ressourcen

Einen umfassenden Überblick über Git bietet das [Pro
Git-Buch](http://git-scm.com/book/de). Einen guten Einstieg bieten außerdem die
[Git-Tutorials](https://www.atlassian.com/de/git) von Atlassian. Um zu testen ob Sie
sich schon gut in Git auskennen, gibt es ein nettes
[Git-Spiel](http://pcottle.github.io/learnGitBranching/).

## Dos and Don'ts

Beachten Sie folgendes beim Arbeiten mit Git, insbesondere für Repos auf
ob.cs.hm.edu.

### Zu Allererst: Die eigene Identität

Nach der Installation von Git und **vor** dem Start mit Git stellen Sie sicher, dass
Git Ihren korrekten Namen und Ihre korrekte E-Mail-Adresse kennt. Geben Sie dazu
folgendes so ein, dass Sie `MEIN NAME` und `MEINE E-MAIL-ADRESSE` durch Ihren
Namen und Ihre E-Mail-Adresse ersetzen:

    git config --global user.name "MEIN NAME"
    git config --global user.email "MEINE E-MAIL-ADRESSE"

**Keine Commits unter Pseudonymen.**

### Committen Sie Sourcecode

**und keine Artefakte die generiert werden können (Objektdateien, API-Dokumentation, ...)**. Fügen Sie stattdessen eine Datei `README.txt` hinzu in der
steht **wie** die Artefakte erzeugt werden können (z.B. compilieren mit `ghc` oder
generieren mit `javadoc`).

Damit Sie nichts aus Versehen committen, verwenden Sie eine `.gitignore`-Datei. In dieses steht alles was von Git ignoriert werden soll. Verschiedene `.gitignore`-Dateien
finden Sie auf [GitHub](https://github.com/github/gitignore).

### Committen Sie oft und logische, kleine Häppchen mit vernünftigen Messages

Ein Versionskontrollsystem wie Git kann seine Stärken insbesondere dann ausspielen,
wenn Sie kleine Commits machen **und** eine vernünftige Commit-Message angeben.

Mit einer Commit-Message *"Nächster Commit"* können Sie später wenig anfangen.
Auch ist ein Commit in dem Sie 500 Zeilen in 50 Dateien verändert haben nicht
wirklich hilfreich und übersichtlich.

Kleine Commits haben einige Vorteile:

-   Die Entwicklungshistorie ist sichtbar. Wann wurde was eingefügt, weg genommen,
    geändert, ....

-   Mit dem Kommando `git blame` können Sie sich für jede Zeile anzeigen lassen,
    mit welchem Commit die letzte Änderung committet wurde.

-   Mit dem Kommando `git bisect` können Sie den Commit suchen der einen Bug
    eingefügt hat.

Insbesondere wenn ich bei kleinen Gruppen die Mitglieder einzeln bewerten muss, ist
es wichtig für mich über die Commits zuzuordnen wer was gemacht hat.

### Pushen Sie nur Code der compilierbar und ausführbar ist

Gerade wenn Sie zusammen arbeiten, gibt es nichts Blöderes als erstmal die Fehler
der/des Anderen verbessern zu müssen, bevor Sie an Ihrem eigenen Code
weiter arbeiten können.

Verwenden Sie Branches um herumzuexperimentieren.

### Schauen Sie sich genau an was Sie committen

Mit `git add --patch` können Sie interaktiv einzelne Teile "stagen", d.h. zum
nächsten, geplanten Commit hinzufügen. Neue Dateien müssen Sie explizit mit `git add`
hinzügen. Wenn Sie damit fertig sind, zeigt Ihnen `git diff --cached` noch einmal
alles was Sie committen wollen an. Wenn Sie damit zufrieden sind, können Sie das dann
einfach committen.

Tipp: Die Verwendung eines GUIs für Git hilft Ihnen dabei auch.

Und nochmal (siehe oben): Committen Sie nichts was aus Ihren Sourcen gebaut wird!

### Nutzen Sie `git rebase` --- mit viel Vorsicht


`git rebase` ist ein tolles, aber auch gefährliches Feature. Sobald Sie etwas "rebasen"
das schon gepusht ist, müssten Sie einen "force push" machen um die Historie auf
dem Server zu ändern. Und das kann die Arbeit der/des Anderen verschwinden lassen.

Deshalb: Nur "rebasen" was noch nicht gepusht ist!

### Löschen Sie keine nicht-gemergten Remote Branches

Ein Branch in Git ist nur ein Pointer auf einen Commit. Wenn Sie ihn löschen und die
Commits nicht gemerged haben, wird der Garbage Collector die Commits irgendwann mal
löschen. Sie können den Branch `obsolete-branch` mit dem folgenden Kommando so mergen,
dass er erreichbar bleibt, aber nicht von den Commits in den aktuellen Branch
übernommen wird:

    git merge -s ours --edit obsolete-branch

Vermerken Sie in der Message, dass der `obsolete-branch` hier gemerged wurde. Wenn
Sie noch einmal an seine Commits wollen, können Sie hierher zurück gehen.

</div>
<div class="span6">

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

## Feedback in den Repositories

Sie bekommen von mir auf Ihre Fragen oder wenn mir etwas auffällt Feedback im
`feedback`-Branch. In diesem Branch können Sie in den Remote-Repositories nichts
ändern. Wenn Sie lokal dort etwas committen, können Sie es nicht mehr pushen!
Also **nur lesen**! Sie können natürlich etwaige Änderungen, die ich gemacht
habe mit `git merge` in Ihre Branches mergen.

Mit `git pull` haben Sie den Feedback-Branch automatisch in Ihrem Repository, aber
zunächst nur als Remote-Branche (siehe `git branch -a`).

Starten Sie die Arbeit an Ihrem Projekt **immer** mit den folgenden beiden Kommandos:

    git pull
    git show-branch origin/feedback

Das zweite Kommando zeigt Ihnen die Commit-Message des neuesten Commits im
Feedback-Branch. Sollten Sie den dazu gehörigen Commit noch nicht kennen, wechseln
Sie in den Feedback-Branch mit

    git checkout feedback

lesen Sie sich mein Feedback durch und wechseln Sie zum Arbeiten wieder in den
Master-Branch. Beim ersten Mal wird der lokale Branch `feedback` automatisch
erzeugt und mit `origin/feedback` verknüpft.


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

</div>
</div>
