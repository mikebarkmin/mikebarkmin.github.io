---
name: Startseite
index: 0
---

# Willkommen auf meiner Webseite.

-![](./mike.jpg)

Hier findest du eine Übersicht meiner Arbeiten und Ressourcen.

Viel Spaß beim Stöbern!

P.S.: Die Seite wurde mit meinem Projekt [Hyperbook](https://hyperbook.openpatch.org) erstellt.

## Aktuelles

::pagelist{format="ul" source="(href(/blog/.*) OR href(/publikationen/.*) OR href(/projekte/.*) OR href(/til/.*)) AND date(.*)" orderBy="date:desc" limit=5}

## Bereiche

:::tiles

::tile{title="Blog" href="/blog" icon=":speech_balloon:"}

::tile{title="Publikationen" href="/publikationen" icon=":books:"}

::tile{title="Projekte" href="/projekte" icon=":rocket:"}

::tile{title="Material" href="/material" icon=":open_file_folder:"}

::tile{title="3D-Modelle" href="/3d-modelle" icon=":orange_heart:"}

::tile{title="TIL" href="/til" icon=":bulb:"}

::tile{title="Tools" href="/tools" icon=":wrench:"}

::tile{title="Vorträge" href="/vortraege" icon=":microphone:"}

:::
