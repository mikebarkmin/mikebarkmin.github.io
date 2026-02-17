// ═══════════════════════════════════════════════════════════════════════════
// Präsentation: Scratch-Projekt – Ablauf & Begleitung
// Klasse 5/6 · 3 Stunden · Typst
// ═══════════════════════════════════════════════════════════════════════════

#set document(title: "Scratch-Projekt", author: "Mike Barkmin")

#set page(
  paper: "presentation-16-9",
  margin: 0.5cm,
  numbering: none,
)

#set text(font: "Fira Sans", lang: "de", size: 20pt)

// ── Farben ──────────────────────────────────────────────────────────────────
#let scratch-orange = rgb("#FF8C00")
#let scratch-blue   = rgb("#4A90E2")
#let scratch-green  = rgb("#5CB85C")
#let scratch-yellow = rgb("#F5C518")
#let dark           = rgb("#1A1A2E")
#let mid            = rgb("#16213E")
#let card-bg        = rgb("#0F3460")
#let light-gray     = rgb("#F0F4F8")
#let white          = rgb("#FFFFFF")
#let muted          = rgb("#94A3B8")

// ── Helper: Vollflächiger Hintergrund ───────────────────────────────────────
#let bg(color, body) = {
  set page(fill: color)
  body
}

// ── Slide-Wrapper ───────────────────────────────────────────────────────────
#let slide(fill: dark, body) = {
  set page(fill: fill)
  page()[
    #body
  ]
}

// ── Zentrierung ──────────────────────────────────────────────────────────────
#let center-block(body) = align(center + horizon,
  block(width: 100%, inset: (x: 40pt), body)
)

// ── Farbiger Badge ──────────────────────────────────────────────────────────
#let badge(content, fill: scratch-orange, text-color: white) = box(
  fill: fill,
  radius: 6pt,
  inset: (x: 14pt, y: 6pt),
  text(fill: text-color, weight: "bold", size: 16pt, content),
)

// ── Karte ────────────────────────────────────────────────────────────────────
#let card(icon, title, body, accent: scratch-blue) = block(
  fill: card-bg,
  radius: 10pt,
  inset: 16pt,
  width: 100%,
)[
  #grid(
    columns: (28pt, 1fr),
    gutter: 10pt,
    align: (top, top),
    text(size: 22pt, icon),
    stack(spacing: 12pt,
      text(fill: accent, weight: "bold", size: 15pt, title),
      text(fill: white.darken(10%), size: 13pt, body),
    ),
  )
]

// ── Stunden-Header ───────────────────────────────────────────────────────────
#let stunden-badge(n, color) = box(
  fill: color,
  radius: 50pt,
  inset: (x: 20pt, y: 10pt),
  text(fill: white, weight: "bold", size: 22pt, "Stunde " + str(n))
)

// ── Timer-Block ──────────────────────────────────────────────────────────────
#let timer-card(minutes, label, color: scratch-blue) = block(
  fill: color.lighten(80%),
  stroke: 2pt + color,
  radius: 10pt,
  inset: 16pt,
  width: 100%,
)[
  #align(center)[
    #text(fill: color, weight: "bold", size: 40pt, str(minutes) + " min") \
    #text(fill: color.darken(20%), size: 14pt, label)
  ]
]

// ── Bewertungs-Zeile ─────────────────────────────────────────────────────────
#let bew-row(text-content, i) = {
  let colors = (scratch-blue, scratch-green, scratch-orange, scratch-yellow, rgb("#E91E8C"))
  let c = colors.at(calc.rem(i, 5))
  block(
    fill: card-bg,
    radius: 6pt,
    inset: (x: 12pt, y: 8pt),
    width: 100%,
  )[
    #grid(
      columns: (24pt, 1fr),
      gutter: 8pt,
      align: (center + horizon, left + horizon),
      box(fill: c, radius: 4pt, inset: (x: 6pt, y: 3pt),
        text(fill: white, weight: "bold", size: 11pt, str(i + 1))
      ),
      text(fill: white, size: 13pt, text-content),
    )
  ]
}


