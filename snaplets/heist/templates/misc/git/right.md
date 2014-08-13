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
nur in einer leicht differierenden Syntax. Ob ich Ihnen weitere Kommandos zur
Verfügung stelle, erfahren Sie jeweils in der Lehrveranstaltung.

## Troubleshooting

Bevor Sie sich an mich wenden, weil Sie keinen Zugriff haben, überprüfen Sie bitte
folgendes:

-   Hat mein Git-Programm Zugriff auf den zum Public SSH-Key passenden Secret SSH-Key?
-   Kann ich das `testing`-Repo clonen?
-   Welche Zugriffrechte habe ich laut Gitolite?


