#import "@preview/polylux:0.4.0": slide, enable-handout-mode

// ── Farbpalette ──────────────────────────────────────────────────────────────
#let C-BLUE    = rgb("#0d47a1")
#let C-MID     = rgb("#1565c0")
#let C-LIGHT   = rgb("#e3f2fd")
#let C-AMBER   = rgb("#e65100")
#let C-AMBER-L = rgb("#fff3e0")
#let C-GREEN   = rgb("#2e7d32")
#let C-GREEN-L = rgb("#e8f5e9")
#let C-RED-L   = rgb("#fce4ec")
#let C-YELLOW  = rgb("#fff8e1")
#let C-WHITE   = white
#let C-DARK    = rgb("#212121")
#let C-GREY    = rgb("#757575")

// ── Globale Einstellungen ─────────────────────────────────────────────────────
#set page(paper: "presentation-16-9", fill: C-WHITE, margin: 0pt)
#set text(font: "Fira Sans", size: 19pt, fill: C-DARK)
#set list(indent: 0.5em, spacing: 0.7em)

// ── Hilfs-Komponenten ─────────────────────────────────────────────────────────
#let make-header(title) = block(
  fill: C-BLUE, width: 100%,
  inset: (x: 1.4em, y: 0.55em),
)[
  #text(fill: C-WHITE, size: 25pt, weight: "bold")[#title]
]

#let make-footer = block(
  fill: C-LIGHT, width: 100%,
  inset: (x: 1.4em, y: 0.4em),
)[
  #text(size: 13pt, fill: C-GREY)[Roboter im Alltag · 9. Klasse]
]

#let body(content) = pad(x: 1.4em, top: 0.9em, bottom: 0.2em)[#content]

#let content-slide(title, content) = slide[
  #set page(footer: make-footer)
  #make-header(title)
  #body(content)
]

// Impuls-Folie: Schüler:innen denken zuerst
#let think-slide(question, task: none, time: none) = slide[
  #set page(fill: C-AMBER)
  #align(center + horizon)[
    #text(size: 30pt, fill: C-WHITE)[🤔]
    #v(0.4em)
    #block(width: 80%)[
      #text(size: 28pt, weight: "bold", fill: C-WHITE)[#question]
    ]
    #if task != none [
      #v(0.6em)
      #block(
        fill: white.transparentize(85%), inset: (x: 1.2em, y: 0.6em), radius: 8pt, width: 70%,
      )[
        #text(size: 19pt, fill: C-WHITE)[#task]
      ]
    ]
    #if time != none [
      #v(0.5em)
      #text(size: 16pt, fill: white.transparentize(20%))[⏱ #time]
    ]
  ]
]

#let infobox(color: C-LIGHT, title: none, content) = block(
  fill: color, width: 100%,
  inset: 0.8em, radius: 6pt,
  stroke: (left: 4pt + C-BLUE),
)[
  #if title != none [#text(weight: "bold")[#title \ ]]
  #content
]

#let step-box(n, content) = grid(
  columns: (auto, 1fr), gutter: 0.6em,
  block(fill: C-BLUE, inset: (x: 0.6em, y: 0.4em), radius: 6pt)[
    #text(fill: white, weight: "bold")[#n]
  ],
  align(horizon)[#content],
)

#let sensor-card(emoji, name, use) = block(
  fill: C-LIGHT, inset: 0.7em, radius: 8pt, width: 100%,
)[
  #text(size: 24pt)[#emoji] #h(0.3em)
  #text(weight: "bold", fill: C-BLUE)[#name] \
  #text(size: 16pt, fill: C-GREY)[#use]
]

#let section-slide(part, title, subtitle, fill: C-MID, text-muted: rgb("#90caf9"), text-sub: rgb("#bbdefb")) = slide[
  #set page(fill: fill)
  #align(center + horizon)[
    #text(size: 18pt, fill: text-muted)[#part]
    #v(0.2em)
    #text(size: 38pt, weight: "bold", fill: C-WHITE)[#title]
    #v(0.2em)
    #text(size: 20pt, fill: text-sub)[#subtitle]
  ]
]

