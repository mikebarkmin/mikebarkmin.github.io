#import "@preview/polylux:0.4.0": *
#import "@preview/metropolis-polylux:0.1.0" as metropolis
#import metropolis: focus, new-section

#show: metropolis.setup

// ===== TITELFOLIE =====
#slide[
  #set page(header: none, footer: none, margin: 3em)

  Spiele weiterentwickeln: Ideenphase

  #metropolis.divider

  #set text(size: .8em, weight: "light")
  Version 2.0
]

// ===== 1 =====
#slide[
  #set align(horizon)
  #grid(
    columns: (1fr, auto, 1fr, auto, 1fr),
    gutter: 0pt,
    // Schritt 1
    block(
      fill: rgb("#23373b"),
      radius: 8pt,
      inset: 20pt,
      width: 100%,
      [
        #text(size: 2em)[🔍]\
        #v(6pt)
        #text(weight: "bold", size: 1.1em, fill: white)[Spiele erkunden]
        #v(4pt)
        #text(size: 0.85em, fill: rgb("#cccccc"))[Verschiedene Spiele spielen & beobachten]
      ],
    ),
    // Pfeil
    pad(x: 8pt)[
      #set align(horizon)
      #text(size: 2em, fill: rgb("#eb811b"))[→]
    ],
    // Schritt 2
    block(
      fill: rgb("#23373b"),
      radius: 8pt,
      inset: 20pt,
      width: 100%,
      [
        #text(size: 2em)[🎯]\
        #v(6pt)
        #text(weight: "bold", size: 1.1em, fill: white)[Spiel auswählen]
        #v(4pt)
        #text(size: 0.85em, fill: rgb("#cccccc"))[Ein Lieblingsspiel\nals Basis nehmen]
      ],
    ),
    // Pfeil
    pad(x: 8pt)[
      #set align(horizon)
      #text(size: 2em, fill: rgb("#eb811b"))[→]
    ],
    // Schritt 3
    block(
      fill: rgb("#eb811b"),
      radius: 8pt,
      inset: 20pt,
      width: 100%,
      [
        #text(size: 2em)[💡]\
        #v(6pt)
        #text(weight: "bold", size: 1.1em, fill: white)[Eigene Ideen entwickeln]
        #v(4pt)
        #text(size: 0.85em, fill: white)[Kreativ werden &\netwas Neues erschaffen]
      ],
    ),
  )
]


// ===== 2 =====
#slide[
  = Game-Center erkunden

  Spiele mindestens _3 verschiedene Spiele_ und notiere:

  - Titel des Spiels
  - Was hat dir gefallen?
  - Was hat dich gestört?
  - Eine Idee zur Verbesserung

  #uncover(2)[
    https://informatik.openpatch.org/6 -> Game Center
  ]
]

// ===== 3 =====
#slide[
  = Spiel auswählen
  Wähle _ein Spiel_, das du weiterentwickeln möchtest.

  Begründe kurz:
  - Warum dieses Spiel?
  - Welches Potenzial siehst du?
  - Was willst du verändern?
]

#slide[
  = Arbeitsblatt: Projekt Planen

  - Schreibt eure Ideen auf das Arbeitsblatt.
  - Ich sammle die Arbeitsblätter am Ende der Stunde ein, damit ihr sie später als Hilfe für euer Spiel benutzen könnt.
  - So kann ich euch besser unterstützen, wenn ihr mit dem Programmieren beginnt.
]

// ===== SCHLUSS =====
#slide[
  #show: focus
  #text(size: 48pt, weight: "bold")[Los geht’s!]

  #text(size: 26pt)[Viel Spaß beim Spielen und Entwickeln 🎮]
]
