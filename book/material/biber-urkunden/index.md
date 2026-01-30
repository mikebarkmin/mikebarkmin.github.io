---
title: Biber-Urkunden
date: 2026-01-30
keywords:
  - allgemein
lang: de
permaid: m003
---

# Biber-Urkunden

Ich lasse meine Schüler:innen immer anonym am Informatikbiber-Wettbewerb teilnehmen und bestelle dann Blank-Urkunden.

Hier ist ein Typst-Dokument, das aus einer CSV-Datei ein PDF erstellt, welches man zum Bedrucken der Blank-Urkunden verwenden kann.

:::typst{mode="edit" id="biber-urkunden"}
@source dest="main.typ" src="urkunden.typ"
:::

Die CSV-Datei setze ich auf der anonymisierten Biber-Ergebnisliste und der Klassenliste, als Webunites-Export, zusammen. Diese hat dann folgende Struktur:

```csv
Langname	Vorname	Klasse	Preisstufe
Musterfrau	Anna	06a	1. Rang
Mustermann	Max	06b	Teilnahme
```

Die Klasse wird für das Dokument nicht benötigt, hilft mir aber bei der Zuordnung der Urkunden zu den Schüler:innen.

:::alert{info}
Wenn man eine original Biber-Urkunde hat, kann man sie als Hintergrund setzen. So kann man den Text besser ausrichten. Dazu einfach die 4. Zeile auskommentieren.
:::
