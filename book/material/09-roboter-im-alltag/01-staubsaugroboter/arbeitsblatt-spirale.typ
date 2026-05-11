#import "@preview/cetz:0.4.2": canvas, draw

#let C-ACC = rgb("#6a1b9a")  // lila
#let C-LITE = rgb("#f3e5f5")
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
#ab-header("🌀", "Strategie 3: Spiralförmige Abdeckung")

// ── Erklärung + Grafik ───────────────────────────────────────────────────────
#grid(
  columns: (1fr, 5.5cm),
  gutter: 1em,
  align: top,
  [
    #section("Was ist diese Strategie?")
    Der Roboter fährt eine *nach innen werdende Spirale* und deckt so den
    Raum von außen nach innen ab. Die Spirale kann *rechteckig* oder
    *kreisförmig* sein.

    Bei der *rechteckigen Spirale* fährt er je eine gerade Seite,
    dreht 90°, und die nächste Seite ist etwas kürzer.
    Dieser Ablauf wiederholt sich, bis die Strecke zu kurz wird.

    #v(0.3em)
    *Schwierigkeit:* ⭐⭐ (mittel) #h(1em)
    *Sensoren:* Motorencoder (Odometrie)
  ],
  [
    #text(weight: "bold")[Bewegungsmuster]
    #v(0.3em)
    #canvas(length: 0.75cm, {
      let C = rgb("#6a1b9a")
      draw.rect((0, 0), (7, 5.5), stroke: 2pt)
      draw.content((3.5, -0.4), text(size: 7pt, fill: rgb("#757575"))[Raum])
      let runden = (
        ((0.4, 5.0), (6.6, 5.0)),
        ((6.6, 5.0), (6.6, 0.4)),
        ((6.6, 0.4), (0.4, 0.4)),
        ((0.4, 0.4), (0.4, 4.0)),
        ((0.4, 4.0), (5.7, 4.0)),
        ((5.7, 4.0), (5.7, 1.2)),
        ((5.7, 1.2), (1.2, 1.2)),
        ((1.2, 1.2), (1.2, 3.2)),
        ((1.2, 3.2), (4.8, 3.2)),
        ((4.8, 3.2), (4.8, 2.0)),
        ((4.8, 2.0), (2.0, 2.0)),
        ((2.0, 2.0), (2.0, 2.8)),
        ((2.0, 2.8), (3.8, 2.8)),
        ((3.8, 2.8), (3.8, 2.4)),
        ((3.8, 2.4), (2.8, 2.4)),
      )
      draw.circle(runden.first().first(), radius: 0.22, fill: rgb("#2e7d32"), stroke: none)
      draw.content((0.4, 4.6), text(size: 7pt, fill: rgb("#2e7d32"))[Start])
      for seg in runden {
        draw.line(seg.first(), seg.last(), stroke: (paint: C, thickness: 1.2pt), mark: (end: ">"))
      }
      draw.circle((3.0, 2.6), radius: 0.18, fill: C, stroke: none)
      draw.content((3.0, 2.1), text(size: 6.5pt, fill: C)[Ende])
    })
  ],
)

// ── Algorithmus ───────────────────────────────────────────────────────────────
#section("Algorithmus – Schritt für Schritt")
#step("1", [Setze *Startlänge* (z.B. Raumbreite) und *Verkürzungsschritt* (= Roboterbreite)])
#step("2", [*Fahre* die aktuelle Streckenlänge geradeaus])
#step("3", [*Drehe* 90° (immer in dieselbe Richtung)])
#step("4", [*Fahre* dieselbe Streckenlänge nochmals geradeaus, *drehe* wieder 90°])
#step("5", [*Verkürze* die Streckenlänge um den Verkürzungsschritt])
#step("6", [Wiederhole ab Schritt 2, bis Streckenlänge ≤ 0])

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
  [Deckt den Raum vollständig ab], [Setzt rechteckigen Raum voraus],
  [Kein Sensor nötig (nur Encoder)], [#blank(w: 5cm)],
  [#blank(w: 5cm)], [#blank(w: 5cm)],
)

// ── EV3-Umsetzung ─────────────────────────────────────────────────────────────
#section("EV3-Umsetzung")
*Sensoren:*
- 2× Motor (links/rechts)
- (optional) Ultraschall