// ════════════════════════════════════════════════════════════════════════════
// TITELFOLIE
// ════════════════════════════════════════════════════════════════════════════
#slide[
  #set page(fill: C-BLUE)
  #align(center + horizon)[
    #text(size: 16pt, fill: rgb("#90caf9"))[🤖 Roboter im Alltag]
    #v(0.5em)
    #text(size: 42pt, weight: "bold", fill: C-WHITE)[Staubsaugroboter]
    #v(0.3em)
    #text(size: 22pt, fill: rgb("#bbdefb"))[
      Sensoren · Navigation · Eigener EV3-Roboter
    ]
    #v(0.8em)
    #block(fill: rgb("#1565c0"), inset: (x: 1.2em, y: 0.5em), radius: 6pt)[
      #text(size: 15pt, fill: rgb("#90caf9"))[9. Klasse · Informatik]
    ]
  ]
]

// ════════════════════════════════════════════════════════════════════════════
// AGENDA
// ════════════════════════════════════════════════════════════════════════════
#content-slide("Heutiger Ablauf")[
  #v(0.4em)
  #grid(columns: 2, gutter: 0.8em,
    step-box("1", [*Staubsaugroboter* – Was steckt dahinter?]),
    step-box("2", [*EV3-Sensoren* – Was brauchen wir?]),
    step-box("3", [*Navigation* – Wie fährt der Roboter?]),
    step-box("4", [*Ideenfindung* – Euer eigener Roboter]),
  )
]

// ════════════════════════════════════════════════════════════════════════════
// TEIL 1 – STAUBSAUGROBOTER
// ════════════════════════════════════════════════════════════════════════════
#section-slide("Teil 1", "🏠 Staubsaugroboter", "Was steckt dahinter?")

// ── Impuls 1a ────────────────────────────────────────────────────────────────
#think-slide(
  "Kennt ihr einen Staubsaugroboter – aus dem Alltag, aus der Werbung oder aus einem Video?",
  task: [Tauscht euch kurz mit eurer Nachbarperson aus:\
  Was weiß ihr schon darüber?],
  time: "2 Minuten",
)

// ── Auflösung 1a ─────────────────────────────────────────────────────────────
#content-slide("Was ist ein Staubsaugroboter?")[
  #grid(columns: (1fr, 1fr), gutter: 1em,
    [
      - Autonomes Haushaltsgerät
      - Saugt Böden *ohne menschliche Steuerung*
      - Erkennt Hindernisse & Stufen selbstständig
      - Kehrt zur Ladestation zurück
      - Bekanntestes Modell: *iRobot Roomba* (seit 2002)
    ],
    [
      #infobox(title: "Typische Merkmale")[
        - Runde oder D-förmige Form
        - Bürsten unter dem Gerät
        - Schmutzbehälter & Filter
        - WLAN / App-Steuerung
      ]
      #v(0.5em)
      #infobox(color: C-YELLOW, title: "💡 Wusstest du?")[
        #text(size: 16pt)[
          Roomba (2002) war der erste\
          kommerzielle Staubsaugroboter –\
          heute: Milliarden-Markt, 50+ Hersteller.
        ]
      ]
    ]
  )
]

// ── Impuls 1b ────────────────────────────────────────────────────────────────
#think-slide(
  "Welche Probleme muss ein Staubsaugroboter lösen, um einen ganzen Raum zu putzen?",
  task: [Sammelt gemeinsam an der Tafel:\
  Was muss der Roboter *können*?],
  time: "3 Minuten",
)

