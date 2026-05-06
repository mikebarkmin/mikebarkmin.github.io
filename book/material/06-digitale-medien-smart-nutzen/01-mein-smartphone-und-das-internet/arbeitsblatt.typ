#import "@preview/cetz:0.3.2": canvas, draw

#set document(title: "Mein Smartphone und das Internet")
#set page(
  paper: "a4",
  margin: (x: 1.5cm, y: 2.5cm),
  header: [
    #set text(size: 9pt, font: "Fira Sans")
    #grid(
      columns: (1fr, 1fr),
      align: (left, right),
      [Informatik – Klasse 6],
      [Name: #box(width: 5cm, line(length: 100%, stroke: 0.5pt))],
    )
    #v(0.15cm)
    #line(length: 100%, stroke: 0.5pt + luma(180))
  ],
  footer: [
    #line(length: 100%, stroke: 0.5pt + luma(180))
    #v(0.1cm)
    #set text(size: 8pt, font: "Fira Sans")
    #grid(
      columns: (1fr, 1fr),
      align: (left, right),
      [Mein Smartphone und das Internet],
      [Mike Barkmin | CC-BY-SA],
    )
  ],
)
#set text(font: "Fira Sans", size: 10pt)

#let primary = rgb("#1565C0")

// ── Titel ────────────────────────────────────────────────────────────────────
= Das Smartphone und das Internet

== 1. Über mich und mein Smartphone

// ── Obere Hälfte: Smartphone (links) und Kopf (rechts) ───────────────────────
#grid(
  columns: (1fr, 1fr),
  gutter: 1cm,

  // ── Links: Smartphone ──
  block(
    radius: 0.3cm,
    inset: (x: 0.4cm, y: 0.4cm),
    width: 100%,
  )[
    #align(center)[
      #text(size: 9.5pt, fill: primary, weight: "bold")[
        Welche Apps kennst oder nutzt du?\
        Male die Icons in das Smartphone!
      ]
      #v(0.4cm)
      #canvas(length: 1cm, {
        import draw: *
        let w = 4.0
        let h = 7.2

        // Gehäuse
        rect((0, 0), (w, h), radius: 0.48, stroke: 2pt + black, fill: white)

        // Dynamic Island (Pille oben)
        rect(
          ((w - 1.0) / 2, h - 0.62),
          ((w + 1.0) / 2, h - 0.32),
          radius: 0.15,
          stroke: none,
          fill: black,
        )

        // Bildschirm
        let sx1 = 0.20
        let sx2 = w - 0.20
        let sy1 = 0.52
        let sy2 = h - 0.80
        rect((sx1, sy1), (sx2, sy2), stroke: 0.5pt + luma(200), fill: luma(252))

        // App-Raster 3×4
        let cw = (sx2 - sx1) / 3
        let ch = (sy2 - sy1) / 4
        for i in range(1, 3) {
          line(
            (sx1 + i * cw, sy1),
            (sx1 + i * cw, sy2),
            stroke: 0.7pt + luma(212),
          )
        }
        for i in range(1, 4) {
          line(
            (sx1, sy1 + i * ch),
            (sx2, sy1 + i * ch),
            stroke: 0.7pt + luma(212),
          )
        }

        // Home-Bar
        rect(
          ((w - 1.1) / 2, 0.16),
          ((w + 1.1) / 2, 0.34),
          radius: 0.09,
          stroke: none,
          fill: luma(90),
        )
      })
    ]
  ],

  // ── Rechts: Kopf ──
  block(
    radius: 0.3cm,
    inset: (x: 0.4cm, y: 0.4cm),
    width: 100%,
  )[
    #align(center)[
      #text(size: 9.5pt, fill: primary, weight: "bold")[
        Wie siehst du aus?\
        Gestalte den Kopf, sodass er dir ähnelt!
      ]
      #v(0.4cm)
      #canvas(length: 1cm, {
        import draw: *
        let cx = 3.2
        let cy = 4.9
        let r  = 2.1

        // Kopf
        circle((cx, cy), radius: r, stroke: 1.8pt + black, fill: white)

        // Hals
        let nw = 0.42
        line((cx - nw, cy - r),      (cx - nw, cy - r - 0.75), stroke: 1.6pt + black)
        line((cx + nw, cy - r),      (cx + nw, cy - r - 0.75), stroke: 1.6pt + black)
        line((cx - nw, cy - r - 0.75), (cx + nw, cy - r - 0.75), stroke: 1.6pt + black)

        // Schultern
        line(
          (cx - nw, cy - r - 0.75),
          (cx - nw - 1.55, cy - r - 1.40),
          stroke: 1.6pt + black,
        )
        line(
          (cx + nw, cy - r - 0.75),
          (cx + nw + 1.55, cy - r - 1.40),
          stroke: 1.6pt + black,
        )

      })
    ]
  ],
)

#v(0.45cm)

