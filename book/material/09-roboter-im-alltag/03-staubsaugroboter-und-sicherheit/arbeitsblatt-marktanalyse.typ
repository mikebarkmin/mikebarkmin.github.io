#let C-ACC  = rgb("#0d47a1")
#let C-LITE = rgb("#e3f2fd")
#let C-DARK = rgb("#212121")
#let C-GREY = rgb("#9e9e9e")

#set page(paper: "a4", margin: (top: 1.2cm, bottom: 1.2cm, x: 1.5cm))
#set text(font: "Fira Sans", size: 9pt, fill: C-DARK)
#set par(spacing: 0.55em)

#let ab-header(icon, title) = {
  block(fill: C-ACC, width: 100%, inset: (x: 1em, y: 0.55em), radius: (top: 6pt))[
    #grid(
      columns: (1fr, auto),
      text(size: 14pt, weight: "bold", fill: white)[#title],
      text(size: 18pt)[#icon],
    )
  ]
  block(fill: C-LITE, width: 100%, inset: (x: 1em, y: 0.45em), radius: (bottom: 6pt), below: 0.9em)[
    #grid(
      columns: (2fr, 1fr, 1fr),
      gutter: 1.5em,
      [Name: #box(width: 1fr)[#line(length: 100%)]],
      [Klasse: #box(width: 1fr)[#line(length: 100%)]],
      [Datum: #box(width: 1fr)[#line(length: 100%)]],
    )
  ]
}

#let section(title) = {
  v(0.5em)
  block(fill: C-ACC.lighten(88%), width: 100%, inset: (x: 0.7em, y: 0.38em), radius: 4pt, stroke: (left: 3pt + C-ACC))[
    #text(weight: "bold", fill: C-ACC)[#title]
  ]
  v(0.25em)
}

#let answer-lines(n) = {
  for _ in range(n) {
    v(0.9em)
    line(length: 100%, stroke: 0.4pt + C-GREY)
    v(0.15em)
  }
}

#let infobox(color: C-LITE, title: none, content) = block(
  fill: color, width: 100%,
  inset: 0.8em, radius: 6pt,
  stroke: (left: 4pt + C-ACC),
)[
  #if title != none [#text(weight: "bold")[#title \ ]]
  #content
]

// ─── Dokument ─────────────────────────────────────────────────────────────────
#ab-header("🛒", "Marktanalyse – Staubsaugroboter im Vergleich")

#infobox(title: "Auftrag")[
  Ihr untersucht als Gruppe einen Staubsaugroboter-Hersteller. Recherchiert das aktuelle
  Top-Modell und füllt dieses Arbeitsblatt aus. Bereitet euch auf eine kurze Vorstellung
  (3 Minuten) im Plenum vor.
]

// ── Teil A: Grunddaten ────────────────────────────────────────────────────────
#section("Teil A – Grunddaten")

#grid(columns: (1fr, 1fr), gutter: 1.2em,
  [
    *Euer Hersteller:* \
    #v(0.1em)
    #block(fill: C-LITE, inset: (x: 0.8em, y: 0.6em), radius: 4pt, width: 100%)[
      #grid(columns: 2, gutter: (0.8em, 0.5em),
        [☐ Roborock], [☐ Miele],
        [☐ iRobot],   [☐ Rowenta],
        [☐ Ecovacs],  [☐ Xiaomi],
        [☐ Dreame],   [☐ Samsung],
        [☐ DJI],      [],
      )
    ]
  ],
  [
    *Untersuchtes Modell:*
    #answer-lines(1)
    *Preis (ca.):*
    #answer-lines(1)
  ],
)

// ── Teil B: Funktionen ────────────────────────────────────────────────────────
#section("Teil B – Funktionen & benötigte Daten")

#table(
  columns: (1fr, 1fr, auto),
  inset: 0.65em,
  stroke: 0.4pt + C-GREY,
  table.header(
    table.cell(fill: C-ACC)[#text(fill: white, weight: "bold", size: 8.5pt)[Funktion]],
    table.cell(fill: C-ACC)[#text(fill: white, weight: "bold", size: 8.5pt)[Benötigte Daten]],
    table.cell(fill: C-ACC)[#text(fill: white, weight: "bold", size: 8.5pt)[Vorhanden?]],
  ),
  [App-Steuerung],       [], [☐ Ja ☐ Nein],
  [Kartierung / SLAM],   [], [☐ Ja ☐ Nein],
  [Kamera],             [], [☐ Ja ☐ Nein],
  [Sprachsteuerung],    [], [☐ Ja ☐ Nein],
  [Auto. Entleerung],   [], [☐ Ja ☐ Nein],
  [Cloud-Steuerung],    [], [☐ Ja ☐ Nein],
  [], [], [],
)

// ── Teil C: Datenschutz ───────────────────────────────────────────────────────
#section("Teil C – Datenschutz & Sicherheit")

*Wo werden die Daten gespeichert?* (Cloud / lokal / beides)
#answer-lines(1)

*In welchem Land stehen die Server?*
#answer-lines(1)

*Wie lange gibt es Softwareupdates?*
#answer-lines(1)

*Ist eine App Pflicht für die Nutzung?*
#grid(columns: (auto, auto, 1fr), gutter: 1em,
  [☐ Ja], [☐ Nein], [Falls ja – welche Berechtigungen?],
)
#answer-lines(1)

*Kann das Gerät offline genutzt werden?*
#grid(columns: (auto, auto, 1fr), gutter: 1em,
  [☐ Ja], [☐ Nein], [],
)

// ── Teil D: Bewertung ─────────────────────────────────────────────────────────
#section("Teil D – Eure Einschätzung")

*Welche Funktion würdet ihr nutzen – und welche nicht?* Begründet kurz.
#answer-lines(3)

*Wie datenschutzfreundlich findet ihr das Gerät auf einer Skala von 1–5?*

#grid(columns: (auto, 1fr, auto), gutter: 0.5em,
  [😨 unsicher 1],
  [
    #v(0.4em)
    #line(length: 100%, stroke: 1pt + C-ACC)
    #v(-0.3em)
    #grid(columns: (1fr,) * 5,
      ..("1", "2", "3", "4", "5").map(n => align(center)[#n])
    )
  ],
  [5 sicher 😊],
)

#v(0.5em)
*Begründung:*
#answer-lines(2)
