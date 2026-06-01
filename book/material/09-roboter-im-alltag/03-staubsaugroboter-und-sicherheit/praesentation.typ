#import "@preview/polylux:0.4.0": slide, enable-handout-mode

// ── Farbpalette ──────────────────────────────────────────────────────────────
#let C-BLUE    = rgb("#0d47a1")
#let C-MID     = rgb("#1565c0")
#let C-LIGHT   = rgb("#e3f2fd")
#let C-AMBER   = rgb("#e65100")
#let C-AMBER-L = rgb("#fff3e0")
#let C-GREEN   = rgb("#2e7d32")
#let C-GREEN-L = rgb("#e8f5e9")
#let C-RED     = rgb("#b71c1c")
#let C-RED-L   = rgb("#fce4ec")
#let C-YELLOW  = rgb("#fff8e1")
#let C-WHITE   = white
#let C-DARK    = rgb("#212121")
#let C-GREY    = rgb("#757575")

// ── Globale Einstellungen ─────────────────────────────────────────────────────
#set page(paper: "presentation-16-9", fill: C-WHITE, margin: 0pt)
#set text(font: "Fira Sans", size: 19pt, fill: C-DARK)
#set list(indent: 0.5em, spacing: 0.7em)

// ── Hilfs-Komponenten ─────────────────────────────────────────────────────────
#let make-header(title) = block(
  fill: C-BLUE, width: 100%,
  inset: (x: 1.4em, y: 0.55em),
)[
  #text(fill: C-WHITE, size: 25pt, weight: "bold")[#title]
]

#let make-footer = block(
  fill: C-LIGHT, width: 100%,
  inset: (x: 1.4em, y: 0.4em),
)[
  #text(size: 13pt, fill: C-GREY)[Roboter im Alltag · 9. Klasse]
]

#let body(content) = pad(x: 1.4em, top: 0.9em, bottom: 0.2em)[#content]

#let content-slide(title, content) = slide[
  #set page(footer: make-footer)
  #make-header(title)
  #body(content)
]

#let think-slide(question, task: none, time: none) = slide[
  #set page(fill: C-AMBER)
  #align(center + horizon)[
    #text(size: 30pt, fill: C-WHITE)[🤔]
    #v(0.4em)
    #block(width: 80%)[
      #text(size: 28pt, weight: "bold", fill: C-WHITE)[#question]
    ]
    #if task != none [
      #v(0.6em)
      #block(
        fill: white.transparentize(85%), inset: (x: 1.2em, y: 0.6em), radius: 8pt, width: 70%,
      )[
        #text(size: 19pt, fill: C-WHITE)[#task]
      ]
    ]
    #if time != none [
      #v(0.5em)
      #text(size: 16pt, fill: white.transparentize(20%))[⏱ #time]
    ]
  ]
]

#let infobox(color: C-LIGHT, title: none, content) = block(
  fill: color, width: 100%,
  inset: 0.8em, radius: 6pt,
  stroke: (left: 4pt + C-BLUE),
)[
  #if title != none [#text(weight: "bold")[#title \ ]]
  #content
]

#let step-box(n, content) = grid(
  columns: (auto, 1fr), gutter: 0.6em,
  block(fill: C-BLUE, inset: (x: 0.6em, y: 0.4em), radius: 6pt)[
    #text(fill: white, weight: "bold")[#n]
  ],
  align(horizon)[#content],
)

#let section-slide(part, title, subtitle, fill: C-MID, text-muted: rgb("#90caf9"), text-sub: rgb("#bbdefb")) = slide[
  #set page(fill: fill)
  #align(center + horizon)[
    #text(size: 18pt, fill: text-muted)[#part]
    #v(0.2em)
    #text(size: 38pt, weight: "bold", fill: C-WHITE)[#title]
    #v(0.2em)
    #text(size: 20pt, fill: text-sub)[#subtitle]
  ]
]

