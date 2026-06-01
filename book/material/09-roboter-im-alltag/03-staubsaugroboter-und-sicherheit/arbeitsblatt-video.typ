#let C-ACC  = rgb("#b71c1c")
#let C-LITE = rgb("#fce4ec")
#let C-DARK = rgb("#212121")
#let C-GREY = rgb("#9e9e9e")
#let C-BLUE = rgb("#0d47a1")

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

#let infobox(color: rgb("#e3f2fd"), title: none, content) = block(
  fill: color, width: 100%,
  inset: 0.8em, radius: 6pt,
  stroke: (left: 4pt + C-BLUE),
)[
  #if title != none [#text(weight: "bold")[#title \ ]]
  #content
]

// ─── Dokument ─────────────────────────────────────────────────────────────────
#ab-header("📹", "Videoanalyse – DJI-Sicherheitslücke")

// ── Teil A: Während des Videos ────────────────────────────────────────────────
#section("Teil A – Während des Videos: Notiert euch …")

*1. Welche Daten konnte der Entwickler sehen? Nennt mindestens vier.*
#answer-lines(2)

*2. Wie viele Geräte wurden betroffen?*
#answer-lines(1)

*3. War die Übertragung der Daten verschlüsselt?*
#grid(columns: (auto, auto, 1fr), gutter: 1em,
  [☐ Ja], [☐ Nein], [],
)

*4. Was ist MQTT? Erklärt es mit eigenen Worten.*
#answer-lines(3)

// ── Teil B: Nach dem Video ────────────────────────────────────────────────────
#section("Teil B – Analysiert die Sicherheitslücke")

*5. Wo lag die eigentliche Sicherheitslücke? Erklärt in einem Satz.*
#answer-lines(2)

*6. Was sind Access Control Lists (ACL)? Wofür hätten sie gesorgt?*
#answer-lines(2)

*7. Wie erklärt das Video das Problem mit einem Vergleich? Beschreibt ihn.*
#answer-lines(3)

// ── Teil C: Folgen & Bewertung ────────────────────────────────────────────────
#section("Teil C – Folgen und Bewertung")

*8. Welche Folgen könnten die sichtbaren Daten für Betroffene haben? Nennt zwei Beispiele.*
#answer-lines(3)

*9. Wie hat DJI reagiert? Bewerte die Reaktion.*
#answer-lines(3)

*10. Was hätte DJI von Anfang an besser machen können?*
#answer-lines(3)

// ── Teil D: Transfer ──────────────────────────────────────────────────────────
#section("Teil D – Transfer: Was bedeutet das für euch?")

*11. Würdet ihr nach diesem Video noch einen DJI-Staubsaugroboter kaufen? Begründet.*
#answer-lines(3)

*12. Was könnt ihr als Verbraucher:in tun, um euch zu schützen?*
#answer-lines(3)

#v(0.5em)
#block(fill: C-LITE, inset: 0.8em, radius: 6pt, stroke: (left: 4pt + C-ACC))[
  #text(weight: "bold", fill: C-ACC)[🔑 Drei Lehren aus dem Fall (nach dem Video):]
  #v(0.3em)
  #grid(columns: (auto, 1fr), gutter: 0.5em,
    [1.], answer-lines(1),
    [2.], answer-lines(1),
    [3.], answer-lines(1),
  )
]
