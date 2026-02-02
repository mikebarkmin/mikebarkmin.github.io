#set page(
  margin: 1cm,
  paper: "a4",
  // background: image("biber-urkunde.png", width: 100%, height: 100%)
)

#set text(
  size: 24pt,
  // font: "Fira Sans",
)

#let daten = csv(
  "ergebnisse.csv",
  delimiter: "\t",
  row-type: dictionary,
)

#for schueler in daten {
  let vorname = schueler.Vorname
  let nachname = schueler.Langname
  let preisstufe = schueler.Preisstufe

  if vorname == none { continue }

  place(left + horizon)[
    #v(11em)
    #if preisstufe == "3. Rang" {
      [
        *#vorname #nachname* hat teilgenommen
        und einen *3. Rang* erreicht.
      ]
    } else if preisstufe == "2. Rang" {
      [
        *#vorname #nachname* hat teilgenommen
        und einen *2. Rang* erreicht.
      ]
    } else if preisstufe == "1. Rang" {
      [
        *#vorname #nachname* hat teilgenommen
        und einen *1. Rang* erreicht.
      ]
    } else if preisstufe == "Anerkennung" {
      [
        *#vorname #nachname* hat teilgenommen
        und eine *Anerkennung* erhalten.
      ]
    } else {
      [
        *#vorname #nachname* hat teilgenommen
      ]
    }

    #text(size: 16pt)[
      Altersgruppe: Stufen 5 und 6
    ]
  ]

  pagebreak(weak: true)
}