// ═══════════════════════════════════════════════════════════════════════════
// FOLIE 1 · Titelfolie
// ═══════════════════════════════════════════════════════════════════════════
#slide()[
  // Dekorative Kreise im Hintergrund
  #place(top + left,   dx: -60pt, dy: -60pt,
    circle(radius: 120pt, fill: scratch-orange.lighten(80%)))
  #place(bottom + right, dx: 60pt, dy: 60pt,
    circle(radius: 100pt, fill: scratch-blue.lighten(80%)))
  #place(top + right, dx: 30pt, dy: 80pt,
    circle(radius: 50pt, fill: scratch-green.lighten(70%)))

  #center-block[
    #v(1fr)
    #text(size: 52pt, weight: "bold", fill: white)[
      🐱 Scratch-Projekt
    ]
    #v(0.5em)
    #text(size: 24pt, fill: muted)[Spieleentwicklung · Klasse 5/6]
    #v(1em)
    #stack(dir: ltr, spacing: 10pt,
      badge("3 Stunden", fill: scratch-orange),
      badge("Projektarbeit", fill: scratch-blue),
      badge("Kreativ", fill: scratch-green),
    )
    #v(1fr)
    #text(size: 13pt, fill: muted)[Mike Barkmin · CC-BY-SA]
  ]
]

// ═══════════════════════════════════════════════════════════════════════════
// FOLIE 2 · Überblick: Was machen wir?
// ═══════════════════════════════════════════════════════════════════════════
#slide()[
  #place(top + left, dx: 0pt, dy: 0pt,
    rect(width: 8pt, height: 100%, fill: scratch-orange))

  #pad(left: 50pt, top: 40pt, right: 40pt)[
    #text(size: 36pt, weight: "bold", fill: white)[Was machen wir?]
    #v(1.5em)
    #grid(columns: (1fr, 1fr), gutter: 16pt,
      card("🎮", "Spiel wählen",
        "Wählt ein Basisspiel aus dem Game-Center und macht es zu eurem eigenen.",
        accent: scratch-orange),
      card("✏️", "Dokumentieren",
        "Ihr haltet eure Ideen, Ziele und Fortschritte in der Dokumentation fest.",
        accent: scratch-yellow),
      card("💻", "Programmieren",
        "Ihr passt das Spiel an und setzt eigene Ideen mit Scratch-Blöcken um.",
        accent: scratch-green),
      card("🌟", "Präsentieren",
        "Am Ende zeigt ihr euer fertiges Spiel der Klasse.",
        accent: scratch-blue),
    )
  ]
]

// ═══════════════════════════════════════════════════════════════════════════
// FOLIE 3 · Die 3 Stunden auf einen Blick
// ═══════════════════════════════════════════════════════════════════════════
#slide()[
  #pad(top: 35pt, x: 50pt)[
    #text(size: 36pt, weight: "bold", fill: white)[Der Ablauf]
    #v(1.5em)
    #grid(columns: (1fr, 1fr, 1fr), gutter: 20pt,
      // Stunde 1
      block(fill: scratch-orange.darken(30%), radius: 12pt, inset: 20pt, width: 100%)[
        #stunden-badge(1, scratch-orange)
        #v(12pt)
        #text(fill: white, weight: "bold", size: 16pt)[Einstieg & Planung]
        #v(8pt)
        #text(fill: white.darken(15%), size: 14pt)[
          Basisspiel wählen\
          Spielidee entwickeln\
          Dokumentation beginnen\
          Ziel setzen
        ]
      ],
      // Stunde 2
      block(fill: scratch-blue.darken(30%), radius: 12pt, inset: 20pt, width: 100%)[
        #stunden-badge(2, scratch-blue)
        #v(12pt)
        #text(fill: white, weight: "bold", size: 16pt)[Entwicklung]
        #v(8pt)
        #text(fill: white.darken(15%), size: 14pt)[
          Spiel anpassen\
          Eigene Ideen umsetzen\
          Testen & Verbessern\
          Reflexion ausfüllen
        ]
      ],
      // Stunde 3
      block(fill: scratch-green.darken(30%), radius: 12pt, inset: 20pt, width: 100%)[
        #stunden-badge(3, scratch-green)
        #v(12pt)
        #text(fill: white, weight: "bold", size: 16pt)[Abschluss]
        #v(8pt)
        #text(fill: white.darken(15%), size: 14pt)[
          Letzter Schliff\
          Testphase mit Feedback\
          Abschlusspräsentation\
          Bewertung
        ]
      ],
    )
  ]
]

