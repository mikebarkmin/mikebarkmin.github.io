---
name: Circle-Packing
date: 2026-01-09
---

# Circle-Packing

Wie bekommt man eigentlich diese hübschen Computergrafiken hin, bei denen sich nichts überschneidet.

Mir schwebte immer der Begriff Packing im Kopf herum, jedoch habe ich mich noch nie mit dem Algorithmus dahinter beschäftigt.

Jetzt ist es soweit.

Hier ist ein einfacher Circle-Packing-Algorithmus in p5.js. Dieser funktioniert im Prinzip so:

1. Wir versuchen zufällig Punkte auf der Leinwand zu platzieren.
2. Für jeden Punkt berechnen wir den größtmöglichen Radius, der nicht mit anderen Kreisen kollidiert.
3. Wenn der Radius mindestens 1 ist, fügen wir den Kreis der Liste hinzu.
4. Wir wiederholen dies, bis wir eine maximale Anzahl von

:::p5{height=400 editor=true}

```js
function setup() {
  createCanvas(400, 400);
  noLoop();
}

function draw() {
  background(220);
  
  let circles = [];
  let maxCircles = 500;
  let maxRadius = 50;
  let maxAttempts = 10000;
  let attempts = 0;
  
  while (circles.length < maxCircles && attempts < maxAttempts) {
    let x = random(width);
    let y = random(height);
    
    // Calculate max possible radius based on canvas bounds
    let maxR = min(x, y, width - x, height - y, maxRadius);
    
    // Find closest circle and limit radius
    for (let other of circles) {
      let d = dist(x, y, other.x, other.y);
      maxR = min(maxR, d - other.r);
    }
    
    // Only add if there's space for a circle with radius >= 1
    if (maxR >= 1) {
      circles.push({ x, y, r: maxR });
    }
    
    attempts++;
  }
  
  // Draw circles
  noStroke();
  for (let circle of circles) {
    fill(100, 150, 250, 150);
    ellipse(circle.x, circle.y, circle.r * 2);
  }
}

```

:::

Das sieht schon ganz nett aus, aber mich hilft bei solchen Kunstwerken immer ein bisschen mehr Farbe.

Damit die Farben aber zusammenpassen, würde ich HSL-Farben verwenden und den Farbton basierend auf der Position des Kreises wählen. 

Außerdem ziehen wir mehr Parameter aus dem Algorithmus, damit wir die Größe der Kreise und die Anzahl der Versuche besser steuern können.

Hier ist die angepasste Version:

:::p5{height=400 editor=true}

```js
function setup() {
  createCanvas(400, 400);
  colorMode(HSL, 360, 100, 100, 1);
  noLoop();
}

function draw() {
  background(220);
  
  let circles = [];
  let maxCircles = 500;
  let maxRadius = 50;
  let minRadius = 1;
  let hueSpectrum = [50, 150];
  let maxAttempts = 10000;
  let attempts = 0;
  
  while (circles.length < maxCircles && attempts < maxAttempts) {
    let x = random(width);
    let y = random(height);
    
    // Calculate max possible radius based on canvas bounds
    let maxR = min(x, y, width - x, height - y, maxRadius);
    
    // Find closest circle and limit radius
    for (let other of circles) {
      let d = dist(x, y, other.x, other.y);
      maxR = min(maxR, d - other.r);
    }
    
    // Only add if there's space for a circle with radius >= 1
    if (maxR >= minRadius) {
      circles.push({ x, y, r: maxR });
    }
    
    attempts++;
  }
  
  // Draw circles with color based on position
  noStroke();
  for (let circle of circles) {
    let hue = map(circle.x, 0, width, hueSpectrum[0], hueSpectrum[1]);
    fill(hue, 80, 60, 0.7);
    ellipse(circle.x, circle.y, circle.r * 2);
  }
}
```
:::

Super :) Jetzt kannst du mit den Parametern spielen und verschiedene Effekte erzielen. Viel Spaß beim Experimentieren!

Wenn du mehr über Packing-Algorithmen erfahren möchtest, schaue dir den Artikel von Gorrila Sun an. [A Simple Solution for Shape Packing in 2D](https://www.gorillasun.de/blog/a-simple-solution-for-shape-packing-in-2d/#packing-algorithms-in-generative-art)