#let table-header(..cells) = table.header(
  ..cells.pos().map(c => table.cell(fill: C-BLUE)[
    #text(fill: white, weight: "bold", size: 14pt)[#c]
  ])
)

// ════════════════════════════════════════════════════════════════════════════
// TITELFOLIE
// ════════════════════════════════════════════════════════════════════════════
#slide[
  #set page(fill: C-BLUE)
  #align(center + horizon)[
    #text(size: 16pt, fill: rgb("#90caf9"))[🤖 Roboter im Alltag]
    #v(0.5em)
    #text(size: 38pt, weight: "bold", fill: C-WHITE)[Staubsaugroboter und Sicherheit]
    #v(0.3em)
    #text(size: 22pt, fill: rgb("#bbdefb"))[
      Daten · Privatsphäre · Schutz
    ]
    #v(0.8em)
    #block(fill: rgb("#1565c0"), inset: (x: 1.2em, y: 0.5em), radius: 6pt)[
      #text(size: 15pt, fill: rgb("#90caf9"))[9. Klasse · Informatik]
    ]
  ]
]

// ════════════════════════════════════════════════════════════════════════════
// AGENDA
// ════════════════════════════════════════════════════════════════════════════
#content-slide("Heutiger Ablauf")[
  #v(0.4em)
  #grid(columns: 2, gutter: 0.8em,
    step-box("1", [*Einstieg* – Was würdet ihr einbauen?]),
    step-box("2", [*Marktanalyse* – Echte Roboter im Vergleich]),
    step-box("3", [*Daten* – Was weiß mein Roboter?]),
    step-box("4", [*Video* – DJI-Sicherheitslücke]),
    step-box("5", [*BSI* – Kaufberatung]),
    step-box("6", [*Debatte* – Kamera verbieten?]),
  )
]

// ════════════════════════════════════════════════════════════════════════════
// PHASE 1 – EINSTIEG
// ════════════════════════════════════════════════════════════════════════════
#section-slide("Phase 1", "💡 Einstieg", "Von eurem LEGO-Roboter zum echten Gerät")

#think-slide(
  "Wenn ihr euren LEGO-Staubsaugroboter verbessern dürftet – was würdet ihr einbauen?",
  task: [Sammelt Ideen: Welche Funktionen fehlen eurem EV3-Roboter noch?],
  time: "3 Minuten",
)

#content-slide("Funktion → benötigte Daten")[
  #v(0.3em)
  #table(
    columns: (1fr, 1fr),
    inset: 0.7em,
    stroke: 0.5pt + C-GREY,
    table-header("Funktion", "Benötigte Daten"),
    [Hinderniserkennung], [Abstandsdaten (Ultraschall)],
    [Kamera], [Bilder / Videos],
    [App-Steuerung], [Standort, Nutzungsdaten],
    [Kartierung], [Wohnungsgrundriss],
    [Sprachsteuerung], [Sprachaufnahmen],
    [Automatische Entleerung], [Füllstandsdaten],
  )
  #v(0.5em)
  #infobox(color: C-AMBER-L)[
    #text(weight: "bold", fill: C-AMBER)[Leitfrage:] Je intelligenter der Roboter, desto *mehr Daten* sammelt er.
  ]
]

// ════════════════════════════════════════════════════════════════════════════
// PHASE 2 – MARKTANALYSE
// ════════════════════════════════════════════════════════════════════════════
#section-slide("Phase 2", "🛒 Marktanalyse", "Was können echte Staubsaugroboter?")

#content-slide("Gruppenauftrag: Hersteller recherchieren")[
  #grid(columns: (1fr, 1fr), gutter: 1em,
    [
      *Eure Gruppe untersucht einen Hersteller:*
      #v(0.5em)
      - 🟦 Roborock
      - 🟧 iRobot
      - 🟩 Ecovacs
      - 🟨 Dreame
      - 🟥 DJI
      - 🟪 Miele
      - 🟫 Rowenta
      - ⬜ Xiaomi
      - 🔲 Samsung
    ],
    [
      #infobox(title: "📋 Recherche-Fragen")[
        - Welches Modell? Preis?
        - Welche Funktionen?
        - Welche Daten werden gesammelt?
        - Cloud oder lokal?
        - Datenschutz-Infos?
      ]
      #v(0.3em)
      #text(size: 15pt, fill: C-GREY)[→ Arbeitsblatt Marktanalyse]
    ]
  )
]

