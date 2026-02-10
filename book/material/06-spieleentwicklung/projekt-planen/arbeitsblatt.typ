#set document(title: "Deine Spielidee weiterentwickeln")
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

// Farbpalette für freundlicheres Design
#let primary-color = rgb("#4A90E2")  // Freundliches Blau
#let accent-color = rgb("#ba7720")   // Frisches Grün

#let lined-box(num: 2, spacing: 0.8cm, stroke: 0pt) = {
  let total-height = num * spacing
  block(
    width: 100%,
    height: total-height,
    inset: 0cm,
    stroke: stroke,
  )[
    #v(spacing, weak: false)
    #for i in range(num) [
      #v(spacing, weak: true)
      #line(length: 100%, stroke: 0.5pt + gray)
    ]
  ]
}

#show heading: set text(fill: primary-color)

= Eine Spielidee weiterentwickeln
== Mein Basisspiel
Welches Spiel aus dem Game-Center hast du ausgewählt?

#lined-box(num: 1, spacing: 1cm)

Was gefällt dir besonders gut an diesem Spiel?

#lined-box(num: 2, spacing: 1cm)

#v(0.5cm)

#columns(2, gutter: 0.5cm)[
  #block(
    stroke: 2pt + primary-color.lighten(30%),
    radius: 0.5cm,
    inset: 0.5cm,
  )[
    == Neue Spielwelt & Farben
    Wo soll dein Spiel stattfinden? Welche Farben und Stimmung möchtest du?
    #lined-box(num: 5, spacing: 1cm)
  ]

  #block(
    stroke: 2pt + primary-color.lighten(30%),
    radius: 0.5cm,
    inset: 0.5cm,
    width: 100%,
  )[
    == Neue Charaktere
    Welche Figuren sollen in deinem Spiel vorkommen?
    #lined-box(num: 5, spacing: 1cm)
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
    #lined-box(num: 5, spacing: 1cm)
  ]

  #block(
    stroke: 2pt + primary-color.lighten(30%),
    radius: 0.5cm,
    inset: 0.5cm,
    width: 100%,
  )[
    == Mein Spielziel
    Was müssen Spieler*innen tun, um dein Spiel zu gewinnen?
    #lined-box(num: 5, spacing: 1cm)
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
    block(
      stroke: 2pt + accent-color,
      radius: 0.5cm,
      inset: 0.5cm,
      height: 100%,
      width: 100%,
    )[
    ],
    block(
      stroke: 2pt + accent-color,
      radius: 0.5cm,
      inset: 0.5cm,
      height: 100%,
      width: 100%,
    )[
    ],
    block(
      stroke: 2pt + accent-color,
      radius: 0.5cm,
      inset: 0.5cm,
      height: 100%,
      width: 100%,
    )[
    ],
    grid.cell(colspan: 2)[
      #block(
        stroke: 2pt + accent-color,
        radius: 0.5cm,
        inset: 0.5cm,
        height: 100%,
        width: 100%,
      )[
        Male ein Bild deiner Spielwelt.
      ]
    ],
    grid.cell(colspan: 2, rowspan: 2)[
      #block(
        stroke: 2pt + accent-color,
        radius: 0.5cm,
        inset: 0.5cm,
        height: 100%,
        width: 100%,
      )[
        Hier hast du Platz für weitere Skizzen, Bilder oder Notizen zu deinem Spielkonzept.
      ]
    ],
    grid.cell(colspan: 2)[
      #block(
        stroke: 2pt + accent-color,
        radius: 0.5cm,
        inset: 0.5cm,
        height: 100%,
        width: 100%,
      )[
        Male deine Hauptfigur oder deine Lieblingsszene aus deinem Spiel.
      ]
    ],
  )
]
