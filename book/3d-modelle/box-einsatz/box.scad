include <BOSL2/std.scad>

$fn = 100;
l = 100;  // Papiergröße 100 x 100
w = 3;    // Bodenstärke
t = 0.15; // Spiel Deckel

// Steckschlitz für ein 100 x 100 Papier an jeder Außenwand
p_t = 0.8;   // Schlitzbreite (Papierdicke + Spiel)
p_clr = 0.4; // seitliches Spiel im Schlitz
lip = 1.5;   // Frontlippe vor dem Papier
lip_w = 3;   // Überdeckung des Papiers am Rand
post = 8;    // massives Material neben dem Schlitz
back = 1.5;  // Wand hinter dem Papier
foot = 3;    // Auflage unten, auf der das Papier steht

lo = l + 2 * p_clr + 2 * post;    // Außenmaß
lz = l + foot;                    // Höhe, Papieroberkante bündig
li = lo - 2 * (lip + p_t + back); // Innenraum

// Deckel
dh = 15;                      // Deckelhöhe
d_lap = 7.5;                  // Überlappung auf der Box
d_rim = lo / 2 - lip + 0.1;   // Schulter, sitzt auf dem Boxrand auf

// Schnappverschluss: Federzunge im Deckel, Rasttasche im Eckpfosten
snap_y = (l / 2 + p_clr + lo / 2) / 2; // Mitte des Eckpfostens
snap_w = post - 1.6;                   // Zungenbreite, bleibt im Pfosten
snap_d = 0.4;                          // Tiefe der Rastnase
snap_h = 2;                            // Höhe der Rastnase
snap_z = 2;                            // Höhe über der Deckelunterkante
snap_gap = 0.8;                        // Schlitz neben der Zunge
snap_clr = 0.3;                        // Spiel in der Rasttasche

module schlitz() {
  // Papierkanal, nach oben offen
  up((foot + 1) / 2)
    right(lo / 2 - lip - p_t / 2)
      cube([p_t, l + 2 * p_clr, lz - foot + 1], center=true);
  // Sichtfenster in der Frontlippe
  up((foot + lip_w + 1) / 2)
    right(lo / 2 - lip + (lip + 1) / 2)
      cube([lip + 1, l - 2 * lip_w, lz - foot - lip_w + 1], center=true);
}

module rasttasche() {
  up(lz / 2 - d_lap + snap_z)
    right(lo / 2 - (snap_d + snap_clr) / 2 + 0.5)
      back(snap_y)
        cube([snap_d + snap_clr + 1, snap_w + 2 * snap_clr,
              snap_h + 2 * snap_d + 2 * snap_clr], center=true);
}

module box() {
  difference() {
    cube([lo, lo, lz], center=true);
    up(w / 2)
      cube([li, li, lz - w], center=true);
    for (a = [0, 90, 180, 270])
      rotate([0, 0, a]) {
        schlitz();
        rasttasche();
      }
  }
}

module zungen_schlitz() {
  // zwei senkrechte Schlitze stellen die Zunge frei
  for (s = [-1, 1])
    up((dh - w) / 2)
      right(lo / 2 + 1)
        back(snap_y + s * (snap_w + snap_gap) / 2)
          cube([w + 2, snap_gap, dh - w], center=true);
  // Freiraum hinter der Zunge, damit sie auf voller Länge federt
  up((d_lap + dh - w) / 2)
    right((d_rim + (lo + t) / 2) / 2)
      back(snap_y)
        cube([(lo + t) / 2 - d_rim, snap_w + 2 * snap_gap, dh - w - d_lap], center=true);
}

module rastnase() {
  up(snap_z)
    back(snap_y)
      hull() {
        right((lo + t) / 2 + 0.25)
          cube([0.5, snap_w, snap_h + 2 * snap_d], center=true);
        right((lo + t) / 2 - snap_d + 0.05)
          cube([0.1, snap_w, snap_h], center=true);
      }
}

module deckel() {
  difference() {
    up(dh / 2)
      cube([lo + w + t, lo + w + t, dh], center=true);
    // unterer Teil schiebt sich über die Box
    up(d_lap / 2)
      cube([lo + t, lo + t, d_lap], center=true);
    // darüber die Schulter, läuft frei am Papier vorbei
    up((d_lap + dh - w) / 2)
      cube([2 * d_rim, 2 * d_rim, dh - w - d_lap], center=true);
    for (a = [0, 90, 180, 270])
      rotate([0, 0, a])
        zungen_schlitz();
  }
  for (a = [0, 90, 180, 270])
    rotate([0, 0, a])
      rastnase();
}

module ohr() {
  diff()
    prismoid([10, 4], [0, 4], shift=[0, 0], h=10)
      attach(TOP + RIGHT, FWD + LEFT, inside=true)
        rounding_edge_mask(r=2, l=$edge_length + 6);
}

module tonie() {
  up(lz / 2 + 6)
    right(20)
      scale(3)
        ohr();
  up(lz / 2 + 6)
    left(20)
      scale(2)
        ohr();
  box();
  up(lz / 2 - d_lap)
    deckel();
}

up(dh)
  rotate([0, 180, 0])
    deckel();

left(140)
  up(lz / 2)
    box();

fwd(110)
left(20)
scale(2)
  ohr();

fwd(110)
right(20)
scale(3)
  ohr();