// ═══════════════════════════════════════════════════════════════════════════
// FOLIE 4 · Die Basisspiele
// ═══════════════════════════════════════════════════════════════════════════
#slide()[
  #pad(top: 35pt, x: 50pt)[
    #text(size: 36pt, weight: "bold", fill: white)[Die Basisspiele]
    #v(0.5em)
    #text(fill: muted, size: 16pt)[Wählt ein Spiel aus dem Game-Center und macht es zu eurem!]
    #v(1.5em)
    #grid(columns: (1fr, 1fr, 1fr, 1fr), gutter: 14pt,
      ..("🏎️ Autorennen", "🍩 Donut-Klicker", "🎯 Schießbude",
         "🏃 Fangspiel", "🔍 Suchspiel", "🌀 Labyrinth",
         "⚽ Fußball", "🛋️ Room Designer").map(name =>
        block(
          fill: card-bg,
          radius: 10pt,
          inset: (x: 12pt, y: 14pt),
          width: 100%,
          align(center, text(fill: white, size: 15pt, weight: "bold", name))
        )
      )
    )
    #v(1em)
    #align(center)[
      #badge("Tipp: Drückt 'Remixen' um das Spiel in euren Account zu speichern! 💾",
        fill: scratch-orange)
    ]
  ]
]

// ═══════════════════════════════════════════════════════════════════════════
// FOLIE 5 · Die Dokumentation
// ═══════════════════════════════════════════════════════════════════════════
#slide()[
  #pad(top: 30pt, x: 50pt)[
    #text(size: 34pt, weight: "bold", fill: white)[Eure Dokumentation]
    #v(0.8em)
    #grid(
      columns: (1.3fr, 1fr),
      rows: (auto),
      gutter: 20pt,
      // Links: Bestandteile
      stack(spacing: 10pt,
        card("📋", "Deckblatt", "Name des Spiels, Cover-Skizze, Scratch-Zugangsdaten", accent: scratch-orange),
        card("🎯", "Ziel pro Stunde", "Was wollen wir heute erreichen?", accent: scratch-blue),
        card("🔍", "Reflexion", "Was lief gut? Was war schwierig? Was verbessern wir?", accent: scratch-green),
      ),
      // Rechts: Hinweis-Box – feste Höhe über align verhindert y-Overflow
      block(
        fill: scratch-yellow.lighten(70%),
        stroke: 3pt + scratch-yellow,
        radius: 12pt,
        inset: 18pt,
        width: 100%,
      )[
        #align(center + top)[
          #text(size: 30pt)[📝]

          #text(fill: dark, weight: "bold", size: 15pt)[Am Anfang jeder Stunde:]
          #block(
            fill: scratch-yellow.darken(10%),
            radius: 6pt,
            inset: (x: 10pt, y: 6pt),
            width: 100%,
          )[#text(fill: dark, size: 14pt, weight: "bold")[✏️ Ziel eintragen]]
          #text(fill: dark, weight: "bold", size: 15pt)[Am Ende jeder Stunde:]
          #block(
            fill: scratch-yellow.darken(10%),
            radius: 6pt,
            inset: (x: 10pt, y: 6pt),
            width: 100%,
          )[#text(fill: dark, size: 14pt, weight: "bold")[🔍 Reflexion ausfüllen]]
          #text(fill: dark.lighten(20%), size: 12pt)[Das zählt zur Bewertung! ⭐]
        ]
      ]
    )
  ]
]

