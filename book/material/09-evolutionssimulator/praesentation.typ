#import "@preview/polylux:0.4.0": slide

#set document(title: "Evolution Simulator", author: "Mike Barkmin")
#set page(paper: "presentation-16-9", margin: 0pt, fill: white)
#set text(font: "Fira Sans", size: 18pt, fill: rgb("#212121"))
#set list(indent: 0.4em, spacing: 0.35em)

#let blue      = rgb("#1565c0")
#let blue-dark = rgb("#0d47a1")
#let blue-lt   = rgb("#e3f2fd")
#let green     = rgb("#2e7d32")
#let green-lt  = rgb("#e8f5e9")
#let amber     = rgb("#e65100")
#let amber-lt  = rgb("#fff3e0")
#let grey      = rgb("#757575")

// ── Komponenten ──────────────────────────────────────────────────────────────

#let pg-head(title) = block(
  fill: blue-dark, width: 100%,
  inset: (x: 1.0em, y: 0.45em),
)[#text(fill: white, size: 22pt, weight: "bold")[#title]]

#let pg-footer = block(
  fill: blue-lt, width: 100%,
  inset: (x: 1.0em, y: 0.3em),
)[#text(fill: grey, size: 11pt)[Evolution Simulator · 45 Minuten]]

#let pg-body(content) = pad(x: 1.0em, top: 0.6em, bottom: 0.3em)[#content]

#let content-slide(title, content) = slide[
  #set page(footer: pg-footer)
  #pg-head(title)
  #pg-body(content)
]

// Karte mit Content-Block als Body
#let card(heading, body, fill: blue-lt, accent: blue) = block(
  fill: fill, radius: 6pt, inset: 0.65em, width: 100%,
  stroke: (left: 4pt + accent),
)[
  #text(weight: "bold", fill: accent, size: 16pt)[#heading]
  #v(0.2em)
  #text(size: 13pt)[#body]
]

// Nummerierter Schritt
#let step(n, heading, body, fill: blue-lt, accent: blue) = block(
  fill: fill, radius: 6pt, inset: 0.6em, width: 100%,
  stroke: (left: 4pt + accent),
)[
  #grid(
    columns: (auto, 1fr), gutter: 0.55em, align: (center + horizon, left + top),
    box(fill: accent, radius: 50pt, inset: (x: 0.5em, y: 0.2em))[
      #text(fill: white, weight: "bold", size: 14pt)[#n]
    ],
    stack(spacing: 0.15em,
      text(weight: "bold", fill: accent, size: 15pt)[#heading],
      text(size: 13pt)[#body],
    ),
  )
]

// ── FOLIE 1 · Titelfolie ─────────────────────────────────────────────────────
#slide[
  #set page(fill: blue-dark)
  #align(center + horizon)[
    #text(fill: rgb("#90caf9"), size: 16pt)[Informatik · Evolution]
    #v(0.4em)
    #text(fill: white, size: 40pt, weight: "bold")[Evolution Simulator]
    #v(0.35em)
    #text(fill: rgb("#bbdefb"), size: 19pt)[Eigene Kreaturen bauen und gegeneinander antreten lassen]
    #v(0.9em)
    #box(fill: rgb("#0f5aa6"), radius: 6pt, inset: (x: 1.0em, y: 0.4em))[
      #text(fill: white, size: 14pt)[🔗 keiwan.itch.io/evolution]
    ]
  ]
]

// ── FOLIE 2 · Motivation ─────────────────────────────────────────────────────
#slide[
  #set page(fill: rgb("#1a1a1a"))
  #align(center + horizon)[
    #text(fill: white, size: 22pt, weight: "bold")[Was entsteht, wenn Kreaturen sich entwickeln …]
    #v(0.5em)
    #image("gallerie.png", width: 97%)
  ]
]

// ── FOLIE 3 · Ziel & Ablauf ──────────────────────────────────────────────────
#content-slide("Ziel der Stunde")[
  #grid(columns: (1fr, 1fr), gutter: 0.8em,
    [
      #card("Ziel", [
        Ihr entwickelt eigene Kreaturen im Simulator und lasst sie im Wettbewerb gegeneinander antreten. Gewonnen hat, wessen Kreatur am weitesten kommt.
      ], fill: blue-lt, accent: blue)
      #v(0.5em)
      #card("Was ihr schon wisst", [
        Variation, Vererbung und Selektion als Grundprinzipien der Evolution — darauf baut die Stunde auf.
      ], fill: green-lt, accent: green)
    ],
    [
      #step("1", "Einstieg", [Was kann der Simulator?], fill: amber-lt, accent: amber)
      #v(0.4em)
      #step("2", "Editor", [Die Oberfläche kennenlernen], fill: blue-lt, accent: blue)
      #v(0.4em)
      #step("3", "Bauen", [Eigene Kreatur entwerfen & testen], fill: green-lt, accent: green)
      #v(0.4em)
      #step("4", "Wettbewerb", [Wer kommt am weitesten?], fill: amber-lt, accent: amber)
    ],
  )
]

