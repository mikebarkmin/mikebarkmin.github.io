#import "@preview/cheq:0.3.0": checklist

#set document(title: "Mein Weg zum Programmieren von Spielen")
#set page(
  paper: "a4",
  margin: (x: 2.5cm, y: 2cm),
)
#set text(
  size: 10pt,
  font: "Fira Sans",
)
#set par(justify: false)

#show: checklist

// Heading styles
#show heading.where(level: 1): it => block(
  text(size: 14pt, weight: "bold", it.body),
  spacing: 1em,
)
#show heading.where(level: 2): it => block(
  text(size: 12pt, weight: "bold", it.body),
  spacing: 1em,
)
#show heading.where(level: 3): it => block(
  text(size: 10pt, weight: "bold", it.body),
  spacing: 1em,
)

= *Mein Weg zum Programmieren von Spielen*

#emoji.controller Ich lerne Schritt für Schritt, wie man eigene Spiele programmiert.

== Die Maus-Lernspiele – meine Checkliste

#columns(2, gutter: 0cm)[
  === Maus 00 – Hallo Welt
  
  - [ ] Spiel gestartet
  - [ ] Die Maus reagiert auf einen Klick
  - [ ] Ich weiß, wie ein Programm startet
  
  === Maus 01 – Die Weltraum-Maus
  
  - [ ] Die Maus bewegt sich
  - [ ] Ich habe die Geschwindigkeit verändert
  - [ ] Ich habe der Maus ein neues Kostüm gegeben
  
  === Maus 02 – Die Maus blinzelt
  
  - [ ] Die Maus macht etwas mehrmals
  - [ ] Ich habe eine Wiederholung benutzt
  
  === Maus 03 – Die Maus tanzt!
  
  - [ ] Die Maus führt mehrere Schritte nacheinander aus
  - [ ] Ich habe die Reihenfolge verändert
  
  === Maus 04 – Wimmelbild
  
  - [ ] Ich habe genau hingeschaut 
  - [ ] Ich habe mehrere Figuren benutzt 
  - [ ] Jede Figur hat ihr eigenes Programm
  
  #colbreak()
  
  === Maus 05 – Mathefant
  
  - [ ] Das Spiel rechnet richtig 
  - [ ] Ich habe Zahlen verändert 
  - [ ] Ich habe ausprobiert, was passiert, wenn ich falsche Zahlen nehme
  
  === Maus 06 – Tiere raten
  
  - [ ] Das Spiel stellt Fragen 
  - [ ] Es reagiert unterschiedlich auf Antworten
  
  === Maus 07 – \#Mausprobiert
  
  - [ ] Ich habe selbst Effekte ausprobiert 
  - [ ] Ich habe verschiedene Kostüme benutzt
  
  === Maus 08 – Kugelfisch-Spiel
  
  - [ ] Das Spiel hat ein Ziel 
  - [ ] Man kann gewinnen oder verlieren 
  - [ ] Ich habe das Spiel getestet
  
  === Maus 09 – Stadt-Land-Ente
  
  - [ ] Mein Spiel ist fertig 
  - [ ] Andere konnten mein Spiel spielen 
  - [ ] Ich habe Feedback bekommen
]

#v(1em)

✅ Ich habe alle Lernspiele bearbeitet.

🎮 Ich bin bereit für etwas eigenes.

🧠 Ich weiß: Programmieren heißt ausprobieren, verbessern und nicht aufgeben.

#v(1em)

#grid(
  columns: (1fr, 1fr),
  gutter: 2em,
  [Unterschrift Schüler:in: 

  #h(2em) 

  #line(length: 100%)],
  [Unterschrift Lehrkraft: 

  #h(2em) 

  #line(length: 100%)],
)

#v(1em)

*Probiere dich selbst aus! Gehe zu „Meine Sachen" und erstelle ein eigenes Projekt.*