#think-slide(
  "Welche Funktion würdet ihr nutzen? Welche nicht?",
  task: [Präsentiert eure Ergebnisse im Plenum.\
  Jede Gruppe hat 3 Minuten.],
  time: "15 Minuten Präsentation",
)

// ════════════════════════════════════════════════════════════════════════════
// PHASE 3 – DATENSAMMLUNG
// ════════════════════════════════════════════════════════════════════════════
#section-slide("Phase 3", "📊 Datensammlung", "Was weiß mein Staubsaugroboter über mich?")

#content-slide("Welche Daten sammelt ein Staubsaugroboter?")[
  #grid(columns: (1fr, 1fr, 1fr), gutter: 0.8em,
    infobox(title: "🔧 Technische Daten")[
      - Akkustand
      - Fahrwege
      - Sensorwerte
      - Reinigungszeiten
    ],
    infobox(title: "🏠 Wohnungsdaten")[
      - Grundrisse
      - Raumgrößen
      - Möbelpositionen
      - Hindernisse
    ],
    infobox(title: "👤 Nutzer­daten")[
      - App-Nutzung
      - Standortdaten
      - Sprachdaten
      - Fotos / Videos
    ],
  )
]

#think-slide(
  "Welche dieser Daten würdet ihr Fremden freiwillig geben?",
  task: [Diskutiert kurz: Was ist harmlos – was geht zu weit?],
  time: "2 Minuten",
)

// ════════════════════════════════════════════════════════════════════════════
// PHASE 4 – VIDEO
// ════════════════════════════════════════════════════════════════════════════
#section-slide("Phase 4", "📹 Video", "DJI-Sicherheitslücke")

#content-slide("Arbeitsauftrag während des Videos")[
  #grid(columns: (1fr, 1fr), gutter: 1em,
    [
      *Beantwortet während des Schauens:*
      #v(0.4em)
      #step-box("1", [Welche Daten konnte der Entwickler sehen?])
      #v(0.3em)
      #step-box("2", [Warum war das so problematisch?])
      #v(0.3em)
      #step-box("3", [War die Übertragung verschlüsselt?])
      #v(0.3em)
      #step-box("4", [Wo lag die eigentliche Sicherheitslücke?])
      #v(0.3em)
      #step-box("5", [Welche Folgen könnte das haben?])
    ],
    [
      #infobox(color: C-AMBER-L, title: "📝 Tipp")[
        Macht Stichpunkte auf dem\
        *Arbeitsblatt Videoanalyse*.
      ]
    ]
  )
]

// ════════════════════════════════════════════════════════════════════════════
// PHASE 5 – VIDEOAUSWERTUNG
// ════════════════════════════════════════════════════════════════════════════
#section-slide("Phase 5", "🔍 Auswertung", "Was haben wir gelernt?")

#content-slide("Was der Entwickler sehen konnte")[
  #grid(columns: (1fr, 1fr), gutter: 1em,
    [
      *Sichtbare Daten (~7.000 Geräte):*
      #v(0.4em)
      - Grundrisse der Wohnungen
      - Live-Kamerabilder
      - Akkuladestatus
      - Seriennummern
      - Aktuelle Reinigungsaktivitäten
    ],
    [
      #infobox(color: C-RED-L, title: "❌ Das eigentliche Problem")[
        *Nicht* die Verschlüsselung!\
        \
        Sondern: *Fehlende Zugriffs-\
        kontrolle* auf dem Server.\
        \
        Ein Token = Generalschlüssel\
        für alle Geräte.
      ]
    ]
  )
]

