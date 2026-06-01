#let C-ACC  = rgb("#e65100")
#let C-LITE = rgb("#fff3e0")
#let C-DARK = rgb("#212121")
#let C-GREY = rgb("#9e9e9e")
#let C-GREEN = rgb("#2e7d32")
#let C-RED   = rgb("#b71c1c")

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

#let score-box(label, max, beschreibung) = {
  v(0.1em)
  grid(
    columns: (2fr, 1fr, auto, auto),
    gutter: 0.5em,
    align(horizon)[#label],
    align(horizon)[
      #text(size: 8pt, fill: C-GREY)[#beschreibung]
    ],
    align(horizon)[
      #block(fill: C-LITE, inset: (x: 0.6em, y: 0.3em), radius: 4pt)[
        #h(2em) / #max
      ]
    ],
    [],
  )
  v(0.1em)
}

// ─── Dokument ─────────────────────────────────────────────────────────────────
#ab-header("🏆", "Datenschutz-Check – Kaufberatung")

#block(fill: C-LITE, inset: 0.8em, radius: 6pt, stroke: (left: 4pt + C-ACC))[
  *Auftrag:* Vergebt Punkte nach den Kriterien und kommt zu einer Empfehlung.
]

// ── Teil A: Bewertungsraster ──────────────────────────────────────────────────
#section("Teil A – Bewertungsraster: Euer Roboter im Datenschutz-Check")

*Hersteller / Modell:* #line(length: 8cm, stroke: 0.4pt + C-GREY)

#v(0.4em)

#table(
  columns: (3fr, 1fr, 1fr),
  inset: 0.65em,
  stroke: 0.4pt + C-GREY,
  table.header(
    table.cell(fill: C-ACC)[#text(fill: white, weight: "bold", size: 8.5pt)[Kriterium]],
    table.cell(fill: C-ACC)[#text(fill: white, weight: "bold", size: 8.5pt)[Max. Punkte]],
    table.cell(fill: C-ACC)[#text(fill: white, weight: "bold", size: 8.5pt)[Eure Punkte]],
  ),
  [Lange Updateversorgung (≥ 3 Jahre = 3 Pkt., 1–2 Jahre = 1 Pkt.)], [3], [],
  [Ohne Cloud nutzbar (vollständig offline = 3 Pkt., eingeschränkt = 1 Pkt.)], [3], [],
  [Keine Kamera verbaut], [2], [],
  [Wenige App-Berechtigungen (nur notwendige = 2 Pkt., viele = 0 Pkt.)], [2], [],
  [Server in der EU (DSGVO-konform)], [2], [],
  [Transparente Datenschutzerklärung (klar & verständlich)], [2], [],
  [Lokal steuerbar ohne Cloud-Pflicht], [2], [],
  table.cell(fill: C-LITE)[#text(weight: "bold")[Gesamt]], table.cell(fill: C-LITE)[#text(weight: "bold")[16]], table.cell(fill: C-LITE)[],
)

// ── Teil B: Auswertung ────────────────────────────────────────────────────────
#section("Teil B – Auswertung")

*Gesamtpunkte:* #h(2em) / 16

#v(0.4em)

#grid(columns: (1fr, 1fr, 1fr), gutter: 0.6em,
  block(fill: rgb("#e8f5e9"), inset: 0.7em, radius: 6pt, stroke: (left: 3pt + C-GREEN))[
    #text(weight: "bold", fill: C-GREEN)[✅ 12–16 Punkte]\
    Empfehlenswert –\
    guter Datenschutz
  ],
  block(fill: rgb("#fff8e1"), inset: 0.7em, radius: 6pt, stroke: (left: 3pt + C-ACC))[
    #text(weight: "bold", fill: C-ACC)[⚠️ 7–11 Punkte]\
    Bedingt empfohlen –\
    mit Einschränkungen
  ],
  block(fill: rgb("#fce4ec"), inset: 0.7em, radius: 6pt, stroke: (left: 3pt + C-RED))[
    #text(weight: "bold", fill: C-RED)[❌ 0–6 Punkte]\
    Nicht empfohlen –\
    zu viele Risiken
  ],
)

#v(0.5em)
*Euer Urteil:* ☐ Empfehlenswert ☐ Bedingt empfohlen ☐ Nicht empfohlen

// ── Teil C: Begründung & Empfehlung ──────────────────────────────────────────
#section("Teil C – Eure Empfehlung: Begründung")

*Was spricht für dieses Gerät?*
#answer-lines(2)

*Was spricht dagegen?*
#answer-lines(2)

*An wen würdet ihr das Gerät empfehlen – und an wen nicht?*
#answer-lines(2)

// ── Teil D: Vergleich im Plenum ───────────────────────────────────────────────
#section("Teil D – Klassenvergleich (wird im Plenum ausgefüllt)")

#table(
  columns: (1fr, auto, auto),
  inset: 0.65em,
  stroke: 0.4pt + C-GREY,
  table.header(
    table.cell(fill: C-ACC)[#text(fill: white, weight: "bold", size: 8.5pt)[Gruppe / Modell]],
    table.cell(fill: C-ACC)[#text(fill: white, weight: "bold", size: 8.5pt)[Punkte / 16]],
    table.cell(fill: C-ACC)[#text(fill: white, weight: "bold", size: 8.5pt)[Urteil]],
  ),
  [], [], [],
  [], [], [],
  [], [], [],
  [], [], [],
  [], [], [],
)

#v(0.5em)
*Welcher Roboter hat insgesamt am besten abgeschnitten? Warum?*
#answer-lines(2)