// ── FOLIE 3 · Einstieg Simulator ─────────────────────────────────────────────
#content-slide("Was macht der Simulator?")[
  #grid(columns: (1.1fr, 0.9fr), gutter: 0.8em,
    [
      #card("Grundidee", [
        Ihr baut Kreaturen aus Gelenken, Knochen und Muskeln. Der Simulator lässt sie laufen und zeigt, wie gut sie sich fortbewegen.
      ], fill: blue-lt, accent: blue)
      #v(0.5em)
      #card("Was zählt", [
        Nicht Schönheit entscheidet, sondern Funktion: Welche Kreatur schafft die größte Strecke? Evolution durch Versuch und Verbesserung.
      ], fill: amber-lt, accent: amber)
    ],
    [
      #card("Worauf achtet ihr?", [
        - Körperform & Stabilität
        - Symmetrie
        - Gelenke und Muskeln
        - Ergebnis der Simulation
        - Verbesserungspotenzial
      ], fill: green-lt, accent: green)
    ],
  )
]

// ── FOLIE 4 · Editor ─────────────────────────────────────────────────────────
#content-slide("Der Editor im Überblick")[
  #grid(columns: (1.2fr, 0.8fr), gutter: 0.8em,
    align(top)[
      #image("editor.png", width: 100%)
    ],
    [
      #card("Werkzeuge", [
        - *Joint* – Gelenk setzen
        - *Bone* – Körperteile verbinden
        - *Muscle* – Bewegung erzeugen
        - *Move* – Element verschieben
        - *Select* – auswählen & anpassen
        - *Delete* – löschen
      ], fill: blue-lt, accent: blue)
      #v(0.45em)
      #card("Simulation starten", [
        - *Evolve* startet die Simulation
        - *Gallery* zeigt Vorlagen
        - Population & Zeit pro Generation einstellbar
      ], fill: green-lt, accent: green)
    ],
  )
]

// ── FOLIE 5 · Tipps zum Bauen ────────────────────────────────────────────────
#content-slide("So baut ihr eine gute Kreatur")[
  #grid(columns: (1fr, 1fr), gutter: 0.8em,
    [
      #step("1", "Einfach starten", [Kleine, stabile Grundform — kein Riesenmonster sofort.], fill: blue-lt, accent: blue)
      #v(0.4em)
      #step("2", "Symmetrie nutzen", [Symmetrische Kreaturen kippen weniger schnell um.], fill: green-lt, accent: green)
    ],
    [
      #step("3", "Testen & beobachten", [Was bewegt sich? Was bleibt hängen? Erst testen, dann anpassen.], fill: amber-lt, accent: amber)
      #v(0.4em)
      #step("4", "Gezielt verändern", [Immer nur eine Sache auf einmal ändern — so erkennt ihr, was wirklich hilft.], fill: blue-lt, accent: blue)
    ],
  )
]

// ── FOLIE 6 · Wettbewerb ─────────────────────────────────────────────────────
#content-slide("Wettbewerb: Wer kommt am weitesten?")[
  #grid(columns: (1fr, 1fr), gutter: 0.8em,
    [
      #card("Aufgabe", [
        Entwickelt eine Kreatur im Editor, lasst sie simulieren und optimiert sie. Am Ende treten alle Kreaturen gegeneinander an.
      ], fill: amber-lt, accent: amber)
      #v(0.5em)
      #card("Gewertet wird", [
        Die zurückgelegte Strecke in der Simulation — keine weiteren Extras.
      ], fill: green-lt, accent: green)
    ],
    [
      #card("Zeitplan", [
        - *5 Min* – Einstieg & Simulator erkunden
        - *10 Min* – Editor kennenlernen
        - *20 Min* – Eigene Kreatur bauen
        - *10 Min* – Wettbewerb & Auswertung
      ], fill: blue-lt, accent: blue)
    ],
  )
]

// ── FOLIE 7 · Bonus-Challenge: Klettern ──────────────────────────────────────
#content-slide("Bonus-Challenge: Klettern")[
  #grid(columns: (1.25fr, 0.75fr), gutter: 0.8em,
    align(top)[
      #image("climbing.png", width: 100%)
    ],
    [
      #card("Neue Aufgabe", [
        Im Simulator gibt es nicht nur flaches Gelände — wählt im Menü *Climbing* und lasst eure Kreatur eine Treppe erklimmen.
      ], fill: amber-lt, accent: amber)
      #v(0.45em)
      #card("Was sich ändert", [
        - Das Terrain ist schräg und stufig
        - Laufkreaturen scheitern oft
        - Greif- und Kletterbewegungen helfen
        - Komplett neue Körperformen gefragt!
      ], fill: blue-lt, accent: blue)
      #v(0.45em)
      #card("Frage", [
        Funktioniert eure Lauf-Kreatur auch beim Klettern — oder braucht ihr eine neue?
      ], fill: green-lt, accent: green)
    ],
  )
]

// ── FOLIE 8 · Abschluss ──────────────────────────────────────────────────────
#content-slide("Abschluss & Reflexion")[
  #grid(columns: (1fr, 1fr), gutter: 0.8em,
    [
      #card("Fragen für die Klasse", [
        - Welche Kreatur war am erfolgreichsten?
        - Was hat besonders gut funktioniert?
        - Welche Änderung brachte den größten Sprung?
        - Was würdet ihr beim nächsten Mal anders machen?
      ], fill: blue-lt, accent: blue)
    ],
    [
      #card("Merksatz", [
        Gute Evolution braucht *Variation*, *Testen* und *gezielte Auswahl*. Genau das habt ihr heute im Simulator selbst erlebt.
      ], fill: amber-lt, accent: amber)
    ],
  )
]