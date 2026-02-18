#set document(title: "Die Geschichte der Spieleentwicklung")
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

#let milestone-block(year: "", emoji: "", title: "", color: primary-color, body) = block(
  stroke: 2pt + color.lighten(30%),
  radius: 0.4cm,
  inset: 0pt,
  width: 100%,
  clip: true,
)[
  #grid(
    columns: (2.2cm, auto, 1fr),
    gutter: 0cm,
    align: top,
    // Jahr-Badge
    block(
      fill: color,
      inset: (x: 0.4cm, y: 0.5cm),
      width: 100%,
    )[
      #set text(fill: white, weight: "bold", size: 1.05em)
      #align(center)[#year]
    ],
    // Emoji-Streifen
    block(
      fill: color.lighten(60%),
      inset: (x: 0.3cm, y: 0.5cm),
    )[
      #align(center)[#text(size: 1.5em)[#emoji]]
    ],
    // Inhalt
    block(
      inset: 0.5cm,
      width: 100%,
    )[
      #text(weight: "bold", fill: color)[#title]
      #v(0.15cm)
      #body
    ],
  )
]

#show heading: set text(fill: primary-color)

= Die Geschichte der Spieleentwicklung

Heute gibt es Milliarden von Spielerinnen und Spielern weltweit, und die Spielebranche macht mehr Umsatz als Hollywood und die Musikindustrie zusammen. Das war nicht immer so. Alles begann mit einem einfachen Experiment an einer Universität – und einem blinkenden Punkt auf einem Bildschirm.

#v(0.5cm)

#milestone-block(year: "1958", emoji: "🎾", title: "Der erste Schritt – Tennis for Two", color: rgb("#4A90E2"))[
  Ein Physiker namens William Higinbotham bastelte an einem Oszilloskop – einem Messgerät für elektrische Signale – und programmierte ein einfaches Tennisspiel darauf. Zwei Spieler konnten einen Punkt hin- und herschicken. Es war kein Produkt, keine Erfindung, nur ein Experiment. Dennoch gilt es als eines der ersten interaktiven Spiele überhaupt. Die meisten Menschen, die es damals sahen, hatten keine Ahnung, was daraus eines Tages werden würde.
]

#v(0.3cm)

#milestone-block(year: "1972", emoji: "🕹️", title: "Pong – das erste kommerzielle Spiel", color: rgb("#7B68EE"))[
  Das Unternehmen Atari veröffentlichte *Pong* – ein simples Tischtennis-Spiel mit zwei Strichen und einem Quadrat. Es war das erste Videospiel, das kommerziell erfolgreich war. Automaten standen in Kneipen und Spielhallen, und die Menschen warteten Schlange, um 25 Cent einzuwerfen. Damit begann die Spielebranche als echtes Geschäft. Atari wurde in den folgenden Jahren zum wertvollsten Unterhaltungsunternehmen der USA.
]

#v(0.3cm)

#milestone-block(year: "1985", emoji: "🍄", title: "Super Mario Bros. – Spiele werden zu Kunst", color: rgb("#E2844A"))[
  Nintendo veröffentlichte *Super Mario Bros.* für die Heimkonsole NES. Das Spiel zeigte zum ersten Mal, dass Videospiele mehr sein konnten als eine technische Spielerei: Es gab eine Welt zu erkunden, Geheimnisse zu entdecken, eine Figur, mit der man mitfiebert. Designer Shigeru Miyamoto baute Ideen ein, die bis heute in fast jedem Spiel stecken – zum Beispiel, dass ein Spiel am Anfang einfach ist und langsam schwieriger wird. Super Mario Bros. rettete die Spielebranche, die nach dem großen Videospielcrash 1983 fast zusammengebrochen war.
]

#v(0.3cm)

#milestone-block(year: "1993", emoji: "🔫", title: "Doom – die Geburt des 3D-Spiels", color: rgb("#A84A6E"))[
  Das Studio id Software veröffentlichte *Doom* – ein Spiel, das die Welt aus der Ego-Perspektive zeigte, dreidimensional und rasend schnell. Das war damals eine technische Sensation. Doom lief auf fast jedem Computer, und Millionen luden es kostenlos herunter – eines der ersten erfolgreichen Spiele, das digital verteilt wurde. Es legte den Grundstein für das Genre der Ego-Shooter und bewies, dass kleine unabhängige Studios genauso wichtig sein können wie große Unternehmen.
]

#v(0.3cm)

#milestone-block(year: "2000", emoji: "🌐", title: "Online-Spiele verändern alles", color: rgb("#4AA890"))[
  Mit dem Internet änderte sich, wie Menschen spielten. Spiele wie *Counter-Strike* oder später *World of Warcraft* brachten Millionen von Spielerinnen und Spielern zusammen – nicht mehr im selben Zimmer, sondern über die ganze Welt verteilt. Plötzlich war ein Spiel nie wirklich fertig: Es wurde ständig aktualisiert, neue Inhalte kamen hinzu, und eine Gemeinschaft bildete sich rund um jedes Spiel. Das Modell, das wir heute von Fortnite oder League of Legends kennen, hat seine Wurzeln in dieser Zeit.
]

