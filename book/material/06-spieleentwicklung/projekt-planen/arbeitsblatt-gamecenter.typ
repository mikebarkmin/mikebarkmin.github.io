#set document(title: "Game-Center erkunden")
#set page(
  paper: "a4",
  margin: (x: 1cm, y: 3cm),
  header: [
    #set text(size: 10pt)
    #grid(
      columns: (1fr, 1fr),
      align: (left, right),
      [Informatik], [Name: #box(width: 5cm, line(length: 100%, stroke: 0.5pt))],
    )
  ],
  footer: [
    #set text(size: 9pt)
    #grid(
      columns: (1fr, 1fr),
      align: (left, right),
      [Version 1.0], [Mike Barkmin CC-BY-SA],
    )
  ],
)
#set text(font: "Fira Sans")

#let primary-color = rgb("#4A90E2")
#let accent-color = rgb("#ba7720")

#let game-card(number: 1, color: primary-color) = block(
  stroke: 2pt + color.lighten(30%),
  radius: 0.5cm,
  inset: 0pt,
  width: 100%,
  clip: true,
  below: 0.5cm,
)[
  // Titelzeile
  #block(
    fill: color.lighten(70%),
    inset: (x: 0.5cm, y: 0.35cm),
    width: 100%,
  )[
    #grid(
      columns: (auto, 1fr, auto),
      gutter: 0.4cm,
      align: horizon,
      block(
        fill: color,
        radius: 0.3cm,
        inset: (x: 0.4cm, y: 0.2cm),
      )[
        #text(fill: white, weight: "bold")[Spiel #number]
      ],
      block(inset: (left: 0.2cm))[
        #text(weight: "bold", fill: color)[Spieltitel: ]
        #box(width: 1fr, line(length: 100%, stroke: 0.5pt + color.lighten(20%)))
      ],
      // Sterne-Bewertung
      block[
        #text(size: 9pt, fill: color.darken(10%))[Meine Bewertung: ]
        #text(fill: rgb("#F59E0B"))[★ ★ ★ ★ ★]
      ],
    )
  ]
  // Inhalt
  #block(
    inset: (x: 0.5cm, y: 0.4cm),
    width: 100%,
  )[
    #grid(
      columns: (1fr, 1fr, 1fr),
      gutter: 0.4cm,
      // Gefallen
      block(
        fill: rgb("#f0faf0"),
        stroke: 1pt + rgb("#a3d9a5"),
        radius: 0.3cm,
        inset: 0.35cm,
        width: 100%,
      )[
        #text(weight: "bold", fill: rgb("#2e7d32"), size: 0.95em)[👍 Hat mir gefallen]
        #v(0.15cm)
        #for i in range(3) {
          line(length: 100%, stroke: 0.5pt + gray)
          v(0.45cm)
        }
      ],
      // Gestört
      block(
        fill: rgb("#fff5f5"),
        stroke: 1pt + rgb("#f5a0a0"),
        radius: 0.3cm,
        inset: 0.35cm,
        width: 100%,
      )[
        #text(weight: "bold", fill: rgb("#c62828"), size: 0.95em)[👎 Hat mich gestört]
        #v(0.15cm)
        #for i in range(3) {
          line(length: 100%, stroke: 0.5pt + gray)
          v(0.45cm)
        }
      ],
      // Verbesserung
      block(
        fill: rgb("#fff8f0"),
        stroke: 1pt + rgb("#f5c580"),
        radius: 0.3cm,
        inset: 0.35cm,
        width: 100%,
      )[
        #text(weight: "bold", fill: rgb("#b45309"), size: 0.95em)[💡 Meine Idee]
        #v(0.15cm)
        #for i in range(3) {
          line(length: 100%, stroke: 0.5pt + gray)
          v(0.45cm)
        }
      ],
    )
  ]
]

#show heading: set text(fill: primary-color)

= Game-Center erkunden

Spiele mindestens *3 verschiedene Spiele* und fülle für jedes Spiel eine Karte aus. Kreise danach dein Lieblingsspiel ein – das kannst du später für die weitere Planung verwenden.

#v(0.4cm)

#game-card(number: 1, color: rgb("#4A90E2"))
#game-card(number: 2, color: rgb("#7B68EE"))
#game-card(number: 3, color: rgb("#4AA890"))
