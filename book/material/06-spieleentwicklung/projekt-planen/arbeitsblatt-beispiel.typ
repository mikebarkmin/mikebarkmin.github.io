#set document(title: "Beispiellösung: Spielidee weiterentwickeln")
#set page(
  paper: "a4",
  margin: (x: 1cm, y: 3cm),
  header: [
    #set text(size: 10pt)
    #grid(
      columns: (1fr, 1fr),
      align: (left, right),
      [Informatik – Beispiellösung], [Name: _Mia Mustermann_],
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
#set text(font: "Fira Sans")

#let primary-color = rgb("#4A90E2")
#let accent-color = rgb("#ba7720")
#let example-color = rgb("#2e7d32")

// Hilfsfunktion für ausgefüllte Zeilen
#let filled-line(content) = {
  block(width: 100%, inset: (y: 0cm))[
    #text(fill: example-color, size: 0.7em, style: "italic")[#content]
    #line(length: 100%, stroke: 0.5pt + gray)
  ]
}

#let lined-box-filled(..lines) = {
let items = lines.pos()
for item in items {
  filled-line(item)
}
let remaining = 0
}

#show heading: set text(fill: primary-color)

= Eine Spielidee weiterentwickeln
== Mein Basisspiel
Welches Spiel aus dem Game-Center hast du ausgewählt?

#filled-line("Den Donut-Klicker")
#v(0.2cm)

Was gefällt dir besonders gut an diesem Spiel?

#filled-line("Ich mag, dass man sich immer neue Helfer kaufen kann.")
#filled-line("Es macht Spaß zu sehen, wie die Klicks immer schneller werden.")
#v(0.5cm)

#columns(2, gutter: 0.5cm)[
#block(
  stroke: 2pt + primary-color.lighten(30%),
  radius: 0.5cm,
  inset: 0.5cm,
)[
  == Neue Spielwelt & Farben
    Wo soll dein Spiel stattfinden? Welche Farben und Stimmung möchtest du?
    #filled-line("In einer Bäckerei – warm und gemütlich.")
    #filled-line("Viel Orange, Braun und Gelb.")
    #filled-line("Im Hintergrund Regale mit Kuchen und Brot.")
    #filled-line("Dampf steigt aus dem Ofen auf.")
    #filled-line("Fröhliche, ruhige Stimmung.")
  ]

  #block(
    stroke: 2pt + primary-color.lighten(30%),
    radius: 0.5cm,
    inset: 0.5cm,
    width: 100%,
  )[
    == Neue Charaktere
    Welche Figuren sollen in deinem Spiel vorkommen?
    #filled-line("Ein Bäcker mit Mütze als Hauptfigur.")
    #filled-line("Kleine Mäuse als automatische Klicker.")
    #filled-line("Eine Katze, die die Mäuse antreibt.")
    #filled-line("Ein Kunde, der ungeduldig wartet.")
    #filled-line("Ein fliegender Donut als Boss-Gegner.")
  ]

  #colbreak()

  #block(
    stroke: 2pt + primary-color.lighten(30%),
    inset: 0.5cm,
    radius: 0.5cm,
    width: 100%,
  )[
    == Neue Level & Features
    Was soll anders sein? Neue Hindernisse? Neue Fähigkeiten? Schwieriger oder einfacher?
    #filled-line("Statt Donuts backt man Croissants und Torten.")
    #filled-line("Manchmal kommt ein Gesundheitsinspektor – Klicken stoppen!")
    #filled-line("Power-Up: Doppelte Punkte für 10 Sekunden.")
    #filled-line("Je mehr Helfer, desto lauter wird die Musik.")
    #filled-line("Ab 1000 Punkten öffnet man eine neue Backstube.")
  ]

  #block(
    stroke: 2pt + primary-color.lighten(30%),
    radius: 0.5cm,
    inset: 0.5cm,
    width: 100%,
  )[
    == Mein Spielziel
    Was müssen Spieler*innen tun, um dein Spiel zu gewinnen?
    #filled-line("10 000 Croissants backen.")
    #filled-line("Alle 5 Backstuben freischalten.")
    #filled-line("Den fliegenden Donut als Boss besiegen.")
    #filled-line("Den Gesundheitsinspektor dreimal überlisten.")
    #filled-line("Die beste Bäckerei der Stadt werden.")
  ]
]

#pagebreak()

#show heading: set text(fill: accent-color)

= Mein Spielkonzept visualisieren
Gestalte hier dein Moodboard: Sammle Bilder, Farben, Skizzen und Ideen, die zeigen, wie dein Spiel aussehen soll. Du kannst zeichnen oder Bilder aufkleben.

