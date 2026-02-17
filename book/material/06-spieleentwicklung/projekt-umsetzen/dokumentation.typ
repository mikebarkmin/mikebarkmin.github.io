// Dokumentation – Scratch-Projekt

#set document(title: "Deine Spielidee umsetzen")
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
#set page(paper: "a4", margin: (x: 2.5cm, y: 2.5cm))
#set text(font: "Fira Sans")

// Farbpalette für freundlicheres Design
#let primary-color = rgb("#4A90E2")  // Freundliches Blau
#let accent-color = rgb("#ba7720")   // Frisches Grün

// ── Styles ──────────────────────────────────────────────────────────────────
#let section-title(body) = {
  set text(size: 14pt, weight: "bold")
  block(above: 1em, below: 0.4em, body)
}

#let label-line(label, width: 6cm) = {
  label + " " + box(width: width, line(length: 100%, stroke: 0.5pt))
}

#let checkbox-item(body) = {
  "☐ " + body
}

#let lined-box(num: 2, spacing: 0.8cm, stroke: 0pt) = {
  let total-height = num * spacing
  block(
    width: 100%,
    height: total-height,
    inset: 0cm,
    stroke: stroke,
  )[
    #v(spacing, weak: false)
    #for i in range(num) [
      #v(spacing, weak: true)
      #line(length: 100%, stroke: 0.5pt + gray)
    ]
  ]
}

#let reflection-block(stunde) = {
  block(
    width: 100%,
    stroke: 2pt + accent-color.lighten(30%),
    radius: 4pt,
    height: 1fr,
    inset: 12pt,
    [
      == #stunde

      === 🎯 Unser Ziel für die Stunde

      #text(
        size: 9pt,
      )[(Hier kannst du das Ziel der Stunde eintragen, z.B. "Ich möchte die Kostüme meiner Figuren anpassen können.")]

      #lined-box(num: 3, spacing: 1cm)

      #v(6em)

      === 🔍 Reflexion #text(size: 9pt)[(bitte am Ende der Stunde ankreuzen)]

      #v(0.5em)
      *Wir haben unser Ziel erreicht:* 😊 😐 😞 😡

      #v(0.5em)
      #grid(
        columns: (1fr, 1fr),
        gutter: 1em,
        [
          *Was lief gut?* #text(size: 9pt)[(Wähle aus oder schreibe selbst)]

          #v(0.3em)
          #checkbox-item[Wir haben gut zusammengearbeitet.] \
          #checkbox-item[Wir haben das Ziel erreicht.] \
          #checkbox-item[Wir haben neue Blöcke ausprobiert.] \
          #checkbox-item[Wir haben eine kreative Idee gehabt.] \
          Etwas anderes: #lined-box(num: 2, spacing: 1cm)
        ],
        [
          *Was war schwierig?*

          #v(0.3em)
          #checkbox-item[Die Blöcke zu verstehen.] \
          #checkbox-item[Die Figur richtig zu steuern.] \
          #checkbox-item[Einen Fehler zu finden.] \
          #v(0.8em)
          Etwas anderes: #lined-box(num: 2, spacing: 1cm)
        ],
      )

      #v(0.5em)
      *Was wollen wir in der nächsten Stunde besser machen?*

      #text(
        size: 9pt,
      )[Was können wir tun, damit es besser läuft? Was wollen wir nächstes Mal erreichen? Wobei brauchen wir vielleicht Hilfe?]


      #v(0.3em)
      #lined-box(num: 4, spacing: 1cm)
    ],
  )
}

= Dokumentation des Scratch-Projekts
#v(1em)
#block(
  stroke: 2pt + primary-color.lighten(30%),
  radius: 4pt,
  inset: 0.5cm,
)[
  == Name des Spiels

  #text(size: 11pt, fill: gray)[
    Wie heißt dein Spiel? (Du kannst den Namen später auch noch ändern)
  ]
  #lined-box(num: 1, spacing: 1cm)
]

#block(
  stroke: 2pt + primary-color.lighten(60%),
  radius: 4pt,
  inset: 0.5cm,
)[
  == Basisspiel

  #text(size: 11pt, fill: gray)[Welches Spiel aus dem Game-Center hast du ausgewählt?]
  #lined-box(num: 1, spacing: 1cm)
]

#block(
  width: 100%,
  height: 1fr,
  stroke: 2pt + primary-color.lighten(30%),
  radius: 4pt,
  inset: 12pt,
  [
    == Cover zu dem Spiel

    #text(
      size: 11pt,
      fill: gray,
    )[Zeichne ein Cover zu deinem Spiel. Das kannst du auch später noch machen, z.B. wenn dein Spiel schon etwas weiter entwickelt ist.]
  ],
)

#pagebreak()

#block(
  width: 100%,
  height: 1fr,
  stroke: 2pt + primary-color.lighten(30%),
  radius: 4pt,
  inset: 12pt,
  [
    == Notizen

    #text(size: 11pt, fill: gray)[Hier ist Platz für Notizen, Skizzen oder ähnliches.]
  ],
)