// ── Auflösung 1b ─────────────────────────────────────────────────────────────
#content-slide("Grundprobleme – und wie sie gelöst werden")[
  #grid(columns: (1fr, 1fr), gutter: 1em,
    [
      *Was muss der Roboter lösen?*
      #v(0.4em)
      #step-box("1", [Hindernisse erkennen & ausweichen])
      #v(0.3em)
      #step-box("2", [Absturzkanten (Stufen) erkennen])
      #v(0.3em)
      #step-box("3", [Den gesamten Bereich abfahren])
      #v(0.3em)
      #step-box("4", [Zur Ladestation zurückfinden])
    ],
    [
      *Verbaute Technik (Roomba):*
      - Infrarot-Sensoren (Kanten)
      - Stoßsensor / Bumper vorne
      - Optischer Bodensensor
      - Kamera / LiDAR (neuere Modelle)
      - Encoder an den Rädern

      #v(0.3em)
      #infobox(color: C-GREEN-L, title: "🧠 Neuere Modelle")[
        #text(size: 16pt)[
          Erstellen automatisch eine Karte\
          der Wohnung (SLAM-Verfahren)
        ]
      ]
    ]
  )
]

// ════════════════════════════════════════════════════════════════════════════
// TEIL 2 – EV3 SENSOREN
// ════════════════════════════════════════════════════════════════════════════
#section-slide("Teil 2", "🔧 EV3-Sensoren", "Was brauchen wir für den Nachbau?")

// ── Impuls 2a ────────────────────────────────────────────────────────────────
#think-slide(
  "Stellt euch vor, ihr seid blind in einem unbekannten Zimmer. Wie orientiert ihr euch?",
  task: [Was würdet ihr benutzen – und wie übertragt ihr\
  das auf einen Roboter?],
  time: "2 Minuten",
)

// ── Impuls pro Sensor ────────────────────────────────────────────────────────
#think-slide(
  "Ein Sensor misst Schallwellen, die er selbst aussendet. Was könnte er damit erkennen?",
  task: [Überlegt: Wofür wäre das beim Staubsaugroboter nützlich?],
  time: "1 Minute",
)

#content-slide("Sensor 1 – Ultraschallsensor 📡")[
  #grid(columns: (1fr, 1fr), gutter: 1em,
    [
      *Wie funktioniert er?*
      - Sendet Ultraschallwellen aus
      - Misst Zeit bis Echo zurückkommt
      - Berechnet *Distanz* (3–250 cm)

      #v(0.4em)
      *Beim Staubsaugroboter:*
      - Hindernisse *vor* dem Roboter erkennen
      - Rechtzeitig bremsen & ausweichen
      - Wände als Orientierungspunkte nutzen
    ],
    [
      #infobox(color: C-GREEN-L, title: "✅ Wichtig für uns")[
        *Unverzichtbar* – ohne ihn\
        fährt der Roboter gegen alles.
      ]
      #v(0.5em)
      #infobox(title: "⚠️ Einschränkungen")[
        - Erkennt weiche/schräge Flächen\
          schlechter
        - Nur in Blickrichtung
        - Keine 360°-Erkennung
      ]
    ]
  )
]

#think-slide(
  "Wie könnte ein Roboter merken, dass er gleich eine Treppe hinunterfällt?",
  task: [Welcher Sensor könnte das lösen – und wie müsste er montiert sein?],
  time: "1 Minute",
)

#content-slide("Sensor 2 – Farbsensor 🌈")[
  #grid(columns: (1fr, 1fr), gutter: 1em,
    [
      *Wie funktioniert er?*
      - Erkennt Farben & Lichtintensität
      - Auch als *Helligkeitssensor* nutzbar

      #v(0.4em)
      *Beim Staubsaugroboter:*
      - *Kanten & Stufen* erkennen\
        (Helligkeit ändert sich → Absturzkante)
      - Teppich vs. Hartboden unterscheiden
      - Farbmarkierungen als Grenze nutzen
    ],
    [
      #infobox(color: C-GREEN-L, title: "✅ Wichtig für uns")[
        Verhindert, dass der Roboter\
        *Treppen hinunterfällt* –\
        zeigt auf den Boden gerichtet.
      ]
      #v(0.5em)
      #infobox(color: C-YELLOW, title: "💡 Tipp")[
        Schwarzes Klebeband als\
        „virtuelle Wand" → Roboter\
        bleibt im markierten Bereich.
      ]
    ]
  )
]

