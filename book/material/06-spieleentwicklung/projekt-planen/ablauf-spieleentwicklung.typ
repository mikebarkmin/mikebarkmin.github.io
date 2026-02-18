#set document(title: "Wie entsteht ein Spiel?")
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

#let phase-block(emoji: "", title: "", color: primary-color, body) = block(
  stroke: 2pt + color.lighten(30%),
  radius: 0.5cm,
  inset: 0.6cm,
  width: 100%,
  below: 0.4cm,
)[
  #grid(
    columns: (auto, 1fr),
    gutter: 0.5cm,
    align: top,
    block(
      fill: color.lighten(70%),
      radius: 0.3cm,
      inset: 0.35cm,
    )[#text(size: 1.8em)[#emoji]],
    [
      #text(weight: "bold", fill: color, size: 1.1em)[#title]
      #v(0.2cm)
      #body
    ],
  )
]

#show heading: set text(fill: primary-color)

= Wie entsteht ein Spiel?

Viele denken, ein Spiel zu entwickeln bedeutet: hinsetzen, programmieren, fertig. In Wirklichkeit steckt dahinter ein langer Prozess, bei dem viele Menschen zusammenarbeiten – und bei dem Code oft erst spät eine Rolle spielt. Ein professionelles Spiel durchläuft mehrere Phasen, die manchmal Monate oder sogar Jahre dauern.

#v(0.4cm)

#phase-block(emoji: "💡", title: "Phase 1: Die Idee", color: rgb("#4A90E2"))[
  Alles beginnt mit einer Frage: Welches Spiel wollen wir machen? Das klingt einfach, ist aber oft die schwierigste Phase. Das Team diskutiert viele Ideen – die meisten davon landen im Papierkorb. Am Ende bleibt ein Konzept übrig: Welches Genre ist es? Was macht das Spiel besonders? Wer soll es spielen? Diese Fragen werden in einem kurzen Dokument festgehalten, dem sogenannten *Pitch*. Beim Studio hinter Minecraft dauerte es nur wenige Tage, bis die erste Idee stand. Bei anderen Spielen kann diese Phase Wochen dauern, weil sich das Team nicht einigen kann.
]

#phase-block(emoji: "📋", title: "Phase 2: Das Design-Dokument", color: rgb("#7B68EE"))[
  Bevor irgendjemand programmiert, schreibt das Team ein ausführliches Design-Dokument – manchmal hunderte Seiten lang. Darin steht alles: Wie funktioniert die Steuerung? Wie sehen die Level aus? Welche Gegner gibt es? Welche Musik läuft im Hintergrund? Das klingt bürokratisch, ist aber wichtig – denn wenn später 50 Personen an einem Spiel arbeiten, müssen alle wissen, was das Ziel ist. Game Designerinnen und Game Designer verbringen einen Großteil ihrer Arbeitszeit genau hier: mit Schreiben, Zeichnen und Planen.
]

#phase-block(emoji: "🔨", title: "Phase 3: Der Prototyp", color: rgb("#E2844A"))[
  Jetzt wird zum ersten Mal etwas gebaut – aber noch kein richtiges Spiel. Ein Prototyp ist eine schnelle, oft hässliche Version, die nur eine einzige Frage beantworten soll: Macht das überhaupt Spaß? Die Grafik ist egal, die Musik fehlt, Fehler sind überall. Aber wenn das Team nach zehn Minuten Testen lacht und weiterspielen will, ist das ein gutes Zeichen. Wenn nicht, wird die Idee verändert oder manchmal komplett weggeworfen. Viele große Studios werfen in dieser Phase mehrere Prototypen weg, bevor sie weitermachen.
]

#phase-block(emoji: "⚙️", title: "Phase 4: Die Entwicklung", color: rgb("#4AA890"))[
  Jetzt beginnt die eigentliche Arbeit – und sie dauert am längsten. Programmiererinnen und Programmierer schreiben den Code, Artists zeichnen die Figuren und Welten, Sound Designer komponieren die Musik und Soundeffekte. Alle arbeiten gleichzeitig, und täglich entstehen neue Probleme: Ein Feature funktioniert nicht wie geplant, ein Level fühlt sich langweilig an, die Steuerung reagiert zu langsam. Diese Phase heißt auch *Production* und kann bei großen Spielen wie GTA oder The Legend of Zelda mehrere Jahre dauern. Kleinere Indie-Spiele schaffen es manchmal in wenigen Monaten.
]

#phase-block(emoji: "🐛", title: "Phase 5: Testen und Verbessern", color: rgb("#A84A6E"))[
  Kurz vor dem Ende kommt eine Phase, die viele unterschätzen: das Testen. Sogenannte *Tester* spielen das Spiel stundenlang – nicht zum Spaß, sondern um Fehler zu finden. Sie dokumentieren jeden Absturz, jede kaputte Animation, jede Stelle im Spiel, die unfair oder verwirrend wirkt. Die Programmiererinnen und Programmierer beheben diese Fehler, und danach wird erneut getestet. Dieser Kreislauf wiederholt sich so oft, bis das Spiel stabil genug ist. Bei großen Spielen werden manchmal tausende Fehler gefunden und behoben – bevor das Spiel überhaupt erscheint.
]

#phase-block(emoji: "🚀", title: "Phase 6: Veröffentlichung und danach", color: rgb("#ba7720"))[
  Das Spiel erscheint – aber die Arbeit ist noch nicht vorbei. Spielerinnen und Spieler finden Fehler, die beim Testen übersehen wurden. Sie wünschen sich neue Inhalte oder beschweren sich über bestimmte Stellen. Das Team veröffentlicht *Updates* und *Patches*, um das Spiel zu verbessern. Manche Spiele werden über Jahre hinweg weiterentwickelt – Minecraft zum Beispiel bekommt bis heute regelmäßig neue Inhalte, obwohl es bereits 2011 erschienen ist.
]

#v(0.4cm)

// Aufgabe
#block(
  fill: primary-color.lighten(85%),
  stroke: 1.5pt + primary-color.lighten(40%),
  radius: 0.4cm,
  inset: 0.5cm,
  width: 100%,
)[
  #text(weight: "bold", fill: primary-color)[✏️ Deine Aufgabe]
  #v(0.2cm)
  #grid(
    columns: (1fr, 1fr),
    gutter: 0.5cm,
    [
      *1. Markiere im Text:* Unterstreiche grün, was dich überrascht hat. Unterstreiche rot, was du dir anders vorgestellt hast.
    ],
    [
      *2. Ein Satz:* Die Phase, die mich am meisten interessiert, ist 
      #v(0.2cm)
    #line(length: 100%, stroke: 0.5pt)
      #v(0.3cm)
      weil #line(length: 100%, stroke: 0.5pt)
      #v(0.3cm)
      #line(length: 100%, stroke: 0.5pt)
    ],
  )
]

