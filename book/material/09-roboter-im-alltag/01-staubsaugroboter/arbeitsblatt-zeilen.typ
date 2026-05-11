#import "@preview/cetz:0.4.2": canvas, draw

#let C-ACC = rgb("#0d47a1")  // tiefes Blau
#let C-LITE = rgb("#e3f2fd")
#let C-CODE = rgb("#f5f5f5")
#let C-DARK = rgb("#212121")
#let C-GREY = rgb("#757575")
#let C-GRN = rgb("#1b5e20")
#let C-RED = rgb("#b71c1c")

#set page(paper: "a4", margin: (top: 1.4cm, bottom: 1.5cm, x: 1.8cm))
#set text(font: "Fira Sans", size: 10.5pt, fill: C-DARK)
#set par(spacing: 0.55em)

#let ab-header(icon, title) = {
  block(fill: C-ACC, width: 100%, inset: (x: 1em, y: 0.55em), radius: (top: 6pt))[
    #grid(
      columns: (1fr, auto),
      text(size: 17pt, weight: "bold", fill: white)[#title], text(size: 22pt)[#icon],
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

#let step(n, content) = {
  v(0.25em)
  grid(
    columns: (auto, 1fr),
    gutter: 0.5em,
    block(fill: C-ACC, inset: (x: 0.45em, y: 0.25em), radius: 4pt)[
      #text(fill: white, weight: "bold", size: 9pt)[#n]
    ],
    align(horizon)[#content],
  )
}

#let code(content) = block(
  fill: C-CODE,
  width: 100%,
  inset: (x: 0.9em, y: 0.7em),
  radius: 4pt,
  stroke: 0.5pt + C-GREY,
)[
  #set text(font: "DejaVu Sans Mono", size: 8.5pt)
  #content
]

#let blank(w: 2cm) = box(
  width: w,
  height: 1em,
  stroke: (bottom: 0.8pt + C-DARK),
)

#let aufgabe(content) = block(
  fill: C-LITE,
  width: 100%,
  inset: 0.85em,
  radius: 6pt,
  stroke: 2pt + C-ACC,
)[#content]

// ═════════════════════════════════════════════════════════════════════════════
#ab-header("📏", "Strategie 2: Zeilenweise Abdeckung")

// ── Erklärung + Grafik ───────────────────────────────────────────────────────
#grid(
  columns: (1fr, 5.5cm),
  gutter: 1em,
  align: top,
  [
    #section("Was ist diese Strategie?")
    Der Roboter fährt den Raum *bahnenweise* ab – ähnlich einem Rasenmäher.
    Er fährt eine Zeile lang, dreht dann um, fährt die nächste Zeile zurück
    und so weiter (sog. *Boustrophedon*-Muster).

    Damit dies funktioniert, muss der Roboter wissen, *wie groß der Raum ist*
    oder er misst die Wand und wendet daran.

    #v(0.3em)
    *Schwierigkeit:* ⭐⭐ (mittel) #h(1em)
    *Sensoren:* Ultraschall + Farbsensor (optional)
  ],
  [
    #text(weight: "bold")[Bewegungsmuster]
    #v(0.3em)
    #canvas(length: 0.78cm, {
      let C = rgb("#0d47a1")
      let CD = rgb("#90caf9")
      draw.rect((0, 0), (7, 5), stroke: 2pt)
      draw.content((3.5, -0.4), text(size: 7pt, fill: rgb("#757575"))[Raum])
      let rows = (4.4, 3.2, 2.0, 0.8)
      let left = 0.4
      let right = 6.6
      draw.circle((left, rows.at(0)), radius: 0.22, fill: rgb("#2e7d32"), stroke: none)
      draw.content((left + 0.05, rows.at(0) - 0.45), text(size: 7pt, fill: rgb("#2e7d32"))[Start])
      for i in range(rows.len()) {
        let y = rows.at(i)
        let (from, to) = if calc.rem(i, 2) == 0 {
          ((left, y), (right, y))
        } else {
          ((right, y), (left, y))
        }
        draw.line(from, to, stroke: (paint: C, thickness: 1.3pt), mark: (end: ">"))
        if i < rows.len() - 1 {
          let ny = rows.at(i + 1)
          let wx = if calc.rem(i, 2) == 0 { right } else { left }
          draw.line((wx, y), (wx, ny), stroke: (paint: CD, thickness: 1pt, dash: "dashed"))
        }
      }
      draw.content((3.5, 2.6), text(size: 7pt, fill: rgb("#757575"))[← Wende])
    })
  ],
)

// ── Algorithmus ───────────────────────────────────────────────────────────────
#section("Algorithmus – Schritt für Schritt")
#step("1", [*Fahre geradeaus*, bis Ultraschall < Schwellwert (= Wand erkannt)])
#step("2", [*Stoppe* und *drehe* 90° in Wenderichtung])
#step("3", [*Fahre* eine Bahnbreite vor (= Breite des Roboters)])
#step("4", [*Drehe* nochmals 90° (jetzt in entgegengesetzte Richtung)])
#step("5", [*Fahre* zur gegenüberliegenden Wand → zurück zu Schritt 1])
#step("6", [*Ende*, wenn keine freie Bahn mehr vorhanden (optionales Abbruchkriterium)])

// ── Vor- und Nachteile ────────────────────────────────────────────────────────
#section("Vor- und Nachteile – ergänze nach der Klassendiskussion")
#table(
  columns: (1fr, 1fr),
  stroke: 0.5pt + C-GREY,
  inset: (x: 0.7em, y: 0.5em),
  fill: (col, row) => {
    if row == 0 { if col == 0 { C-GRN.lighten(80%) } else { C-RED.lighten(85%) } } else { white }
  },
  [#text(weight: "bold", fill: C-GRN)[✅ Vorteile]], [#text(weight: "bold", fill: C-RED)[❌ Nachteile]],
  [Deckt den Raum systematisch ab], [Braucht genaue Wand-Erkennung],
  [#blank(w: 5cm)], [Ecken und unregelmäßige Räume schwierig],
  [#blank(w: 5cm)], [#blank(w: 5cm)],
)

// ── EV3-Umsetzung ─────────────────────────────────────────────────────────────
#section("EV3-Umsetzung")
*Sensoren:*
- 📡 Ultraschallsensor (vorne)
- ⚙️ Motordrehung messen (Odometrie)
- 2× Motor (links/rechts)
