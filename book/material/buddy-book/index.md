---
date: "2023-12-15"
name: "Buddybook: Vorlage"
keywords:
  - allgemein
lang: de
layout: wide
---

# Buddybook: Vorlage

Das ist eine Vorlage für ein Buddybook, welches die Schüler:innen eigenständig befüllen können.

- Lizenz: [CC0](https://creativecommons.org/publicdomain/zero/1.0/)

:::typst{mode="edit"}

```typ
#set page(paper: "a4", flipped: true, margin: 0pt)

#let bbt(title) = align(center, text(size: 16pt, weight: "bold", title))

#let buddybox(content, rotated: false) = box(
  width: 100%,
  height: 100%,
  stroke: 0.5pt,
  inset: 8pt,
  if rotated {
    align(center + bottom, rotate(180deg, content))
  } else {
    align(center + top, content)
  }
)

#grid(
  columns: (1fr, 1fr, 1fr, 1fr),
  rows: (1fr, 1fr),
  gutter: 0pt,
  buddybox([
    #bbt("Seite 1")

    // - Hallo! Ich bin dein Buddybook. Einfach die beiden // entfernen und loslegen.
  ], rotated: true),
  buddybox([
    #bbt("Seite 8")
  ], rotated: true),
  buddybox([
    #bbt("Seite 7")
  ], rotated: true),
  buddybox([
    #bbt("Seite 6")
  ], rotated: true),
  buddybox([
    #bbt("Seite 2")
  ]),
  buddybox([
    #bbt("Seite 3")
  ]),
  buddybox(bbt("Seite 4")),
  buddybox(bbt("Seite 5")),
)
```

:::