#think-slide(
  "Was passiert, wenn der Ultraschall ein Hindernis zu spät erkennt – z.B. ein dünnes Tischbein?",
  task: [Welchen zweiten Sensor könnte man als Backup nutzen?],
  time: "1 Minute",
)

#content-slide("Sensor 3 – Berührungssensor 🤜")[
  #grid(columns: (1fr, 1fr), gutter: 1em,
    [
      *Wie funktioniert er?*
      - Einfacher *Druckschalter*
      - Meldet: gedrückt / losgelassen
      - Sehr zuverlässig & günstig

      #v(0.4em)
      *Beim Staubsaugroboter:*
      - Als *Frontstoßstange* vorne anbringen
      - Erkennt Kollisionen, die der\
        Ultraschall nicht sieht
    ],
    [
      #infobox(color: C-GREEN-L, title: "✅ Sinnvoll")[
        Backup-Sicherheit für Objekte,\
        die für Ultraschall unsichtbar\
        sind (z. B. Tischbeine).
      ]
      #v(0.5em)
      #infobox(title: "📌 Einbau-Tipp")[
        Vorne links & rechts montiert\
        = breitere Kollisionserkennung
      ]
    ]
  )
]

#think-slide(
  "Wie könnte ein Roboter eine genaue 90°-Kurve fahren – ohne nachzumessen?",
  task: [Was braucht er dafür? Welche Information fehlt ihm ohne diesen Sensor?],
  time: "1 Minute",
)

#content-slide("Sensor 4 – Gyrosensor 🔄")[
  #grid(columns: (1fr, 1fr), gutter: 1em,
    [
      *Wie funktioniert er?*
      - Misst *Drehrate* (°/Sekunde)
      - Berechnet den genauen *Drehwinkel*

      #v(0.4em)
      *Beim Staubsaugroboter:*
      - Präzise 90°-Kurven drehen
      - Gerade Linien fahren
      - Navigationsmuster genau einhalten
    ],
    [
      #infobox(color: C-GREEN-L, title: "✅ Für Präzision")[
        Ohne Gyro dreht der Roboter\
        nur *ungefähr* – mit Gyro\
        werden Muster viel sauberer.
      ]
      #v(0.5em)
      #infobox(color: C-RED-L, title: "⚠️ Drift")[
        #text(size: 16pt)[
          Der Gyro kann über Zeit\
          leicht ungenau werden\
          (→ Kalibrierung nötig)
        ]
      ]
    ]
  )
]

// ── Impuls: Sensor-Auswahl ────────────────────────────────────────────────────
#think-slide(
  "Ihr habt nur 2 Sensor-Ports frei. Welche zwei Sensoren wählt ihr – und warum?",
  task: [Einigt euch in der Gruppe auf eine Antwort\
  und begründet eure Wahl.],
  time: "3 Minuten",
)

#content-slide("Sensoren im Überblick")[
  #v(0.3em)
  #grid(columns: (1fr, 1fr), gutter: 0.8em,
    sensor-card("📡", "Ultraschallsensor", "Hindernisse erkennen – MUSS"),
    sensor-card("🌈", "Farbsensor", "Kanten & Stufen – MUSS"),
    sensor-card("🤜", "Berührungssensor", "Kollisionssicherheit – EMPFOHLEN"),
    sensor-card("🔄", "Gyrosensor", "Präzise Navigation – EMPFOHLEN"),
  )
  #v(0.5em)
  #infobox(color: C-GREEN-L)[
    *Fazit aus der Diskussion:* Ultraschall & Farbsensor sind das Minimum –\
    Berührungssensor & Gyro machen den Roboter deutlich robuster.
  ]
]