#block(height: 1fr)[
  #grid(
    columns: (1fr, 1fr, 1fr, 1fr),
    rows: (1fr, 3fr, 3fr),
    gutter: 0.5cm,
    // Moodboard Label
    block(
      stroke: 2pt + accent-color,
      radius: 0.5cm,
      inset: 0.5cm,
      height: 100%,
      width: 100%,
    )[
      == Moodboard
      #text(size: 10pt)[
        Farben, Stimmung, Stil
      ]
    ],
    // Farbpalette
    block(
      stroke: 2pt + accent-color,
      radius: 0.5cm,
      inset: 0.5cm,
      height: 100%,
      width: 100%,
    )[
      #text(size: 9pt, fill: accent-color, weight: "bold")[Farben:]
      #v(0.1cm)
      #grid(
        columns: (1fr, 1fr),
        rows: (0.5cm, 0.5cm),
        gutter: 0.2cm,
        block(fill: rgb("#F97316"), radius: 0.2cm, height: 0.5cm, width: 100%)[],
        block(fill: rgb("#92400E"), radius: 0.2cm, height: 0.5cm, width: 100%)[],
        block(fill: rgb("#FDE68A"), radius: 0.2cm, height: 0.5cm, width: 100%)[],
        block(fill: rgb("#D1FAE5"), radius: 0.2cm, height: 0.5cm, width: 100%)[],
      )
    ],
    // Stimmung
    block(
      stroke: 2pt + accent-color,
      radius: 0.5cm,
      inset: 0.5cm,
      height: 100%,
      width: 100%,
    )[
      #text(size: 9pt, fill: accent-color, weight: "bold")[Stimmung:]
      #v(0.1cm)
      #text(size: 9pt, style: "italic", fill: example-color)[
        warm, gemütlich, witzig, entspannt
      ]
    ],
    // Stil
    block(
      stroke: 2pt + accent-color,
      radius: 0.5cm,
      inset: 0.5cm,
      height: 100%,
      width: 100%,
    )[
      #text(size: 9pt, fill: accent-color, weight: "bold")[Stil:]
      #v(0.1cm)
      #text(size: 9pt, style: "italic", fill: example-color)[
        cartoon-artig, rund, bunt, niedlich
      ]
    ],
    // Spielwelt Zeichnung
    grid.cell(colspan: 2)[
      #block(
        stroke: 2pt + accent-color,
        radius: 0.5cm,
        inset: 0.5cm,
        height: 100%,
        width: 100%,
      )[
        #text(size: 9pt, fill: accent-color, weight: "bold")[Spielwelt: Die Bäckerei 🥐]
        #v(0.1cm)
        // Einfache ASCII-artige Skizze der Bäckerei
        #align(center)[
          #block(width: 90%, height: 80%)[
            #set text(size: 8pt, fill: rgb("#555"))
            #grid(
              columns: (1fr, 1fr, 1fr),
              gutter: 0.3cm,
              // Ofen
              block(
                fill: rgb("#92400E"),
                radius: 0.3cm,
                inset: 0.3cm,
                height: 3cm,
              )[
                #align(center)[
                  #text(size: 1.5em)[🔥]
                  #v(0.1cm)
                  #text(fill: white, weight: "bold", size: 8pt)[Ofen]
                ]
              ],
              // Croissant in der Mitte
              block(
                fill: rgb("#FDE68A"),
                radius: 0.3cm,
                inset: 0.3cm,
                height: 3cm,
              )[
                #align(center)[
                  #text(size: 2em)[🥐]
                  #v(0.1cm)
                  #text(fill: rgb("#92400E"), weight: "bold", size: 8pt)[KLICK!]
                ]
              ],
              // Regal
              block(
                fill: rgb("#F97316").lighten(60%),
                radius: 0.3cm,
                inset: 0.3cm,
                height: 3cm,
              )[
                #align(center)[
                  #text(size: 1.2em)[🍰🧁🍩]
                  #v(0.1cm)
                  #text(fill: rgb("#92400E"), size: 8pt)[Regal]
                ]
              ],
            )
            #v(0.2cm)
            #align(center)[
              #text(size: 0.9em)[🐭 🐭 🐭 #h(0.5cm) ← automatische Klicker (Mäuse)]
            ]
          ]
        ]
      ]
    ],
    // Großes Feld rechts
    grid.cell(colspan: 2, rowspan: 2)[
      #block(
        stroke: 2pt + accent-color,
        radius: 0.5cm,
        inset: 0.5cm,
        height: 100%,
        width: 100%,
      )[
        #text(size: 9pt, fill: accent-color, weight: "bold")[Notizen & Ideen 💡]
        #v(0.2cm)
        #text(size: 8.5pt, fill: example-color, style: "italic")[
          - Helfer kaufen: Maus (10 Pts), Katze (100 Pts), Bäcker-Roboter (1000 Pts) \
          - Sound: Kasse klingelt bei jedem Kauf \
          - Gesundheitsinspektor erscheint alle 2 Minuten zufällig \
          - Boss "Der fliegende Donut" taucht bei 5000 Pts auf \
          - Highscore-Liste für die ganze Klasse?
        ]
      ]
    ],
    // Hauptfigur
    grid.cell(colspan: 2)[
      #block(
        stroke: 2pt + accent-color,
        radius: 0.5cm,
        inset: 0.5cm,
        height: 100%,
        width: 100%,
      )[
        #text(size: 9pt, fill: accent-color, weight: "bold")[Hauptfigur & Helfer 🐭]
        #v(0.1cm)
        #grid(
          columns: (1fr, 1fr, 1fr, 1fr),
          gutter: 0.3cm,
          block(fill: rgb("#FDE68A"), radius: 0.3cm, inset: 0.3cm)[
            #align(center)[
              #text(size: 1.5em)[👨‍🍳]
              #v(0.05cm)
              #text(size: 7pt)[Bäcker\ (du)]
            ]
          ],
          block(fill: rgb("#FDE68A"), radius: 0.3cm, inset: 0.3cm)[
            #align(center)[
              #text(size: 1.5em)[🐭]
              #v(0.05cm)
              #text(size: 7pt)[Maus\ 10 Pts]
            ]
          ],
          block(fill: rgb("#FDE68A"), radius: 0.3cm, inset: 0.3cm)[
            #align(center)[
              #text(size: 1.5em)[🐱]
              #v(0.05cm)
              #text(size: 7pt)[Katze\ 100 Pts]
            ]
          ],
          block(fill: rgb("#FDE68A"), radius: 0.3cm, inset: 0.3cm)[
            #align(center)[
              #text(size: 1.5em)[🤖]
              #v(0.05cm)
              #text(size: 7pt)[Roboter\ 1000 Pts]
            ]
          ],
        )
      ]
    ],
  )
]

