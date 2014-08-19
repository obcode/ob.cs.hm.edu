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
