// ── Colors ──────────────────────────────────────────────────────
#let scratch-orange = rgb("#FF6B35")
#let scratch-blue = rgb("#4C97FF")
#let scratch-green = rgb("#59C059")
#let scratch-yellow = rgb("#FFAB19")
#let scratch-purple = rgb("#9966FF")
#let bg-dark = rgb("#1A1A2E")
#let bg-card = rgb("#16213E")
#let text-light = rgb("#E8F4FD")
#let text-muted = rgb("#A8C8E8")

// ── Page Setup ──────────────────────────────────────────────────
#set page(
  paper: "presentation-16-9",
  margin: (top: 0pt, bottom: 0pt, left: 0pt, right: 0pt),
  fill: bg-dark,
)

#set text(font: "Fira Sans", size: 20pt, fill: text-light)
#set par(justify: false)

// ── Helpers ─────────────────────────────────────────────────────
#let badge(content, color: scratch-blue) = box(
  fill: color.lighten(80%),
  stroke: 1.5pt + color,
  radius: 6pt,
  inset: (x: 10pt, y: 5pt),
  text(fill: color.darken(30%), weight: "bold", size: 17pt, content),
)

#let icon-card(icon, title, body, color: scratch-blue) = block(
  width: 100%,
  fill: color.lighten(88%),
  stroke: 2pt + color,
  radius: 10pt,
  inset: 13pt,
)[
  #text(size: 24pt)[#icon] #h(4pt)
  #text(weight: "bold", fill: color.darken(20%), size: 18pt)[#title]
  #parbreak()
  #text(fill: rgb("#222244"), size: 16pt)[#body]
]

#let step-box(n, color, body) = block(width: 100%, inset: 0pt)[
  #grid(
    columns: (38pt, 1fr),
    gutter: 10pt,
    align(center + horizon)[
      #circle(fill: color, radius: 14pt)[
        #align(center + horizon)[
          #text(weight: "bold", fill: white, size: 16pt)[#n]
        ]
      ]
    ],
    align(left + horizon)[
      #text(size: 18pt)[#body]
    ],
  )
]

#let accent-bar(color) = place(
  top + left,
  block(width: 8pt, height: 100%, fill: color),
)

// ════════════════════════════════════════════════════════════════
// FOLIE 1 – Titelfolie
// ════════════════════════════════════════════════════════════════
#block(width: 100%, height: 100%, clip: true)[
  #place(top + right, dx: 60pt, dy: -70pt, circle(radius: 130pt, fill: scratch-orange.lighten(70%).transparentize(55%)))
  #place(bottom + left, dx: -50pt, dy: 60pt, circle(radius: 100pt, fill: scratch-blue.lighten(70%).transparentize(55%)))
  #place(bottom + right, dx: 30pt, dy: 30pt, circle(radius: 70pt, fill: scratch-green.lighten(70%).transparentize(55%)))
  #align(center + horizon)[
    #text(size: 88pt)[#emoji.trophy]
    #v(6pt)
    #text(weight: "bold", size: 36pt, fill: scratch-yellow)[Die große Scratch-Spiele-Wahl!]
    #v(10pt)
    #text(size: 22pt, fill: text-muted)[Wer hat das kreativste, schönste und spannendste Spiel gebaut?]
    #v(22pt)
    #grid(
      columns: 5,
      gutter: 10pt,
      badge("Spielen", color: scratch-blue),
      badge("Wählen", color: scratch-orange),
      badge("Gewinnen", color: scratch-green),
      badge("Design", color: scratch-purple),
      badge("Ideen", color: scratch-yellow),
    )
  ]
]

// ════════════════════════════════════════════════════════════════
// FOLIE 2 – Das Ziel
// ════════════════════════════════════════════════════════════════
#pagebreak()
#block(width: 100%, height: 100%, clip: true)[
  #accent-bar(scratch-blue)
  #pad(left: 36pt, top: 26pt, right: 36pt, bottom: 16pt)[
    #text(weight: "bold", size: 32pt, fill: scratch-blue)[Was machen wir heute?]
    #v(18pt)
    #grid(
      columns: 1,
      gutter: 12pt,
      icon-card(
        "🎮",
        "Eure Spiele",
        [Ihr habt tolle Spiele basierend auf unseren Vorlagen gebaut -- Zeit, sie zu zeigen!],
        color: scratch-blue,
      ),
      icon-card(
        "🗳",
        "Wir wählen!",
        [Heute wählen wir die Besten in *vier* verschiedenen Kategorien.],
        color: scratch-orange,
      ),
      icon-card("⚖", "Fair wählen", [Bewerte die Spiele fair und wähle dein Lieblingsprojekt.], color: scratch-green),
    )
  ]
]

