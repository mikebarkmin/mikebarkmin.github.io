---
title: "Staubsaugroboter Challenge"
---

# Staubsaugroboter Challenge

Bei der Challenge treten die Staubsaugroboter gegeneinander an. In einem absteckten Bereich, welcher mit vier Aruco Markern gekennzeichnet ist, müssen die Roboter den Boden "wischen".

Wer es schafft, die meiste Fläche zu "reinigen", gewinnt.

Hier ist ein Beispielvideo, wie so eine Challenge aussehen könnte:

::video{src="./beispiel.webm"}

Am Ende der Challenge erhalten die Teilnehmer:innen eine Medaille.

## Material

### Programm zum Tracken

::archive[Python Programm]{name="cleaning-robot-challenge"}

### ArUco Marker

:::openscad{id="42037ba9a61a47b523f1fb67d0aa3cb4907182f1892aa0ac58bd808eb2cd1ee5"}
::file{path="main.scad" src="./aruco_markers.scad"}
:::

### Medaille

:::openscad{id="aa881975ca51a97c0a367651df5d467dd39083eabe037cdf3a1108f468f955a9"}
::file{path="main.scad" src="./cleaning-robot.scad"}
:::
