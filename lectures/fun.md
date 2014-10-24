---
title: Funktionale Programmierung
modulurl: http://fi.cs.hm.edu/fi/rest/public/modul/title/funktionaleprogrammierung
image: Dreitorspitze.jpg
semester: Sommersemester 2014
---

<div class="row">
<div class="span6">

## Termine und Inhalte

### Vorlesungstermine

Dienstags, 15:15 - 16:45, R0.006

-   25.03.14 [Introduction](/lectures/fun/html/01_Introduction.html) ([Slides](/lectures/fun/presentation/01_Introduction.html), [PDF](/lectures/fun/pdf/01_Introduction.pdf), [Source](https://github.com/obcode/fun/blob/master/01_Introduction.txt))
-   01.04.14 [LYAH: Starting Out](http://learnyouahaskell.com/starting-out)
-   15.04.14 [LYAH: Tuples](http://learnyouahaskell.com/starting-out#tuples)
-   29.04.14 [LYAH: Syntax in Functions](http://learnyouahaskell.com/syntax-in-functions)
-   06.05.14 [LYAH: Recursion](http://learnyouahaskell.com/recursion)
-   13.05.14 [LYAH: Higher order functions](http://learnyouahaskell.com/higher-order-functions)
-   20.05.14 [LYAH: Higher order functions continued](http://learnyouahaskell.com/higher-order-functions#folds)
-   27.05.14 [LYAH: Making our own types and typeclasses](http://learnyouahaskell.com/making-our-own-types-and-typeclasses)
-   03.06.14 [LYAH: Input and output](http://learnyouahaskell.com/input-and-output) 
-   17.06.14 [LYAH: Functors, Applicative Functors and Monoids](http://learnyouahaskell.com/functors-applicative-functors-and-monoids), [LYAH: A Fistful of Monads](http://learnyouahaskell.com/a-fistful-of-monads) 
-   24.06.14 [LYAH: For a few monads more](http://learnyouahaskell.com/for-a-few-monads-more)
-   01.07.14 [Parallel and Concurrent Programming in Haskell](http://chimera.labs.oreilly.com/books/1230000000929/index.html)

### Praktikumstermine

Donnerstags, 15:15 - 16:45, R3.019

-   27.03.14 [Blatt 1](/lectures/fun/html/Blatt01.html) ([PDF](/lectures/fun/pdf/Blatt01.pdf))
-   03.04.14 [Blatt 2](/lectures/fun/html/Blatt02.html) ([PDF](/lectures/fun/pdf/Blatt02.pdf))
-   24.04.14 [Blatt 3](/lectures/fun/html/Blatt03.html) ([PDF](/lectures/fun/pdf/Blatt03.pdf))
-   08.05.14 [Blatt 4](/lectures/fun/html/Blatt04.html) ([PDF](/lectures/fun/pdf/Blatt04.pdf), [Lösung](https://github.com/ob-cs-hm-edu/fun-Moviestore))
-   15.05.14 [Blatt 5](/lectures/fun/html/Blatt05.html) ([PDF](/lectures/fun/pdf/Blatt05.pdf), [Lösung](https://github.com/ob-cs-hm-edu/fun-Moviestore))
-   22.05.14 Projektarbeit
-   05.06.14 Projektarbeit
-   12.06.14 Projektarbeit
-   26.06.14 Projektarbeit
-   03.07.14 Kurzpräsentationen der Projekte

## Links

-   [Redmine-Projekt](https://redmine.cs.hm.edu/projects/2014-braun-funktionale-programmierung)
-   [FP Haskell Center](https://www.fpcomplete.com/ide)
-   [Live Coding Stand](https://www.dropbox.com/sh/h35lu4f7u26sbth/rvP-_5WS6A)

#### Haskell

-   [Haskell.org](http://haskell.org/)

##### Tutorials

-   [Try Haskell](http://tryhaskell.org/)
-   [School of Haskell](https://haskell.fpcomplete.com/school)

##### Compiler etc.

-   [Haskell Platform](http://www.haskell.org/platform/)
-   [The Glasgow Haskell Compiler](http://www.haskell.org/ghc/)

##### Libs

-   [Hackage](http://hackage.haskell.org/)
-   [Hoogle](http://www.haskell.org/hoogle/)

#### Kommerzielle Nutzung funktionaler Programmierung

-   [Case Studies kommerzieller Haskell-User](http://fpcomplete.com/technology/case-studies/)
-   [CUFP - Commercial Users of functional programming](http://cufp.org/)

</div>
<div class="span6">

## Studienarbeit

Als zu benotende Studienarbeit müssen Sie in Zweiergruppen (Ausnahmefälle: alleine oder zu dritt, mit mir besprochen)

-   eine Haskell-Anwendung schreiben oder
-   ein interessantes Haskell-Package/-Framework/... vorstellen.

Beispiele für eine Haskell-Anwendung könnte eine Verwaltungssoftware (ähnlich dem Moviestore von den Aufgabenblättern), ein Spiel, eine WebApp sein.

Interessante Themen für die Vorstellung sind z.B. die Haskell-Webframeworks Yesod, Snap oder HappStack,
Pandoc als Library, oder Packages wie `lens`, `aeson`, `conduit` oder `distributed-process`.

### Geforderte Ergebnisse:

#### Haskell-Anwendung

-   Kurzpräsentation Ihres Projektes im Rahmen des Praktikums
-   Source-Code
    -   muss mit [Cabal](http://www.haskell.org/cabal/) gebaut werden können,
    -   muss mit [Haddock-Kommentaren](http://www.haskell.org/haddock/) versehen sein und
    -   muss, mindestens in Teilen, mit [QuickCheck-](http://hackage.haskell.org/package/QuickCheck) und/oder [HUnit-Tests](http://hackage.haskell.org/package/HUnit) abgedeckt sein.
-   Der Source-Code ist in einem Git-Repository zu übergeben.

Wenn Sie mit dem FP Haskell Center arbeiten, sollten Sie zur Nutzung von Git auf einen kostenlosen akademischen Account upgraden. Ein Git-Repository kann von mir zur Verfügung gestellt werden. Sprechen Sie mich einfach darauf an.

#### Vorstellung eines Package/Frameworks/...

-   Kurzpräsentation des Package/Frameworks/... im Rahmen des Praktikums
-   BlogPost/Wiki-Seite in Redmine oder anderem Blog/Wiki
-   selbst programmierter Beispielcode der die Nutzung des Package/Frameworks/... zeigt
    der Code kann an den BlogPost/Wikieintrag angehängt werden.


### Zeitplan

-   Vorschlag Gruppe und Funktionalität Ihrer Web-Application bis zum 21.05.14 in [Redmine](https://redmine.cs.hm.edu/projects/2014-braun-funktionale-programmierung?jump=welcome)
-   die folgenden Praktikumstermine dienen, zusätzlich zu Ihrer selbst
    bestimmten Arbeitszeit, der selbstständigen Implementierung
    Ihres Projektes. Ich stehe dabei selbstverständlich
    zur Unterstützung zur Verfügung.
-   03.07.14: Kurzpräsentation Ihrer Projekte
-   13.07.14, 23:59: spätester Übergabetermin Repository bzw. BlogPost

## Klausur

Gegenstand der Klausur ist der gesamte in Vorlesung und Praktikum
behandelte Stoff, soweit nicht anders vereinbart. Die Klausur
wird ohne Hilfsmittel geschrieben.

-   Klausur vom 26.07.2013: [PDF](/lectures/fun/pdf/KlausurSS2013.pdf)

## Literatur

-   Alejandro Serrano Mena, [Beginning Haskell, A Project-Based Approach](http://www.apress.com/9781430262503), Apress, 2014.
-   Simon Thompson, [Haskell: The Craft of Functional Programming](http://www.haskellcraft.com/craft3e/Home.html), Pearson Education, 2011.
    (Bibliothek: Lehrbuchsammlung, Signatur ST 240 T468(3))
-   Brian O'Sullivan et al., [Real World Haskell](http://book.realworldhaskell.org/read/), O'Reilly, 2008.
-   Miran Lipavaca, [Learn You a Haskell for Great Good!](http://learnyouahaskell.com/chapters), No Starch Press, 2011.
-   Peter Pepper & Petra Hofstedt, [Funktionale Programmierung](http://link.springer.com/book/10.1007/3-540-34796-8/page/1), Springer. 2006.
-   Simon Marlow, [Parallel and Concurrent Programming in Haskell](http://chimera.labs.oreilly.com/books/1230000000929/index.html), O'Reilly, 2013.

</div>
</div>