// ════════════════════════════════════════════════════════════════
// FOLIE 3 – Die Kategorien
// ════════════════════════════════════════════════════════════════
#pagebreak()
#block(width: 100%, height: 100%, clip: true)[
  #align(center)[
    #v(22pt)
    #text(weight: "bold", size: 32pt, fill: scratch-yellow)[Wofüer könnt ihr stimmen?]
    #v(18pt)
  ]
  #pad(left: 36pt, right: 36pt, bottom: 16pt)[
    #grid(
      columns: 2,
      gutter: 16pt,
      icon-card("⭐", "Kreativstes Projekt", [Die tollste Idee oder der coolste Twist!], color: scratch-yellow),
      icon-card("🎨", "Bestes Design", [Schönste Grafiken, Sounds und Farben.], color: scratch-purple),

      icon-card("🚀", "Spannendstes Spiel", [Das macht am meisten Spaß zu spielen.], color: scratch-orange),
      icon-card("💡", "Beste Erweiterung", [Hat das Basisspiel am besten verbessert?], color: scratch-green),
    )
  ]
]

// ════════════════════════════════════════════════════════════════
// FOLIE 4 – Die Kandidaten
// ════════════════════════════════════════════════════════════════
#pagebreak()
#block(width: 100%, height: 100%, clip: true)[
  #accent-bar(scratch-green)
  #pad(left: 36pt, top: 24pt, right: 44pt, bottom: 16pt)[
    #text(weight: "bold", size: 32pt, fill: scratch-green)[Wer sind die Kandidaten?]
    #v(14pt)
    #block(
      fill: bg-card,
      stroke: 1.5pt + scratch-green.lighten(40%),
      radius: 12pt,
      inset: 16pt,
      width: 100%,
    )[
      #text(size: 17pt)[
        - Jedes Projekt hat eine *Nummer* (z. B. 01, 02, 03 ...).
        - Auf deinem Computer findest du eine Liste aller Spiele mit ihren Nummern.
      ]
    ]
    #v(10pt)
    #badge("Tipp: Merke dir die Nummern der Spiele, die dir gefallen!", color: scratch-yellow)
  ]
]

// ════════════════════════════════════════════════════════════════
// FOLIE 6 – Der Stimmzettel
// ════════════════════════════════════════════════════════════════
#pagebreak()
#block(width: 100%, height: 100%, clip: true)[
  #place(bottom + right, dx: 30pt, dy: 30pt, circle(
    radius: 90pt,
    fill: scratch-purple.lighten(75%).transparentize(50%),
  ))
  #align(center)[
    #v(20pt)
    #text(weight: "bold", size: 32pt, fill: scratch-purple)[Dein Stimmzettel sieht so aus:]
    #v(14pt)
  ]
  #pad(left: 70pt, right: 70pt)[
    #block(
      fill: white,
      stroke: 3pt + scratch-purple,
      radius: 14pt,
      inset: 0pt,
      width: 100%,
      clip: true,
    )[
      #block(fill: scratch-purple, width: 100%, inset: (x: 16pt, y: 9pt))[
        #text(weight: "bold", fill: white, size: 18pt)[Mein Stimmzettel -- Scratch-Spiele-Wahl]
      ]
      #pad(x: 16pt, y: 10pt)[
        #table(
          columns: (1fr, 1fr),
          inset: 12pt,
          stroke: 1pt + rgb("#CCCCEE"),
          fill: (col, row) => {
            if row == 0 { rgb("#EEE8FF") } else if calc.odd(row) { white } else { rgb("#F8F6FF") }
          },
          [#text(weight: "bold", fill: rgb("#333355"))[Kategorie]],
          [#text(weight: "bold", fill: rgb("#333355"))[Deine Wahl (Nummer)]],

          [#text(fill: rgb("#333355"))[Kreativstes Projekt]], [#badge("Nr. 05", color: scratch-yellow)],
          [#text(fill: rgb("#333355"))[Bestes Design]], [#badge("Nr. 12", color: scratch-purple)],
          [#text(fill: rgb("#333355"))[Spannendstes Spiel]], [#badge("Nr. 05", color: scratch-orange)],
          [#text(fill: rgb("#333355"))[Beste Erweiterung]], [#badge("Nr. 08", color: scratch-green)],
        )
        #v(8pt)
        #align(center)[
          #badge("Nur EINE Nummer pro Kästchen!", color: scratch-orange)
        ]
      ]
    ]
  ]
]


