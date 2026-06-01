#let C-ACC  = rgb("#2e7d32")
#let C-LITE = rgb("#e8f5e9")
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

#let bsi-frage(nr, frage) = {
  v(0.15em)
  grid(
    columns: (auto, 1fr, auto),
    gutter: 0.6em,
    block(fill: C-ACC, inset: (x: 0.5em, y: 0.3em), radius: 4pt)[
      #text(fill: white, weight: "bold", size: 8pt)[#nr]
    ],
    align(horizon)[#frage],
    align(horizon)[☐ wichtig],
  )
  v(0.1em)
}

// ─── Dokument ─────────────────────────────────────────────────────────────────
#ab-header("🛡️", "BSI-Empfehlungen – Sicher einkaufen")

#block(fill: C-LITE, inset: 0.8em, radius: 6pt, stroke: (left: 4pt + C-ACC))[
  Das Bundesamt für Sicherheit in der Informationstechnik (BSI) hat Empfehlungen für den
  Kauf von Staubsaugrobotern veröffentlicht. Lest die Fragen sorgfältig durch und
  bearbeitet dann die Aufgaben.
]

// ── Teil A: BSI-Fragen ────────────────────────────────────────────────────────
#section("Teil A – Die BSI-Fragen (Markiert die 3 wichtigsten mit ☐)")

#bsi-frage("1", [Wie lange sind *Softwareupdates* für das Gerät verfügbar?])
#bsi-frage("2", [Sind Zusatzkomponenten wie eine *Smartphone-App* für die Steuerung notwendig?])
#bsi-frage("3", [Welche *Zugriffsrechte* fordert die App von den Nutzenden ein?])
#bsi-frage("4", [Auf welche Rechte *verzichte* ich, wenn ich die App installiere?])
#bsi-frage("5", [Welche *Daten erhebt* die App?])
#bsi-frage("6", [Welche *Informationen werden abgeleitet* (z.B. Wohnungsgrundriss)?])
#bsi-frage("7", [Was passiert mit den generierten *Daten*? Werden sie geteilt?])
#bsi-frage("8", [Wohin *sendet* die App die Daten?])
#bsi-frage("9", [Wo werden die Daten *gespeichert* bzw. weiterverarbeitet?])
#bsi-frage("10", [Bei Cloud-Speicherung: *Wo stehen die Server*? An welche Rechtslage ist der Betreiber gebunden?])
#bsi-frage("11", [Will ich den Saugroboter *nur offline* verwenden?])

// ── Teil B: Priorisierung ─────────────────────────────────────────────────────
#section("Teil B – Eure Top 3: Begründung")

*Frage Nr. #h(1.5em) ist uns am wichtigsten, weil:*
#answer-lines(2)

*Frage Nr. #h(1.5em) ist uns am zweitwichtigsten, weil:*
#answer-lines(2)

*Frage Nr. #h(1.5em) ist uns am drittwichtigsten, weil:*
#answer-lines(2)

// ── Teil C: Anwendung ─────────────────────────────────────────────────────────
#section("Teil C – Anwendung auf euren Recherche-Roboter")

*Hersteller / Modell:*
#answer-lines(1)

Beantwortet die drei wichtigsten BSI-Fragen für euren Roboter:

#grid(columns: (auto, 1fr), gutter: 0.6em,
  [Frage #text(weight: "bold")[#h(2em)]:], answer-lines(2),
  [Frage #text(weight: "bold")[#h(2em)]:], answer-lines(2),
  [Frage #text(weight: "bold")[#h(2em)]:], answer-lines(2),
)

// ── Teil D: Fazit ─────────────────────────────────────────────────────────────
#section("Teil D – Fazit")

*Würdet ihr euren Roboter nach dem BSI-Check empfehlen? Warum (nicht)?*
#answer-lines(3)

*Was würdet ihr einem Bekannten raten, der einen Staubsaugroboter kaufen möchte?*
#answer-lines(3)