// ═══════════════════════════════════════════════════════════════════════════
// FOLIE 6 · Bewertungskriterien
// ═══════════════════════════════════════════════════════════════════════════
#slide()[
  #pad(top: 30pt, x: 50pt)[
    #text(size: 34pt, weight: "bold", fill: white)[Bewertung]
    #v(0.3em)
    #text(fill: muted, size: 15pt)[Daran wird euer Projekt bewertet:]
    #v(1em)
    #grid(columns: (1fr, 1fr), gutter: 10pt,
      ..("Ziele setzen und daran arbeiten",
         "Reflexion sorgfältig ausfüllen",
         "Konzentriert in den Stunden arbeiten",
         "Abwechselnd programmieren",
         "Eigene Ideen umsetzen",
         "Ansprechendes Projekt ohne Fehler",
         "Probleme eigenständig lösen",
         "Feedback in der Testphase geben",
         "Abschlusspräsentation verständlich").enumerate().map(((i, t)) =>
        bew-row(t, i)
      )
    )
    #v(0.5em)
    #align(center)[
      #text(size: 22pt)[🥳 😊 😐 😞 😡]
      #h(8pt)
      #text(fill: muted, size: 14pt)[Bewertungsskala des Lehrers]
    ]
  ]
]

// ═══════════════════════════════════════════════════════════════════════════
// ── AB HIER: BEGLEIT-FOLIEN FÜR DEN UNTERRICHT ──────────────────────────
// ═══════════════════════════════════════════════════════════════════════════

// ═══════════════════════════════════════════════════════════════════════════
// FOLIE 7 · Stunde 1 – Start
// ═══════════════════════════════════════════════════════════════════════════
#slide(fill: scratch-orange.darken(50%))[
  #place(bottom + right, dx: 30pt, dy: 30pt,
    circle(radius: 80pt, fill: scratch-orange.lighten(50%)))
  #place(top + left, dx: -40pt, dy: -40pt,
    circle(radius: 60pt, fill: white.transparentize(80%)))

  #center-block[
    #stunden-badge(1, scratch-orange)
    #v(0.6em)
    #text(size: 44pt, weight: "bold", fill: white)[Einstieg & Planung]
    #v(1em)
    #grid(columns: (1fr, 1fr, 1fr), gutter: 16pt,
      timer-card(5, "Basisspiel wählen", color: scratch-orange),
      timer-card(15, "Spielidee entwickeln", color: scratch-orange),
      timer-card(20, "Programmieren & Dokumentieren", color: scratch-orange),
    )
    #v(1em)
    #text(fill: scratch-orange.lighten(60%), size: 15pt)[
      ⏱ Denkt daran: Am Ende der Stunde Reflexion ausfüllen!
    ]
  ]
]

// ═══════════════════════════════════════════════════════════════════════════
// FOLIE 8 · Stunde 1 – Aufgabe
// ═══════════════════════════════════════════════════════════════════════════
#slide()[
  #place(top, dx: 0pt, dy: 0pt,
    rect(width: 100%, height: 6pt, fill: scratch-orange))

  #pad(top: 20pt, x: 50pt)[
    #stunden-badge(1, scratch-orange)

    #text(size: 28pt, weight: "bold", fill: white)[Eure Aufgaben jetzt:]
    #stack(spacing: 14pt,
      card("1️⃣", "Scratch öffnen",
        "Geht auf scratch.mit.edu und meldet euch mit eurem Account an.",
        accent: scratch-orange),
      card("2️⃣", "Basisspiel wählen & remixen",
        "Wählt ein Spiel aus dem Game-Center und drückt 'Remixen'.",
        accent: scratch-orange),
      card("3️⃣", "Ziel eintragen",
        "Schreibt in eure Dokumentation, was ihr heute erreichen wollt.",
        accent: scratch-orange),
      card("4️⃣", "Loslegen!",
        "Passt das Spiel an und setzt eure erste Idee um.",
        accent: scratch-orange),
    )
  ]
]