#v(0.3cm)

#milestone-block(year: "2011", emoji: "⛏️", title: "Minecraft – jeder kann ein Spieleentwickler sein", color: rgb("#ba7720"))[
  *Minecraft* wurde von einem einzelnen Entwickler namens Markus Persson in seiner Freizeit programmiert – zunächst ohne Budget, ohne Team, ohne Verlag. Es sah grob und pixelig aus, aber es ließ die Spieler alles bauen, was sie wollten. Das Spiel wurde zum meistverkauften Videospiel aller Zeiten. Minecraft zeigte, dass gute Ideen wichtiger sind als aufwendige Grafik, und inspirierte eine ganze Generation junger Menschen, selbst Spiele zu entwickeln. Heute gibt es tausende sogenannte *Indie-Spiele* – kleine Spiele von kleinen Teams oder Einzelpersonen.
]

#v(0.3cm)

#milestone-block(year: "Heute", emoji: "🤖", title: "KI verändert die Spieleentwicklung", color: rgb("#4A90E2"))[
  Künstliche Intelligenz hält Einzug in die Spieleentwicklung. KI-Werkzeuge helfen Entwicklerinnen und Entwicklern dabei, Grafiken zu erstellen, Texte zu schreiben oder Fehler im Code zu finden – Aufgaben, für die früher viele Fachleute nötig waren. Gleichzeitig verändert KI auch das Spielerlebnis selbst: Figuren im Spiel können sich intelligenter verhalten, auf Sprache reagieren oder sich an den Spielstil anpassen. Wie sich das auf Berufe in der Branche auswirken wird, ist noch offen – fest steht nur, dass sich gerade sehr viel verändert.
]

#v(0.5cm)

// Aufgaben
#block(
  fill: primary-color.lighten(85%),
  stroke: 1.5pt + primary-color.lighten(40%),
  radius: 0.4cm,
  inset: 0.5cm,
  width: 100%,
)[
  #text(weight: "bold", fill: primary-color, size: 1.1em)[✏️ Aufgaben]
  #v(0.3cm)

  // Aufgabe 1
  #block(
    fill: white,
    radius: 0.3cm,
    inset: 0.4cm,
    width: 100%,
  )[
    #text(weight: "bold")[Aufgabe 1 🖍️ Markieren]
    #v(0.15cm)
    Lies den Text.
    #v(0.05cm)
    Unterstreiche #text(fill: rgb("#2e7d32"), weight: "bold")[grün]: Was hat dich überrascht?
    #v(0.05cm)
    Unterstreiche #text(fill: rgb("#c62828"), weight: "bold")[rot]: Was hättest du nicht gedacht?
  ]

  #v(0.3cm)

  // Aufgabe 2
  #block(
    fill: white,
    radius: 0.3cm,
    inset: 0.4cm,
    width: 100%,
  )[
    #text(weight: "bold")[Aufgabe 2 ⭐ Dein Liebling]
    #v(0.15cm)
    Welches Spiel aus dem Text findest du am coolsten?
    #v(0.2cm)
    Ich finde *#box(width: 4cm, line(length: 100%, stroke: 0.5pt))* am coolsten,
    #v(0.15cm)
    weil #line(length: 100%, stroke: 0.5pt)
    #v(0.15cm)
    #line(length: 100%, stroke: 0.5pt)
  ]

  #v(0.3cm)

  // Aufgabe 3
  #block(
    fill: white,
    radius: 0.3cm,
    inset: 0.4cm,
    width: 100%,
  )[
    #text(weight: "bold")[Aufgabe 3 🎮 Dein Spiel]
    #v(0.15cm)
    Denk an deine eigene Spielidee.
    #v(0.05cm)
    Welches Spiel aus der Geschichte ähnelt deiner Idee am meisten?
    #v(0.2cm)
    Mein Spiel ähnelt *#box(width: 4cm, line(length: 100%, stroke: 0.5pt))*,
    #v(0.15cm)
    weil #line(length: 100%, stroke: 0.5pt)
    #v(0.15cm)
    #line(length: 100%, stroke: 0.5pt)
  ]

  #v(0.3cm)

  // Aufgabe 4
  #block(
    fill: white,
    radius: 0.3cm,
    inset: 0.4cm,
    width: 100%,
  )[
    #text(weight: "bold")[Aufgabe 4 🚀 Die Zukunft]
    #v(0.15cm)
    Die Spielegeschichte ist noch nicht fertig. Was kommt als nächstes?
    #v(0.2cm)
    Das nächste große Spiel wird #line(length: 100%, stroke: 0.5pt)
    #v(0.15cm)
    #line(length: 100%, stroke: 0.5pt)
  ]
]