// ════════════════════════════════════════════════════════════════════════════
// TEIL 3 – NAVIGATION
// ════════════════════════════════════════════════════════════════════════════
#section-slide("Teil 3", "🗺️ Navigation", "Wie fährt der Roboter einen Bereich ab?")

// ── Impuls 3a: Raumskizze ────────────────────────────────────────────────────
#think-slide(
  "Wie würdet ihr diesen Raum putzen, wenn ihr der Roboter wärt?",
  task: [Zeichnet auf dem Papier eine Linie, die zeigt,\
  welchen Weg euer Roboter fahren würde.\
  Ihr habt 3 Minuten – dann vergleichen wir!],
  time: "3 Minuten",
)

// ── Strategien: Überblick ────────────────────────────────────────────────────
#content-slide("Navigationsstrategien – was haben echte Roboter?")[
  #grid(columns: (1fr, 1fr), gutter: 0.8em,
    [
      #infobox(title: "🎲 Zufallsbewegung")[
        Fahre geradeaus, erkenne\
        Hindernis → drehe zufällig,\
        fahre weiter.
      ]
      #v(0.4em)
      #infobox(title: "🌀 Spiralmuster")[
        Start in der Mitte, fahre\
        spiralförmig nach außen.
      ]
    ],
    [
      #infobox(title: "↕️ Zeilenweise (Boustrophedon)")[
        Fahre Reihen ab wie beim\
        Rasenmähen – Zeile für Zeile.
      ]
      #v(0.4em)
      #infobox(title: "🧱 Wandfolge")[
        Folge einer Wand, dann\
        systematisch einwärts.
      ]
    ]
  )
  #v(0.3em)
  #infobox(color: C-GREEN-L)[
    Echte Roboter *kombinieren* oft mehrere Strategien!
  ]
]

// ════════════════════════════════════════════════════════════════════════════
// TEIL 4 – IDEENFINDUNG
// ════════════════════════════════════════════════════════════════════════════
#section-slide(
  "Teil 4", "💡 Ideenfindung",
  "Euer eigener EV3-Staubsaugroboter",
  fill: C-GREEN,
  text-muted: rgb("#a5d6a7"),
  text-sub: rgb("#c8e6c9"),
)

#content-slide("Eure Aufgabe")[
  #grid(columns: (1fr, 1fr), gutter: 1em,
    [
      Entwickelt in *Gruppen (2–3 Personen)*\
      ein Konzept für euren EV3-Roboter:
      #v(0.5em)
      #step-box("1", [*Bau*: Form & Sensor-Montage skizzieren])
      #v(0.4em)
      #step-box("2", [*Sensoren*: Auswahl begründen])
      #v(0.4em)
      #step-box("3", [*Strategie*: Navigationsmuster wählen])
      #v(0.4em)
      #step-box("4", [*Extras*: Was macht euren Roboter besonders?])
    ],
    [
      #infobox(title: "📋 Konzeptskizze (Ergebnis)")[
        - Zeichnung / Skizze des Aufbaus
        - Sensoren & Begründung
        - Beschreibung der Strategie
        - Pseudocode / Programmschritte
      ]
      #v(0.4em)
      #infobox(color: C-YELLOW, title: "⏱️ Zeit")[
        ~25 Minuten Gruppenarbeit,\
        dann kurze Vorstellung\
        der Ideen im Plenum
      ]
    ]
  )
]