// ═══════════════════════════════════════════════════════════════════════════
// FOLIE 9 · Stunde 1 – Reflexion
// ═══════════════════════════════════════════════════════════════════════════
#slide(fill: mid)[
  #place(top, dx: 0pt, dy: 0pt,
    rect(width: 100%, height: 6pt, fill: scratch-orange))

  #center-block[
    #text(size: 30pt)[🔍]
    #text(size: 38pt, weight: "bold", fill: white)[Zeit für die Reflexion!]
    #v(0.5em)
    #text(fill: muted, size: 18pt)[Nehmt euch 5 Minuten und füllt den Reflexions-Teil aus.]
    #v(1.5em)
    #grid(columns: (1fr, 1fr, 1fr), gutter: 16pt,
      block(fill: card-bg, radius: 10pt, inset: 20pt)[
        #align(center)[
          #text(size: 30pt)[✅]
          #v(0.3em)
          #text(fill: scratch-green, weight: "bold", size: 16pt)[Was lief gut?]
          #v(0.3em)
          #text(fill: white, size: 13pt)[Kreuzt an oder schreibt selbst]
        ]
      ],
      block(fill: card-bg, radius: 10pt, inset: 20pt)[
        #align(center)[
          #text(size: 30pt)[❓]
          #v(0.3em)
          #text(fill: scratch-yellow, weight: "bold", size: 16pt)[Was war schwierig?]
          #v(0.3em)
          #text(fill: white, size: 13pt)[Kreuzt an oder schreibt selbst]
        ]
      ],
      block(fill: card-bg, radius: 10pt, inset: 20pt)[
        #align(center)[
          #text(size: 30pt)[🚀]
          #v(0.3em)
          #text(fill: scratch-blue, weight: "bold", size: 16pt)[Nächstes Mal?]
          #v(0.3em)
          #text(fill: white, size: 13pt)[Was wollt ihr verbessern?]
        ]
      ],
    )
    #badge("Habt ihr euer Ziel erreicht? 😊 😐 😞 😡", fill: scratch-orange)
  ]
]

// ═══════════════════════════════════════════════════════════════════════════
// FOLIE 10 · Stunde 2 – Start
// ═══════════════════════════════════════════════════════════════════════════
#slide(fill: scratch-blue.darken(50%))[
  #place(bottom + right, dx: 30pt, dy: 30pt,
    circle(radius: 80pt, fill: scratch-blue.lighten(50%)))

  #center-block[
    #stunden-badge(2, scratch-blue)
    #v(0.6em)
    #text(size: 44pt, weight: "bold", fill: white)[Entwicklung]
    #v(1em)
    #grid(columns: (1fr, 1fr, 1fr), gutter: 16pt,
      timer-card(5, "Ziel setzen", color: scratch-blue),
      timer-card(30, "Programmieren & Testen", color: scratch-blue),
      timer-card(5, "Reflexion ausfüllen", color: scratch-blue),
    )
    #v(1em)
    #text(fill: scratch-blue.lighten(60%), size: 15pt)[
      💡 Tipp: Wechselt euch beim Programmieren ab!
    ]
  ]
]

// ═══════════════════════════════════════════════════════════════════════════
// FOLIE 11 · Stunde 2 – Aufgabe
// ═══════════════════════════════════════════════════════════════════════════
#slide()[
  #place(top, dx: 0pt, dy: 0pt,
    rect(width: 100%, height: 6pt, fill: scratch-blue))

  #pad(top: 20pt, x: 50pt)[
    #stunden-badge(2, scratch-blue)

    #text(size: 28pt, weight: "bold", fill: white)[Eure Aufgaben jetzt:]
    #stack(spacing: 14pt,
      card("1️⃣", "Ziel eintragen",
        "Was soll heute fertig werden? Tragt das Ziel in die Dokumentation ein.",
        accent: scratch-blue),
      card("2️⃣", "Eigene Ideen umsetzen",
        "Passt Figuren, Hintergründe, Sounds oder Spielregeln an.",
        accent: scratch-blue),
      card("3️⃣", "Testen & Verbessern",
        "Spielt euer Spiel durch. Funktioniert alles? Was könnt ihr verbessern?",
        accent: scratch-blue),
      card("4️⃣", "Reflexion",
        "Am Ende der Stunde: Reflexion in der Dokumentation ausfüllen.",
        accent: scratch-blue),
    )
  ]
]