// ════════════════════════════════════════════════════════════════
// FOLIE 5 – Der Ablauf
// ════════════════════════════════════════════════════════════════
#pagebreak()
#block(width: 100%, height: 100%, clip: true)[
  #align(center)[
    #v(22pt)
    #text(weight: "bold", size: 32pt, fill: scratch-orange)[So läuft die Wahl ab]
    #v(18pt)
  ]
  #pad(left: 50pt, right: 50pt, bottom: 16pt)[
    #grid(
      columns: 1,
      gutter: 14pt,
      step-box("1", scratch-blue)[
        *Spielen* -- Gehe zu deinen Computer und teste die Spiele (ca. 3 Min. pro Spiel).
      ],
      step-box("2", scratch-green)[
        *Notieren* -- Schreib dir die Nummern der Spiele auf, die dir gut gefallen.
      ],
      step-box("3", scratch-orange)[
        *Wählen* -- Nimm deinen Stimmzettel. Wähle in jeder Kategorie genau *EINE* Nummer.
        Du darfst dasselbe Projekt in mehreren Kategorien wählen!
      ],
      step-box("4", scratch-purple)[
        *Abgeben* -- Wirf deinen Zettel in die Urne. Alles *anonym*!
      ],
    )
  ]
]

// ════════════════════════════════════════════════════════════════
// FOLIE 7 – Los geht's!
// ════════════════════════════════════════════════════════════════
#pagebreak()
#block(width: 100%, height: 100%, clip: true)[
  #place(top + left, dx: -40pt, dy: -40pt, circle(radius: 140pt, fill: scratch-green.lighten(70%).transparentize(55%)))
  #place(bottom + right, dx: 50pt, dy: 50pt, circle(
    radius: 110pt,
    fill: scratch-orange.lighten(70%).transparentize(55%),
  ))
  #align(center + horizon)[
    #text(size: 80pt)[🚀]
    #v(4pt)
    #text(weight: "bold", size: 36pt, fill: scratch-green)[Zeit zum Spielen und Wählen!]
    #v(18pt)
    #grid(
      columns: 2,
      gutter: 14pt,
      icon-card("💻", "Zu den Projekte", [Geht jetzt in das Verzeichnis und legt los!], color: scratch-blue),
      icon-card("😄", "Spaß haben", [Probiert so viele Spiele wie möglich aus.], color: scratch-yellow),

      icon-card("⏱", "30 Minuten", [Nach *30 Minuten* sammeln wir die Zettel ein.], color: scratch-orange),
      icon-card("🙋", "Fragen?", [Melde dich kurz -- ich helfe dir!], color: scratch-purple),
    )
  ]
]

#pagebreak()
#block(width: 100%, height: 100%, clip: true)[
  #align(center + horizon)[
    #text(size: 80pt)[⌚]
    #v(4pt)
    #text(weight: "bold", size: 36pt, fill: scratch-green)[Pause und Auswertung!]
    #v(18pt)
    #grid(
      columns: 2,
      gutter: 14pt,
      icon-card(
        "💻",
        "Beschäftige dich am Computer",
        [Geht jetzt in das Verzeichnis und legt los!],
        color: scratch-blue,
      ),
      icon-card("⚠️", "Keine Shooter und keine Sounds", [Danke 😀], color: scratch-orange),
    )
  ]
]

#pagebreak()
#block(width: 100%, height: 100%, clip: true)[
  #align(center + horizon)[
    #text(size: 80pt)[🏆]
    #v(4pt)
    #text(weight: "bold", size: 36pt, fill: scratch-green)[Ergebnis!]
    #v(18pt)
    #pad(left: 36pt, right: 36pt, bottom: 16pt)[
      #grid(
        columns: 2,
        gutter: 16pt,
        icon-card("⭐", "Kreativstes Projekt", [Die tollste Idee oder der coolste Twist!], color: scratch-yellow),
        icon-card("🎨", "Bestes Design", [Schönste Grafiken, Sounds und Farben.], color: scratch-purple),

        icon-card("🚀", "Spannendstes Spiel", [Das macht am meisten Spaß zu spielen.], color: scratch-orange),
        icon-card("💡", "Beste Erweiterung", [Hat das Basisspiel am besten verbessert?], color: scratch-green),
      )
    ]
  ]
]
