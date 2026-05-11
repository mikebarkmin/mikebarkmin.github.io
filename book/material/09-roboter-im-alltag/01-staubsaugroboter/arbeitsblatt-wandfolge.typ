#import "@preview/cetz:0.4.2": canvas, draw

#let C-ACC = rgb("#2e7d32")  // dunkelgrün
#let C-LITE = rgb("#e8f5e9")
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
#ab-header("🧱", "Strategie 4: Wandfolge (Wall-Following)")

// ── Erklärung + Grafik ───────────────────────────────────────────────────────
#grid(
  columns: (1fr, 5.5cm),
  gutter: 1em,
  align: top,
  [
    #section("Was ist diese Strategie?")
    Der Roboter *folgt der Wand* mit einem konstanten Abstand.
    Er hält sich dabei immer an die *rechte* (oder linke) Wand.

    Durch konzentrische Rechtecke arbeitet er sich
    von außen nach innen vor – ähnlich wie bei der Spirale,
    aber gesteuert durch den *Abstandssensor* statt durch Encoder.

    Dieses Prinzip wird auch *Right-Hand-Rule* genannt und
    ist aus der Labyrinthnavigation bekannt.

    #v(0.3em)
    *Schwierigkeit:* ⭐⭐⭐ (anspruchsvoll)
    *Sensoren:* Ultraschall (seitlich + vorne)
  ],
  [
    #text(weight: "bold")[Bewegungsmuster]
    #v(0.3em)
    #canvas(length: 0.75cm, {
      let C = rgb("#2e7d32")
      let CD = rgb("#a5d6a7")
      draw.rect((0, 0), (7, 5.5), stroke: 2pt)
      draw.content((3.5, -0.4), text(size: 7pt, fill: rgb("#757575"))[Raum])
      let rects = (
        (0.4, 0.4, 6.6, 5.0),
        (1.2, 1.2, 5.8, 4.2),
        (2.0, 2.0, 5.0, 3.4),
        (2.8, 2.8, 4.2, 2.8),
      )
      let colors = (C, C.lighten(25%), C.lighten(45%), C.lighten(60%))
      for i in range(rects.len()) {
        let r = rects.at(i)
        let col = colors.at(i)
        let pts = (
          (r.at(0), r.at(3)),
          (r.at(2), r.at(3)),
          (r.at(2), r.at(1)),
          (r.at(0), r.at(1)),
        )
        for j in range(pts.len()) {
          let from = pts.at(j)
          let to = pts.at(calc.rem(j + 1, pts.len()))
          draw.line(from, to, stroke: (paint: col, thickness: 1.3pt), mark: (end: ">"))
        }
      }
      draw.circle((0.4, 5.0), radius: 0.22, fill: rgb("#e65100"), stroke: none)
      draw.content((0.8, 4.65), text(size: 7pt, fill: rgb("#e65100"))[Start])
      draw.line((0.4, 0.4), (1.2, 1.2), stroke: (paint: CD, thickness: 0.8pt, dash: "dashed"))
      draw.line((1.2, 1.2), (2.0, 2.0), stroke: (paint: CD, thickness: 0.8pt, dash: "dashed"))
      draw.line((2.0, 2.0), (2.8, 2.8), stroke: (paint: CD, thickness: 0.8pt, dash: "dashed"))
      draw.circle((3.5, 2.8), radius: 0.18, fill: C, stroke: none)
    })
  ],
)

// ── Algorithmus ───────────────────────────────────────────────────────────────
#section("Algorithmus – Schritt für Schritt")
#step("1", [*Fahre* an die Wand heran, stoppe bei Soll-Abstand (z.B. 10 cm)])
#step("2", [*Drehe* 90° (die Wand ist jetzt rechts vom Roboter)])
#step("3", [*Fahre* geradeaus und *halte den Abstand* zur rechten Wand konstant])
#step("4", [*Ecke erkannt* (vorderer Sensor < Schwellwert): Drehe 90° nach links])
#step("5", [*Innen-Kurve* (keine Wand mehr rechts): Drehe 90° nach rechts, fahre Versatz])
#step("6", [Wiederhole ab Schritt 3, bis der Raum vollständig abgefahren ist])

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
  [Funktioniert auch in unbekannten Räumen], [Braucht zwei Ultraschallsensoren],
  [Reagiert flexibel auf Hindernisse], [#blank(w: 5cm)],
  [#blank(w: 5cm)], [#blank(w: 5cm)],
)

// ── EV3-Umsetzung ─────────────────────────────────────────────────────────────
#section("EV3-Umsetzung")
*Sensoren:*
- 📡 Ultraschall vorne
- 📡 Ultraschall seitlich (rechts)
- 2× Motor (links/rechts)