#content-slide("Analogie: Lehrerzimmer")[
  #align(center + horizon)[
    #block(width: 80%)[
      #infobox(color: C-LIGHT, title: "🏫 Vergleich mit dem Schulfach")[
        Alle Klassenarbeiten liegen im *Lehrerzimmer*.\
        \
        Die Tür ist *abgeschlossen* → das ist TLS-Verschlüsselung ✅\
        \
        Aber *jeder Schüler* bekommt denselben Schlüssel.\
        → Das ist das eigentliche Problem: keine Zugriffskontrolle ❌
      ]
    ]
    #v(1em)
    #text(fill: C-GREY, size: 16pt)[
      Technisch: fehlende Access Control Lists (ACL) auf dem MQTT-Server
    ]
  ]
]

// ════════════════════════════════════════════════════════════════════════════
// PHASE 6 – BSI
// ════════════════════════════════════════════════════════════════════════════
#section-slide(
  "Phase 6", "🛡️ BSI", "Sicher einkaufen mit Verstand",
  fill: C-GREEN,
  text-muted: rgb("#a5d6a7"),
  text-sub: rgb("#c8e6c9"),
)

#content-slide("BSI-Fragen vor dem Kauf")[
  #grid(columns: (1fr, 1fr), gutter: 0.8em,
    infobox(title: "🔄 Software & Updates")[
      - Wie lange gibt es Updates?
      - Automatische Sicherheits-\
        patches?
    ],
    infobox(title: "📱 App & Berechtigungen")[
      - Ist eine App Pflicht?
      - Welche Zugriffsrechte?
      - Welche Daten erhebt die App?
    ],
    infobox(title: "☁️ Cloud & Speicher")[
      - Cloud oder lokal?
      - Wo stehen die Server?
      - EU-Datenschutz (DSGVO)?
    ],
    infobox(title: "⚙️ Offline-Nutzung")[
      - Auch ohne Internet nutzbar?
      - Lokale Steuerung möglich?
    ],
  )
  #v(0.3em)
  #text(size: 15pt, fill: C-GREY)[→ Arbeitsblatt BSI-Empfehlungen]
]

#think-slide(
  "Welche drei Fragen haltet ihr für die wichtigsten – und warum?",
  task: [Markiert in der Gruppe und bereitet eine kurze Begründung vor.],
  time: "10 Minuten",
)

// ════════════════════════════════════════════════════════════════════════════
// PHASE 7 – KAUFBERATUNG
// ════════════════════════════════════════════════════════════════════════════
#section-slide(
  "Phase 7", "🏆 Kaufberatung",
  "Datenschutz-Check",
  fill: C-GREEN,
  text-muted: rgb("#a5d6a7"),
  text-sub: rgb("#c8e6c9"),
)

#content-slide("Datenschutz-Check: Bewertungsraster")[
  #v(0.2em)
  #table(
    columns: (1fr, auto),
    inset: 0.7em,
    stroke: 0.5pt + C-GREY,
    table-header("Kriterium", "Punkte (max.)"),
    [Lange Updateversorgung (≥ 3 Jahre)], [3],
    [Ohne Cloud nutzbar], [3],
    [Keine Kamera verbaut], [2],
    [Wenige App-Berechtigungen], [2],
    [Server in der EU (DSGVO)], [2],
    [Transparente Datenschutzerklärung], [2],
    [Lokal steuerbar (kein Cloud-Zwang)], [2],
  )
]

// ════════════════════════════════════════════════════════════════════════════
// PHASE 8 – DEBATTE
// ════════════════════════════════════════════════════════════════════════════
#section-slide("Phase 8", "💬 Debatte", "Kamera verbieten?")

