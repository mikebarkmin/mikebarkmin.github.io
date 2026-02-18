#set document(title: "Berufe in der Spieleentwicklung")
#set page(
  paper: "a4",
  margin: (x: 1cm, y: 3cm),
  header: [
    #set text(size: 10pt)
    #grid(
      columns: (1fr, 1fr),
      align: (left, right),
      [Informatik], [Name: #box(width: 5cm, line(length: 100%, stroke: 0.5pt))],
    )
  ],
  footer: [
    #set text(size: 9pt)
    #grid(
      columns: (1fr, 1fr),
      align: (left, right),
      [Version 1.0], [Mike Barkmin CC-BY-SA],
    )
  ],
)
#set text(
  font: "Fira Sans",
)

#let primary-color = rgb("#4A90E2")
#let accent-color = rgb("#ba7720")

#show heading: set text(fill: primary-color)

= Berufe in der Spieleentwicklung

Wer steckt eigentlich hinter deinen Lieblingsspielen? Ein Spiel entsteht nie alleine – ein ganzes Team aus verschiedenen Fachleuten arbeitet zusammen. Hier lernst du zwei wichtige Berufe kennen.

#v(0.5cm)

// Card 1: Programmierer/in
#block(
  stroke: 2pt + primary-color.lighten(30%),
  radius: 0.5cm,
  inset: 0.7cm,
  width: 100%,
)[
  == Programmierer / Programmiererin

  #text(weight: "bold")[Was macht man in diesem Beruf?]

  Programmiererinnen und Programmierer schreiben den Code, der ein Spiel zum Leben erweckt. Sie sorgen dafür, dass sich der Charakter bewegt, wenn du eine Taste drückst, dass Punkte gezählt werden und dass das Spiel nicht abstürzt. Ohne Code passiert im Spiel – gar nichts.

  #v(0.3cm)
  #text(weight: "bold")[Ein typischer Arbeitstag]

  Morgens checkt Sarah ihren Auftrag: Die Sprunganimation des Helden funktioniert nicht richtig – er fliegt manchmal durch Wände. Sie öffnet den Code, sucht den Fehler, testet, testet, testet, und schließlich springt der Held wie gewünscht. Nachmittags baut sie ein neues Feature ein: Münzen sollen beim Einsammeln leuchten. Dafür schreibt sie rund 50 Zeilen Code.

  #v(0.3cm)
  #grid(
    columns: (1fr, 1fr),
    gutter: 0.5cm,
    block(
      fill: primary-color.lighten(70%),
      radius: 0.3cm,
      inset: 0.4cm,
    )[
      #text(weight: "bold")[Das macht Spaß:]
      - Probleme lösen
      - Kreativ mit Code sein
      - Sehen, wie etwas funktioniert
    ],
    block(
      fill: rgb("#fde8e8"),
      radius: 0.3cm,
      inset: 0.4cm,
    )[
      #text(weight: "bold")[Das ist manchmal schwierig:]
      - Fehler finden, die sich gut verstecken
      - Viel Geduld brauchen
      - Stundenlang konzentriert bleiben
    ],
  )

  #v(0.3cm)
  #block(
    fill: primary-color.lighten(80%),
    radius: 0.3cm,
    inset: 0.4cm,
  )[
    #text(weight: "bold")[Wusstest du?] Bekannte Spiele wie Minecraft oder Fortnite bestehen aus Millionen von Codezeilen. Das Programmierteam kann aus über 100 Personen bestehen.
  ]
]

#v(0.5cm)

// Aufgabe Seite 1
#block(
  fill: primary-color.lighten(85%),
  stroke: 1.5pt + primary-color.lighten(40%),
  radius: 0.4cm,
  inset: 0.5cm,
  width: 100%,
)[
  #text(weight: "bold", fill: primary-color)[✏️ Deine Aufgabe]
  #v(0.2cm)
  #grid(
    columns: (1fr, 1fr),
    gutter: 0.5cm,
    [
      *1. Markiere im Text:* Unterstreiche grün, was dich an diesem Beruf anspricht. Unterstreiche rot, was dich nicht anspricht.
    ],
    [
      *2. Ein Satz:* Dieser Beruf passt / passt nicht zu mir,
      #v(0.4cm)
      weil #box(width: 1fr, line(length: 100%, stroke: 0.5pt))
      #v(0.5cm)
      #line(length: 100%, stroke: 0.5pt)
    ],
  )
]

#pagebreak()

