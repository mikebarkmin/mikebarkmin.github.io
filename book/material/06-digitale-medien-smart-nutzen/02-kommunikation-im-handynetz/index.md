---
title: "Kommunikation im Handynetz"
---

# Kommunikation im Handynetz

## Ablauf

1. Zettel aus der ersten Stunde austeilen.
2. An die Tafel die Skizze zur Kommunikation im Handynetz zeichnen (siehe Materialien).
3. Schüler:innen sollen ihre Vorstellung von der Kommunikation im Handynetz einzeichnen.
4. Einzelne Schüler:innen sollen ihre Skizze an der Tafel erklären.
5. Video anschauen (siehe Materialien).
6. Schüler:innen sollen die Skizze an der Tafel ergänzen, korrigieren oder verbessern.
7. Bonus: Gruppenchat. Dieser soll zu Client Server Kommunikation überleiten (nächste Stunde).

## Materialien

### Wie wird ein Foto von einem Handy zu einem anderen Handy geschickt?

:::typst{mode="edit"}
::snippet{#fonts}
@source dest="main.typ" src="../arbeitsblatt.typ"
:::

### Wie bekommt das Handy Netz?

[Checker Tobi: Handy-Check](https://www.ardmediathek.de/video/checker-reportagen/der-handy-check/br/Y3JpZDovL2JyLmRlL3ZpZGVvLzBlN2E5YWZjLTk3YjMtNGI2OS04Y2YyLTVjOTI4MTNlZWI4Mi9icm9hZGNhc3Q?)

von 00:02:27 bis 00:08:26

Mit diesen Bash-Befehlen kannst du das Video herunterladen und direkt richtig schneiden:

```bash
yt-dlp -f best -o handy-check.mp4 "https://www.ardmediathek.de/video/checker-reportagen/der-handy-check/br/Y3JpZDovL2JyLmRlL3ZpZGVvLzBlN2E5YWZjLTk3YjMtNGI2OS04Y2YyLTVjOTI4MTNlZWI4Mi9icm9hZGNhc3Q"

ffmpeg -ss 00:02:27 -to 00:08:26 -i handy-check.mp4 -c copy handy-check-ausschnitt.mp4
```
