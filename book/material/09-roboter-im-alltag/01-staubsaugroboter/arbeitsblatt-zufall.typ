#import "@preview/cetz:0.4.2": canvas, draw

#let C-ACC = rgb("#e65100")  // deep orange
#let C-LITE = rgb("#fff3e0")
#let C-CODE = rgb("#f5f5f5")
#let C-DARK = rgb("#212121")
#let C-GREY = rgb("#757575")
#let C-GRN = rgb("#1b5e20")
#let C-RED = rgb("#b71c1c")

#set page(paper: "a4", margin: (top: 1.4cm, bottom: 1.5cm, x: 1.8cm))
#set text(font: "Fira Sans", size: 10.5pt, fill: C-DARK)
#set par(spacing: 0.55em)

// ── Komponenten ───────────────────────────────────────────────────────────────
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
#ab-header("🎲", "Strategie 1: Zufallsbewegung")

// ── Erklärung + Grafik ───────────────────────────────────────────────────────
#grid(
  columns: (1fr, 5.5cm),
  gutter: 1em,
  align: top,
  [
    #section("Was ist diese Strategie?")
    Der Roboter fährt *immer geradeaus*, bis er ein Hindernis erkennt.
    Dann stoppt er, dreht sich um einen *zufälligen Winkel* und fährt wieder los.
    Dieser Ablauf wiederholt sich unendlich oft.

    Das Prinzip ähnelt einem Billardball, der von Wänden abprallt –
    nur mit zufälligem Abprallwinkel.

    #v(0.3em)
    *Schwierigkeit:* ⭐ (einfach) #h(1em)
    *Sensoren:* Ultraschall + Berührung
  ],
  [
    #text(weight: "bold")[Bewegungsmuster]
    #v(0.3em)
    #canvas(length: 0.78cm, {
      let C = rgb("#e65100")
      draw.rect((0, 0), (7, 5), stroke: 2pt)
      draw.content((3.5, -0.4), text(size: 7pt, fill: rgb("#757575"))[Raum])
      let pts = ((0.4, 4.4), (3.2, 4.4), (5.8, 1.2), (1.1, 2.0), (6.5, 3.8), (3.5, 0.4))
      for i in range(pts.len() - 1) {
        draw.line(pts.at(i), pts.at(i + 1), stroke: (paint: C, thickness: 1.3pt), mark: (end: ">"))
      }
      draw.circle(pts.first(), radius: 0.22, fill: rgb("#2e7d32"), stroke: none)
      draw.content((0.4, 4.0), text(size: 7pt, fill: rgb("#2e7d32"))[Start])
      draw.line((3.2, 4.4), (3.2, 3.8), stroke: (paint: rgb("#999999"), thickness: 0.7pt, dash: "dashed"))
      draw.content((3.6, 3.9), text(size: 6.5pt, fill: rgb("#757575"))[Zufall-\nwinkel])
    })
  ],
)

// ── Algorithmus ───────────────────────────────────────────────────────────────
#section("Algorithmus – Schritt für Schritt")
#step("1", [*Fahre geradeaus* mit konstanter Geschwindigkeit])
#step("2", [*Prüfe* jeden Moment: Ist ein Hindernis näher als X cm? Oder Berührung?])
#step("3", [*Stoppe* den Roboter sofort])
#step("4", [*Wähle* einen zufälligen Drehwinkel (z.B. 90° – 270°)])
#step("5", [*Drehe* den Roboter um diesen Winkel → zurück zu Schritt 1])

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
  [Sehr einfach zu programmieren], [Deckt nicht alle Stellen garantiert ab],
  [#blank(w: 5cm)], [Ecken werden oft ausgelassen],
  [#blank(w: 5cm)], [#blank(w: 5cm)],
)

// ── EV3-Umsetzung ─────────────────────────────────────────────────────────────
#section("EV3-Umsetzung")
*Sensoren:*
- 📡 Ultraschallsensor (vorne)
- 🤜 Berührungssensor (vorne)
- 2× Motor (links/rechts)