#slide[
  #set page(fill: C-RED)
  #align(center + horizon)[
    #text(size: 20pt, fill: white.transparentize(30%))[These:]
    #v(0.4em)
    #block(width: 85%)[
      #text(size: 34pt, weight: "bold", fill: C-WHITE)[
        „Staubsaugroboter mit Kamera sollten verboten werden."
      ]
    ]
    #v(0.8em)
    #block(
      fill: white.transparentize(80%), inset: (x: 1.5em, y: 0.7em),
      radius: 8pt, width: 75%,
    )[
      #text(size: 18pt, fill: C-WHITE)[
        Positioniert euch im Raum und begründet eure Haltung.
      ]
    ]
  ]
]

#content-slide("Raumlinie")[
  #v(0.5em)
  #align(center)[
    #grid(
      columns: (1fr,) * 5, gutter: 0.4em,
      ..("Stimme\nzu", "Stimme\neher zu", "Unent-\nschieden", "Stimme\neher nicht zu", "Stimme\nnicht zu").map(label =>
        block(fill: C-LIGHT, inset: 0.8em, radius: 6pt, width: 100%)[
          #align(center)[#text(size: 15pt)[#label]]
        ]
      )
    )
  ]
  #v(0.8em)
  #infobox(color: C-YELLOW)[
    *Eure Argumente:* Was spricht für ein Verbot? Was dagegen?\
    Denkt an Sicherheit, Nutzen, Datenschutz und Alternativen.
  ]
]

// ════════════════════════════════════════════════════════════════════════════
// PHASE 9 – ABSCHLUSS
// ════════════════════════════════════════════════════════════════════════════
#section-slide(
  "Phase 9", "📋 Abschluss",
  "Euer Verbraucherplakat",
  fill: C-GREEN,
  text-muted: rgb("#a5d6a7"),
  text-sub: rgb("#c8e6c9"),
)

#content-slide("Aufgabe: Verbraucherplakat")[
  #grid(columns: (1fr, 1fr), gutter: 1em,
    [
      *„Der sichere Staubsaugroboter"*
      #v(0.5em)
      Euer Plakat enthält:
      #v(0.3em)
      #step-box("1", [Welche Funktionen sind sinnvoll?])
      #v(0.3em)
      #step-box("2", [Welche Daten werden gesammelt?])
      #v(0.3em)
      #step-box("3", [Worauf sollte man beim Kauf achten?])
      #v(0.3em)
      #step-box("4", [Drei Kaufempfehlungen nach BSI])
    ],
    [
      #infobox(color: C-GREEN-L, title: "🎯 Ziel")[
        Stellt euch vor, ihr schreibt\
        einen Ratgeber für eure Eltern\
        oder jüngere Geschwister.
      ]
      #v(0.4em)
      #infobox(color: C-YELLOW, title: "⏱️ Zeit")[
        15 Minuten – dann kurze\
        Vorstellung pro Gruppe
      ]
    ]
  )
]

// ── Abschlussfolie ────────────────────────────────────────────────────────────
#slide[
  #set page(fill: C-BLUE)
  #align(center + horizon)[
    #text(size: 16pt, fill: rgb("#90caf9"))[Das nehmen wir mit:]
    #v(0.6em)
    #grid(columns: (1fr, 1fr, 1fr), gutter: 0.8em,
      block(fill: rgb("#1565c0"), inset: 1em, radius: 8pt)[
        #text(fill: C-WHITE, weight: "bold")[🔒 Verschlüsselung\nallein reicht nicht]
      ],
      block(fill: rgb("#1565c0"), inset: 1em, radius: 8pt)[
        #text(fill: C-WHITE, weight: "bold")[📋 BSI-Fragen\nvor dem Kauf]
      ],
      block(fill: rgb("#1565c0"), inset: 1em, radius: 8pt)[
        #text(fill: C-WHITE, weight: "bold")[🤔 Kamera = Wanze\nin der Wohnung?]
      ],
    )
    #v(0.8em)
    #text(size: 20pt, fill: rgb("#bbdefb"))[
      Daten sind das neue Öl – und euer Wohnzimmer ist die Quelle.
    ]
  ]
]