// ═══════════════════════════════════════════════════════════════════════════
// PAGE 4 – Stunde 1
// ═══════════════════════════════════════════════════════════════════════════
#pagebreak()
#reflection-block("Stunde 1")

// ═══════════════════════════════════════════════════════════════════════════
// PAGE 5 – Stunde 2
// ═══════════════════════════════════════════════════════════════════════════
#pagebreak()
#reflection-block("Stunde 2")

// ═══════════════════════════════════════════════════════════════════════════
// PAGE 6 – Stunde 3
// ═══════════════════════════════════════════════════════════════════════════
#pagebreak()
#reflection-block("Stunde 3")

#pagebreak()

#block(
  width: 100%,
  height: 1fr,
  stroke: 2pt + accent-color.lighten(30%),
  radius: 4pt,
  inset: 12pt,
)[
  #section-title[🧪 Testphase]

  #v(0.5em)

  #text(size: 10pt)[
    Tauscht euer Gerät mit einer anderen Gruppe. Die andere Gruppe spielt euer Spiel und gibt euch Feedback.
  ]

  #v(1em)

  // ── Feedback von Tester*in ───────────────────────────────────────────────
  *Feedback von:* #box(width: 1fr, line(length: 100%, stroke: 0.5pt))

  #v(1em)

  *Getestetes Spiel:* #box(width: 1fr, line(length: 100%, stroke: 0.5pt))

  #v(1em)

  *Wie war das Spielerlebnis?*
  #h(0.5em)😊 Toll #h(1em) 😐 Ok #h(1em) 😞 Schwierig #h(1em) 😡 Frustrierend

  #v(1em)

  #grid(
    columns: (1fr, 1fr),
    gutter: 1em,
    [
      *Was hat gut funktioniert?*
      #lined-box(num: 3, spacing: 1cm)
    ],
    [
      *Was war verwirrend oder kaputt?*
      #lined-box(num: 3, spacing: 1cm)
    ],
  )

  #v(1em)

  *Mein bester Tipp für die Entwickler:*
  #lined-box(num: 3, spacing: 1cm)

  #v(1fr)

  // Vom Entwickler auszufüllen
  
  #line(length: 100%, stroke: 4pt)

  #text(size: 11pt)[Jetzt seid ihr wieder an der Reihe! Was nehmt ihr euch aus dem Feedback mit? Was wollt ihr noch verbessern?]

  // ── Reaktion der Entwickler ──────────────────────────────────────────────
  #section-title[💡 Was nehmen wir mit?]

  #text(size: 10pt, fill: gray)[Was wollt ihr nach dem Feedback noch verbessern?]

  #lined-box(num: 4, spacing: 1cm)
]
// ═══════════════════════════════════════════════════════════════════════════
// PAGE 7 – Bewertung (2×, for two students)
// ═══════════════════════════════════════════════════════════════════════════
#let bewertung-block = {
  block(
    width: 100%,
    stroke: 2pt + accent-color.lighten(30%),
    height: 1fr,
    radius: 4pt,
    inset: 12pt,
    [
      = Bewertung
      #v(0.5em)
      #text(size: 9pt)[Die Tabelle wird am Ende vom Lehrer ausgefüllt]

      #v(0.5em)

      *Schüler*in*: #box(width: 1fr, line(length: 100%, stroke: 0.5pt))

      #v(1.0em)

      *Spiel*: #box(width: 1fr, line(length: 100%, stroke: 0.5pt))

      #v(2em)

      #table(
        columns: (1fr, auto),
        stroke: 0.5pt + gray,
        inset: 12pt,
        align: (left, center),
        [Es wurden immer Ziele gesetzt und an diesen gearbeitet.], [🥳 😊 😐 😞 😡],
        [Es wurde immer die Reflexion angemessen ausgefüllt.], [🥳 😊 😐 😞 😡],
        [In den Stunden wurde konzentriert gearbeitet.], [🥳 😊 😐 😞 😡],
        [Es wurde abwechselnd programmiert.], [🥳 😊 😐 😞 😡],
        [Es wurden eigene Ideen im Projekt umgesetzt.], [🥳 😊 😐 😞 😡],
        [Das Projekt ist ansprechend gestaltet und funktioniert ohne Fehler.], [🥳 😊 😐 😞 😡],
        [Es wurde versucht Probleme eigenständig zu lösen.], [🥳 😊 😐 😞 😡],
        [In der Testphase wurde angemessenes Feedback gegeben.], [🥳 😊 😐 😞 😡],
        [Die Abschlusspräsentation des Projekts war verständlich und es wurde auf Nachfragen angemessen eingegangen.],
        [🥳 😊 😐 😞 😡],
      )

      #v(2em)

      == Note
    ],
  )
}

#pagebreak()
#bewertung-block
