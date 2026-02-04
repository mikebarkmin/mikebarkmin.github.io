#import "@preview/polylux:0.4.0": *
#import "@preview/cades:0.3.1": qr-code
#import "@preview/metropolis-polylux:0.1.0" as metropolis
#import metropolis: new-section, focus

#show: metropolis.setup

#slide[
  #set page(header: none, footer: none, margin: 3em)

 
  #text(size: 1.3em)[
    *Labyrinth*
  ]

  #text(size: 1em)[
    *Spieleentwicklung*
  ]

  #metropolis.divider
  
  #set text(size: .8em, weight: "light")
  Version 2.0
]

#slide[
  = Ablauf

  #metropolis.outline
]

#new-section[Spieletest: Labyrinth]

#slide[
  = Labyrinth

  #align(center)[
    #image("labyrinth.png", width: 15em)
  ]
]

#new-section[Fehler finden]

#slide[
  = Fehler finden

  #columns(2)[
    #align(center)[
      #image("labyrinth.png")
    ]

    #colbreak()

    #text(size: 1.2em)[
      Ich brauche dein Feedback! Wie gefällt dir das Spiel?
    ]

    1. Gehe auf *informatik.openpatch.org* auf die Seite *6 (2025/2026)*.
    2. Gib bei Fehler finden das Passwort *lbh* ein.
    3. Es befinden sich drei Fehler im Spiel. Kannst du sie finden?
  ]
]

#new-section[Fehler beheben]

#slide[
  = Labyrinth verbessern

  #columns(2)[
    #align(center)[
      #image("labyrinth.png")
    ]

    #colbreak()

    #text(size: 1.2em)[
      Jetzt bist du dran!
    ]

    1. Gehe auf *informatik.openpatch.org* auf die Seite *6 (2025/2026)*.
    2. Gib bei "Das Spiel verbessern" das Passwort *lbd* ein.
    3. Versuche das Spiel zu verbessern!
      a. Der Käfer soll sich auch nach links bewegen können.
      b. Der Käfer soll nicht durch die Wände hingehen können.
      c. Wenn man alle Leben verloren hat, soll etwas passieren.
  ]
]

#new-section[Spiel erweitern]

#slide[
  = Labyrinth erweitern

  #columns(2)[
    #align(center)[
      #image("labyrinth.png")
    ]

    #colbreak()

    #text(size: 1.2em)[
      Jetzt bist du dran!
    ]

    1. Gehe auf *informatik.openpatch.org* auf die Seite *6 (2025/2026)*.
    2. Gib bei "Das Spiel erweitern" das Passwort *lbe* ein.
    3. Versuche das Spiel zu erweitern!
      a. Füge mehr Level hinzu, indem du ein neues Bühnen-Hintergrundbild erstellst.
      b. Füge Hindernisse hinzu, die sich bewegen.
      c. Füge Klänge hinzu, wenn der Käfer sich bewegt oder gewinnt.
  ]
]

#new-section[Projekte speichern]

#slide[
  = Projekte speichern

  1. Datei-Icon -> Auf deinem Computer speichern
  2. Auf der linken Seite dein Verzeichnis anklicken
  3. Oben links auf Speichern klicken
]