// ── Untere Hälfte: Foto-Versand ───────────────────────────────────────────────
== 2. Was passiert beim Versenden eines Fotos?

#v(0.3cm)
Person 1 schickt über einen Messenger ein Foto an Person 2.

#text(size: 9.5pt, fill: primary, weight: "bold")[
  Zeichne den Weg des Fotos ein und beschreibe, was dabei passiert!
]
#v(2.05cm)

#canvas(length: 1cm, {
  import draw: *
  let W  = 17.5
  let H  = 7.0
  let hy = H - 0.3
  let hr = 0.44
  let bb = hy - 3.3  // Hüfte / Beinansatz

  // ── Strichmännchen 1 (links) ──────────────────────────────────────────────
  let lx = 1.6

  // Kopf
  circle((lx, hy - hr), radius: hr, stroke: 1.5pt + black, fill: white)
  // Rumpf
  line((lx, hy - 2 * hr), (lx, bb), stroke: 1.5pt + black)
  // Linker Arm (hängt herunter)
  line((lx, hy - 2 * hr - 0.55), (lx - 0.65, bb), stroke: 1.5pt + black)
  // Rechter Arm (hält Handy, zeigt zur Mitte)
  line((lx, hy - 2 * hr - 0.55), (lx + 1.5, hy - 2 * hr - 0.22), stroke: 1.5pt + black)
  // Beine
  line((lx, bb), (lx - 0.55, bb - 1.55), stroke: 1.5pt + black)
  line((lx, bb), (lx + 0.55, bb - 1.55), stroke: 1.5pt + black)

  // Handy (Person 1)
  let p1x = lx + 1.5
  let p1y = hy - 2 * hr - 0.22
  rect(
    (p1x - 0.23, p1y - 0.54),
    (p1x + 0.23, p1y + 0.22),
    radius: 0.04,
    stroke: 1.2pt + black,
    fill: luma(238),
  )
  // Bildschirm mit Foto
  rect(
    (p1x - 0.16, p1y - 0.44),
    (p1x + 0.16, p1y + 0.12),
    stroke: 0.5pt + luma(185),
    fill: rgb("#BBDEFB"),
  )
  // Fotomotiv: Himmel
  rect(
    (p1x - 0.16, p1y - 0.02),
    (p1x + 0.16, p1y + 0.12),
    stroke: none,
    fill: rgb("#90CAF9"),
  )
  // Berg als Dreieck
  line(
    (p1x - 0.16, p1y - 0.02),
    (p1x - 0.01, p1y + 0.10),
    (p1x + 0.10, p1y - 0.02),
    close: true,
    fill: rgb("#A5D6A7"),
    stroke: none,
  )
  // Sonne
  circle((p1x + 0.08, p1y + 0.07), radius: 0.04, fill: rgb("#FFC107"), stroke: none)

  content(
    (lx, hy + 0.28),
    text(size: 8pt, weight: "bold", fill: primary)[Person 1],
  )

  // ── Strichmännchen 2 (rechts) ─────────────────────────────────────────────
  let rx = W - 1.6

  // Kopf
  circle((rx, hy - hr), radius: hr, stroke: 1.5pt + black, fill: white)
  // Rumpf
  line((rx, hy - 2 * hr), (rx, bb), stroke: 1.5pt + black)
  // Rechter Arm (hängt herunter)
  line((rx, hy - 2 * hr - 0.55), (rx + 0.65, bb), stroke: 1.5pt + black)
  // Linker Arm (hält Handy, zeigt zur Mitte)
  line((rx, hy - 2 * hr - 0.55), (rx - 1.5, hy - 2 * hr - 0.22), stroke: 1.5pt + black)
  // Beine
  line((rx, bb), (rx - 0.55, bb - 1.55), stroke: 1.5pt + black)
  line((rx, bb), (rx + 0.55, bb - 1.55), stroke: 1.5pt + black)

  // Handy (Person 2, leerer Bildschirm)
  let p2x = rx - 1.5
  let p2y = hy - 2 * hr - 0.22
  rect(
    (p2x - 0.23, p2y - 0.54),
    (p2x + 0.23, p2y + 0.22),
    radius: 0.04,
    stroke: 1.2pt + black,
    fill: luma(238),
  )
  rect(
    (p2x - 0.16, p2y - 0.44),
    (p2x + 0.16, p2y + 0.12),
    stroke: 0.5pt + luma(185),
    fill: luma(215),
  )

  content(
    (rx, hy + 0.28),
    text(size: 8pt, weight: "bold", fill: primary)[Person 2],
  )
})

#v(0.4cm)
#line(length: 100%, stroke: 0.5pt + luma(185))
#v(0.38cm)
#line(length: 100%, stroke: 0.5pt + luma(185))
#v(0.38cm)
#line(length: 100%, stroke: 0.5pt + luma(185))
#v(0.38cm)
#line(length: 100%, stroke: 0.5pt + luma(185))