// Card 2: Game Designer/in
#block(
  stroke: 2pt + accent-color.lighten(30%),
  radius: 0.5cm,
  inset: 0.7cm,
  width: 100%,
)[
  #show heading: set text(fill: accent-color)
  == Game Designer / Game Designerin

  #text(weight: "bold")[Was macht man in diesem Beruf?]

  Game Designerinnen und Game Designer erfinden das Spiel. Sie entscheiden: Wie sehen die Level aus? Wie schwer ist das Spiel? Welche Regeln gelten? Was macht Spaß – und was frustriert die Spieler? Sie denken sich das Erlebnis aus, bevor überhaupt eine Zeile Code geschrieben wird.

  #v(0.3cm)
  #text(weight: "bold")[Ein typischer Arbeitstag]

  Jonas sitzt heute nicht am Computer, sondern am Tisch mit Stift und Papier. Er zeichnet ein neues Level: Wo sind die Gegner? Wo lauert eine Falle? Wo gibt es ein Geheimnis? Dann erklärt er seine Idee dem Team. Die Programmiererin fragt: „Wie soll der Spieler merken, dass er die falsche Richtung geht?" Jonas denkt nach – eine gute Frage. Er überarbeitet seinen Plan.

  #v(0.3cm)
  #grid(
    columns: (1fr, 1fr),
    gutter: 0.5cm,
    block(
      fill: accent-color.lighten(70%),
      radius: 0.3cm,
      inset: 0.4cm,
    )[
      #text(weight: "bold")[Das macht Spaß:]
      - Eigene Ideen umsetzen
      - Spiele spielen als Arbeit
      - Mit vielen Menschen zusammenarbeiten
    ],
    block(
      fill: rgb("#fde8e8"),
      radius: 0.3cm,
      inset: 0.4cm,
    )[
      #text(weight: "bold")[Das ist manchmal schwierig:]
      - Ideen erklären, die noch keiner sieht
      - Kritik annehmen, wenn etwas nicht klappt
      - Kompromisse mit dem Team finden
    ],
  )

  #v(0.3cm)
  #block(
    fill: accent-color.lighten(80%),
    radius: 0.3cm,
    inset: 0.4cm,
  )[
    #text(weight: "bold")[Wusstest du?] Shigeru Miyamoto erfand Mario, Zelda und Donkey Kong. Er sagte einmal, dass ein schlechtes Spiel für immer schlecht bleibt – aber ein verspätetes Spiel irgendwann gut werden kann.
  ]
]

#v(0.5cm)

// Aufgabe Seite 2
#block(
  fill: accent-color.lighten(85%),
  stroke: 1.5pt + accent-color.lighten(40%),
  radius: 0.4cm,
  inset: 0.5cm,
  width: 100%,
)[
  #show heading: set text(fill: accent-color)
  #text(weight: "bold", fill: accent-color)[✏️ Deine Aufgabe]
  #v(0.2cm)
  #grid(
    columns: (1fr, 1fr),
    gutter: 0.5cm,
    [
      *1. Markiere im Text:* Unterstreiche grün, was dich an diesem Beruf anspricht. Unterstreiche rot, was dich nicht anspricht.
    ],
    [
      *2. Ein Satz:* Dieser Beruf passt / passt nicht zu mir, 
      #v(0.4cm)
      weil #box(width: 1fr, line(length: 100%, stroke: 0.5pt))
      #v(0.5cm)
      #line(length: 100%, stroke: 0.5pt)
    ],
  )
]

#v(0.5cm)

#block(
  fill: rgb("#f0f0f0"),
  stroke: 1pt + gray,
  radius: 0.3cm,
  inset: 0.5cm,
  width: 100%,
)[
  #grid(
    columns: (auto, 1fr),
    gutter: 0.4cm,
    align: top,
    text(size: 1.5em)[🤝],
    [
      #text(size: 10pt)[
        #text(weight: "bold")[Übrigens:] Beide Berufe brauchen einander. Ein Game Designer ohne Programmierer hat nur Ideen auf Papier. Ein Programmierer ohne Game Designer schreibt Code für ein Spiel, das niemand spielen möchte. Gute Spieleentwicklung ist immer Teamarbeit.

        #v(0.2cm)
        #text(weight: "bold")[Bonusfrage:] In welchem Beruf würdest du lieber arbeiten? Schreib es auf die Rückseite – und überzeuge jemanden neben dir.
      ]
    ],
  )
]
