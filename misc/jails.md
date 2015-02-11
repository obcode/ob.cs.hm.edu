---
title: FreeBSD Jails auf Terraform
image: /img/freebsd.png
---

<div class="row">
<div class="span6">

Für Abschlussarbeiten oder zum Teil auch in Lehrveranstaltungen richte ich
den Studierenden ein [Jail](https://www.freebsd.org/doc/de/books/handbook/jails.html)
auf dem [FreeBSD](http://freebsd.org/)-Server
[Terraform](https://terraform.cs.hm.edu/) ein.

## FreeBSD

[FreeBSD](http://freebsd.org/) ist ein UNIXoides Betriebssystem. Wenn Sie mit Linux oder
MacOSX jenseits von Klickibunti vertraut sind, sollte der Einstieg nicht allzu schwer fallen.

Bei konkreten Problemen wenden Sie sich bitte direkt an mich.

## Ressourcen

-   [FreeBSD Handbuch](https://www.freebsd.org/doc/de/books/handbook/)
-   [FreeBSD Handbook](https://www.freebsd.org/doc/en_US.ISO8859-1/books/handbook/)

## Pkg

Mit dem Kommandozeilen-Tool pkg können Sie benötigte Software in Ihrem Jail installieren.

**Achtung:** Stellen Sie sicher, dass Sie immer von allem die aktuellste Version nutzen
in dem Sie regelmäßig das Kommando

    pkg upgrade

nutzen. Unter Umständen sind nach so einem Upgrade Anpassungen notwendig.

</div>
<div class="span6">

## Jails auf terraform.cs.hm.edu

Damit Sie sich in Ihr Jail einloggen können, benötige ich einen OpenSSH-Public-Key von
Ihnen. Der Zugang erfolgt dann ausschließlich über SSH. Die Portnummer für Ihr Jail
erfahren Sie von mir.

Sollten Sie bereits ein [Git-Repository auf ob.cs.hm.edu](/misc/git.html) nutzen,
werde ich den Key den Sie dafür nutzen auch für den Zugang zu Ihrem Jail nutzen.

Wie Sie den Schlüssel am Besten generieren, finden Sie auf der Seite
[SSH-Keys](/misc/ssh.html).

## User und Root

Ich richte Ihnen im Jail einen User-Account ein. Mit diesem können Sie sich direkt per
SSH einloggen. Führen Sie Ihre Arbeiten möglichst unter diesem Account aus. Sollten
Sie Administratorrechte benötigen, z.B. um zusätzliche Software zu installieren,
können Sie sich mit dem Kommando

    su -

als `root` einloggen.

## Ports

Standardmäßig sind alle Ports ihres Jails, außer dem Port 22 für den SSH-Daemon, durch
einen Packetfilter gesperrt. Auch an den Port 22 kommen Sie nicht direkt heran,
sondern nur über einen sog. Redirect auf dem Terraform-Host. Falls Sie einen
zusätzlichen Port benötigen (z.B. für die von Ihnen zu deployende Web-App), nehmen Sie
Verbindung mit [mir](/about.html) auf.

</div>
</div>