// ═══════════════════════════════════════════════════════════════════════════
// FOLIE 12 · Stunde 2 – Reflexion (gleiche Folie wie S1, andere Farbe)
// ═══════════════════════════════════════════════════════════════════════════
#slide(fill: mid)[
  #place(top, dx: 0pt, dy: 0pt,
    rect(width: 100%, height: 6pt, fill: scratch-blue))

  #center-block[
    #text(size: 30pt)[🔍]
    #text(size: 38pt, weight: "bold", fill: white)[Zeit für die Reflexion!]
    #v(0.5em)
    #text(fill: muted, size: 18pt)[Nehmt euch 5 Minuten und füllt den Reflexions-Teil aus.]
    #v(1.5em)
    #grid(columns: (1fr, 1fr, 1fr), gutter: 16pt,
      block(fill: card-bg, radius: 10pt, inset: 20pt)[
        #align(center)[
          #text(size: 30pt)[✅]
          #v(0.3em)
          #text(fill: scratch-green, weight: "bold", size: 16pt)[Was lief gut?]
          #v(0.3em)
          #text(fill: white, size: 13pt)[Kreuzt an oder schreibt selbst]
        ]
      ],
      block(fill: card-bg, radius: 10pt, inset: 20pt)[
        #align(center)[
          #text(size: 30pt)[❓]
          #v(0.3em)
          #text(fill: scratch-yellow, weight: "bold", size: 16pt)[Was war schwierig?]
          #v(0.3em)
          #text(fill: white, size: 13pt)[Kreuzt an oder schreibt selbst]
        ]
      ],
      block(fill: card-bg, radius: 10pt, inset: 20pt)[
        #align(center)[
          #text(size: 30pt)[🚀]
          #v(0.3em)
          #text(fill: scratch-blue, weight: "bold", size: 16pt)[Nächstes Mal?]
          #v(0.3em)
          #text(fill: white, size: 13pt)[Was wollt ihr verbessern?]
        ]
      ],
    )
    #v(1em)
    #badge("Habt ihr euer Ziel erreicht? 😊 😐 😞 😡", fill: scratch-blue)
  ]
]

// ═══════════════════════════════════════════════════════════════════════════
// FOLIE 13 · Stunde 3 – Start
// ═══════════════════════════════════════════════════════════════════════════
#slide(fill: scratch-green.darken(50%))[
  #place(bottom + right, dx: 30pt, dy: 30pt,
    circle(radius: 80pt, fill: scratch-green.lighten(50%)))

  #center-block[
    #stunden-badge(3, scratch-green)
    #v(0.6em)
    #text(size: 44pt, weight: "bold", fill: white)[Abschluss & Präsentation]
    #v(1em)
    #grid(columns: (1fr, 1fr, 1fr, 1fr), gutter: 14pt,
      timer-card(5, "Ziel setzen", color: scratch-green),
      timer-card(15, "Letzter Schliff", color: scratch-green),
      timer-card(10, "Testphase", color: scratch-green),
      timer-card(10, "Präsentation", color: scratch-green),
    )
    #v(1em)
    #text(fill: scratch-green.lighten(60%), size: 15pt)[
      🌟 Das ist eure letzte Stunde – macht euer Spiel fertig!
    ]
  ]
]