#content-slide("Leitfragen für eure Planung")[
  #grid(columns: (1fr, 1fr), gutter: 0.8em,
    [
      *🔧 Zum Aufbau:*
      - Welche Form hat euer Roboter?
      - Wie befestigt ihr die Sensoren?
      - Wie breit ist euer Roboter?\
        (→ beeinflusst Navigationsmuster!)
    ],
    [
      *💻 Zur Programmierung:*
      - Welche Strategie wählt ihr?
      - Wie reagiert der Roboter\
        auf ein Hindernis?
      - Wie genau dreht er sich?
    ]
  )
  #v(0.6em)
  #infobox(color: C-GREEN-L, title: "🚀 Bonusfragen")[
    - Wie erkennt der Roboter, dass er fertig ist?
    - Wie findet er zur Ladestation (Startpunkt) zurück?
    - Wie verhält er sich auf einem Teppich (Farbsensor!)?
  ]
]

// ════════════════════════════════════════════════════════════════════════════
// ABSCHLUSSFOLIE
// ════════════════════════════════════════════════════════════════════════════
#slide[
  #set page(fill: C-BLUE)
  #align(center + horizon)[
    #text(size: 42pt, fill: C-WHITE)[🤖]
    #v(0.3em)
    #text(size: 34pt, weight: "bold", fill: C-WHITE)[Viel Spaß beim Tüfteln!]
    #v(0.5em)
    #text(size: 20pt, fill: rgb("#bbdefb"))[
      Auch echte Ingenieur:innen scheitern oft beim ersten Versuch –\
      das gehört dazu.
    ]
    #v(1em)
    #block(fill: rgb("#1565c0"), inset: (x: 1.5em, y: 0.7em), radius: 8pt)[
      #text(fill: rgb("#90caf9"), size: 16pt)[
        *Heute:* Ideenfindung & Konzept  ·  *Nächste Stunde:* Bau & erste Tests
      ]
    ]
  ]
]

// ── Hilfs-Komponenten ─────────────────────────────────────────────────────────
#let make-header(title) = block(
  fill: C-BLUE, width: 100%,
  inset: (x: 1.4em, y: 0.55em),
)[
  #text(fill: C-WHITE, size: 25pt, weight: "bold")[#title]
]

#let make-footer = block(
  fill: C-LIGHT, width: 100%,
  inset: (x: 1.4em, y: 0.4em),
)[
  #text(size: 13pt, fill: C-GREY)[
    Roboter im Alltag · 9. Klasse
  ]
]

#let body(content) = pad(x: 1.4em, top: 0.9em, bottom: 0.2em)[#content]

#let content-slide(title, content) = slide[
  #set page(footer: make-footer)
  #make-header(title)
  #body(content)
]

#let infobox(color: C-LIGHT, title: none, content) = block(
  fill: color, width: 100%,
  inset: 0.8em, radius: 6pt,
  stroke: (left: 4pt + C-BLUE),
)[
  #if title != none [#text(weight: "bold")[#title \ ]]
  #content
]

#let sensor-card(emoji, name, use) = block(
  fill: C-LIGHT, inset: 0.7em, radius: 8pt,
  width: 100%,
)[
  #text(size: 26pt)[#emoji] #h(0.3em)
  #text(weight: "bold", fill: C-BLUE)[#name] \
  #text(size: 17pt, fill: C-GREY)[#use]
]

#let step-box(n, content) = grid(
  columns: (auto, 1fr), gutter: 0.6em,
  block(
    fill: C-BLUE, inset: (x: 0.6em, y: 0.4em), radius: 6pt,
  )[#text(fill: white, weight: "bold")[#n]],
  align(horizon)[#content],
)

#let section-slide(part, title, subtitle, fill: C-MID, text-muted: rgb("#90caf9"), text-sub: rgb("#bbdefb")) = slide[
  #set page(fill: fill)
  #align(center + horizon)[
    #text(size: 18pt, fill: text-muted)[#part]
    #v(0.2em)
    #text(size: 38pt, weight: "bold", fill: C-WHITE)[#title]
    #v(0.2em)
    #text(size: 20pt, fill: text-sub)[#subtitle]
  ]
]

