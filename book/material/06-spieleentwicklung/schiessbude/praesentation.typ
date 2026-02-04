#import "@preview/polylux:0.4.0": *
#import "@preview/cades:0.3.1": qr-code
#import "@preview/metropolis-polylux:0.1.0" as metropolis
#import metropolis: new-section, focus

#show: metropolis.setup

#slide[
  #set page(header: none, footer: none, margin: 3em)

 
  #text(size: 1.3em)[
    *Schießbude*
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

#new-section[Spieletest: Schießbude]

#slide[
  = Schießbude

  #align(center)[
    #image("schiessbude.png", width: 15em)
  ]
]

#slide[
  = Ausprobieren 

  #columns(2)[
    #align(center)[
      #image("schiessbude.png")
    ]

    #colbreak()

    #text(size: 1.2em)[
      Ich brauche dein Feedback! Wie gefällt dir das Spiel?
    ]

    1. Gehe auf *informatik.openpatch.org* auf die Seite *6 (2025/2026)*.
    2. Gib bei Ausprobieren das Passwort *sbe* ein.
    3. Spiele das Spiel und probiere alle Funktionen aus.
    4. Überlege, was man verbessern könnte.
  ]
]

#slide[
  = Schießbude verbessern

  #columns(2)[
    #align(center)[
      #image("schiessbude.png")
    ]

    #colbreak()

    #text(size: 1.2em)[
      Jetzt bist du dran!
    ]

    1. Gehe auf *informatik.openpatch.org* auf die Seite *6 (2025/2026)*.
    2. Gib bei "Das Spiel verbessern" das Passwort *sbd* ein.
    3. Versuche das Spiel zu verbessern!
  ]
]

#new-section[Projekte speichern]

#slide[
  = Projekte speichern

  1. Datei-Icon -> Auf deinem Computer speichern
  2. Auf der linken Seite dein Verzeichnis anklicken
  3. Oben links auf Speichern klicken
]