// ═══════════════════════════════════════════════════════════════════════════
// FOLIE 14 · Stunde 3 – Testphase
// ═══════════════════════════════════════════════════════════════════════════
#slide()[
  #place(top, dx: 0pt, dy: 0pt,
    rect(width: 100%, height: 6pt, fill: scratch-green))

  #pad(top: 35pt, x: 50pt)[
    #text(size: 32pt, weight: "bold", fill: white)[
      🧪 Testphase – Gebt euch gegenseitig Feedback!
    ]
    #v(1em)
    #grid(columns: (1fr, 1fr), gutter: 20pt, align: (center + top, center + top),
      block(fill: scratch-green.darken(40%), radius: 12pt, inset: 22pt)[
        #text(fill: scratch-green.lighten(60%), weight: "bold", size: 18pt)[Als Tester*in:]
        #v(0.8em)
        #stack(spacing: 8pt,
          text(fill: white, size: 15pt, "👾 Spielt das Spiel durch"),
          text(fill: white, size: 15pt, "❓ Was ist unklar?"),
          text(fill: white, size: 15pt, "💚 Was gefällt euch gut?"),
          text(fill: white, size: 15pt, "💡 Was könnte besser sein?"),
        )
      ],
      block(fill: card-bg, radius: 12pt, inset: 22pt)[
        #text(fill: scratch-blue.lighten(40%), weight: "bold", size: 18pt)[Als Entwickler*in:]
        #v(0.8em)
        #stack(spacing: 8pt,
          text(fill: white, size: 15pt, "👂 Hört gut zu"),
          text(fill: white, size: 15pt, "📝 Schreibt Feedback auf"),
          text(fill: white, size: 15pt, "🔧 Verbessert das Spiel"),
          text(fill: white, size: 15pt, "🤝 Bedankt euch!"),
        )
      ],
    )
    #v(1em)
    #align(center)[
      #badge("Gutes Feedback ist freundlich, konkret und hilfreich! 💬", fill: scratch-green)
    ]
  ]
]

// ═══════════════════════════════════════════════════════════════════════════
// FOLIE 15 · Abschlusspräsentation
// ═══════════════════════════════════════════════════════════════════════════
#slide()[
  #place(top, dx: 0pt, dy: 0pt,
    rect(width: 100%, height: 6pt, fill: scratch-yellow))

  #pad(top: 35pt, x: 50pt)[
    #text(size: 34pt, weight: "bold", fill: white)[
      🎤 Abschlusspräsentation
    ]
    #v(0.5em)
    #text(fill: muted, size: 16pt)[Stellt euer Spiel der Klasse vor!]
    #v(1.2em)
    #grid(columns: (1fr, 1fr), gutter: 20pt,
      stack(spacing: 14pt,
        card("📖", "Erklärt das Spiel",
          "Wie heißt euer Spiel? Was ist das Ziel?", accent: scratch-yellow),
        card("🎮", "Zeigt das Spiel",
          "Führt das Spiel kurz vor.", accent: scratch-yellow),
        card("💡", "Erklärt eure Ideen",
          "Was habt ihr verändert? Was war eure besondere Idee?", accent: scratch-yellow),
      ),
      block(
        fill: scratch-yellow.lighten(70%),
        stroke: 3pt + scratch-yellow,
        radius: 12pt,
        inset: 20pt,
        width: 100%,
      )[
        #align(center)[
          #text(size: 24pt)[⏱]
          #v(0.3em)
          #text(fill: dark, weight: "bold", size: 18pt)[Ca. 2 Minuten]
          #v(0.3em)
          #text(fill: dark, size: 14pt)[pro Gruppe]
          #v(0.6em)
          #text(fill: dark.lighten(20%), size: 13pt)[
            Alle hören zu und\
            klatschen am Ende! 👏
          ]
        ]
      ]
    )
  ]
]

// ═══════════════════════════════════════════════════════════════════════════
// FOLIE 16 · Ende / Danke
// ═══════════════════════════════════════════════════════════════════════════
#slide()[
  #place(top + left, dx: -60pt, dy: -60pt,
    circle(radius: 120pt, fill: scratch-orange.lighten(80%)))
  #place(bottom + right, dx: 60pt, dy: 60pt,
    circle(radius: 100pt, fill: scratch-green.lighten(80%)))

  #center-block[
    #text(size: 80pt)[🏆]
    #v(0.3em)
    #text(size: 46pt, weight: "bold", fill: white)[Gut gemacht!]
    #v(0.5em)
    #text(fill: muted, size: 22pt)[Ihr habt euer eigenes Spiel entwickelt.]
    #v(1.5em)
    #stack(dir: ltr, spacing: 12pt,
      badge("Kreativ", fill: scratch-orange),
      badge("Teamarbeit", fill: scratch-blue),
      badge("Programmiert", fill: scratch-green),
    )
    #v(2em)
    #text(fill: muted, size: 13pt)[Mike Barkmin · CC-BY-SA]
  ]
]
