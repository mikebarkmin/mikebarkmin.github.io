include <BOSL2/std.scad>

$fn = 48;

// =============================================================================
// Schreibtisch-Organizer  "Stifte / Notiz / USB"  (kompakte Variante)
//
// Vordere Reihe:
//   1. Notiz  - flache, quadratische Mulde fuer einen Post-it-Block (76x76 mm)
//               mit Griffmulde in der Vorderwand.
//   2. USB/SD - schmaler Block mit Universal-Steckplaetzen. Jeder Schlitz ist
//               kreuzfoermig und quer angeordnet: der lange, duenne Arm nimmt
//               SD-/microSD-Karten auf, der kurze, dickere Arm USB-A-/USB-C-
//               Stecker. Der Block ist nur so breit wie ein Schlitz-Kreuz.
//
// Hintere Reihe (hinter Notiz + USB):
//   3. Stifte - zwei quadratische Becher nebeneinander mit sechseckiger
//               Innenwand. Gleich grosse Quadrat-Grundflaeche, unterschiedliche
//               Hoehen.
//
// Druck: so wie modelliert flach auf das Bett, keine Stuetzen noetig.
// =============================================================================

/* [Allgemein] */
// Wandstaerke (mm)
wall = 2.4;
// Bodenstaerke (mm)
floor_t = 2.4;
// Rundung der senkrechten Aussenkanten (mm)
corner_r = 3;
// Beschriftung an der Vorderseite eingravieren
show_labels = true;

/* [Notiz / Post-it] */
// Kantenlaenge der quadratischen Post-it-Mulde (mm)
postit_size = 78;
// Tiefe der Mulde (mm)
postit_depth = 20;
// Breite der Griffmulde in der Vorderwand (mm)
postit_scoop = 34;
// Tiefe der Griffmulde ab der Oberkante (mm)
postit_scoop_depth = 13;

/* [USB / SD - Kombibereich] */
// Anzahl der Universal-Steckplaetze
usb_slots = 5;
// Abstand der Steckplaetze von Mitte zu Mitte (mm)
usb_slot_pitch = 12;
// Schlitzbreite fuer USB-A / USB-C Stecker (mm)
usb_arm_w = 5.6;
// Schlitzlaenge fuer USB-A / USB-C Stecker (mm)
usb_arm_l = 13;
// Schlitzbreite fuer SD / microSD Karten (mm)
sd_arm_w = 2.8;
// Schlitzlaenge fuer SD / microSD Karten (mm)
sd_arm_l = 25;
// Einstecktiefe der Plaetze (mm)
usb_slot_depth = 22;
// Aussenhoehe des USB/SD-Blocks (mm)
usb_block_h = 30;
// Material rund um das Schlitzkreuz in Laengsrichtung (mm)
usb_margin = 5;
// Tiefe des USB/SD-Blocks (mm) - genug fuer die Schlitze + Rand
usb_block_d = 72;

/* [Stifte - quadratische Becher mit sechseckiger Innenwand] */
// Kantenlaenge der quadratischen Grundflaeche je Becher (0 = automatisch)
bucket_base = 0;
// Gesamthoehe des linken Bechers (mm)
bucket_h_left = 95;
// Gesamthoehe des rechten Bechers (mm)
bucket_h_right = 62;
// Wandstaerke an den Sechseck-Ecken (mm)
bucket_wall = 3;

/* [Hidden] */
eps = 0.05;

// ---- Vordere Reihe ---------------------------------------------------------
postit_ow = postit_size + 2 * wall;          // Aussenbreite Notiz-Zone
front_y   = postit_size + 2 * wall;          // Tiefe der vorderen Reihe
usb_ow    = sd_arm_l + 2 * usb_margin;       // Aussenbreite USB-Block (schmal)
usb_ox    = postit_ow - wall;                // USB-Block schliesst an Notiz an
front_x   = usb_ox + usb_ow;                 // Gesamtbreite der vorderen Reihe

postit_h  = floor_t + postit_depth;
usb_h     = usb_block_h;

// ---- Hintere Reihe (quadratische Becher) ---------------------------------
bb        = bucket_base > 0 ? bucket_base : front_x / 2;   // Kantenlaenge Quadrat
bore_d    = bb - 2 * bucket_wall;            // Eckmass der Sechseck-Bohrung

total_x   = max(front_x, 2 * bb);
bucket_y0 = front_y - wall;                  // nur mit der Notiz-Rueckwand verschweisst
bucket_x0 = (total_x - 2 * bb) / 2;

total_y   = bucket_y0 + bb;

// =============================================================================
// Bausteine
// =============================================================================

// Rechteckiger Aussenkoerper, Ecke vorne-links-unten im Ursprung.
module box_at(ox, oy, w, d, h) {
    translate([ox, oy, 0])
        cuboid([w, d, h], rounding = corner_r, edges = "Z",
               anchor = LEFT + FRONT + BOTTOM);
}

// Kreuzfoermiger, quer liegender Schlitz-Ausschnitt (oben buendig).
//   langer duenner Arm (X) -> SD / microSD
//   kurzer dicker Arm  (X) -> USB-A / USB-C
module slot_cutter() {
    d = usb_slot_depth + eps;
    union() {
        cuboid([sd_arm_l, sd_arm_w, d], chamfer = 1.2, edges = TOP, anchor = TOP);
        cuboid([usb_arm_l, usb_arm_w, d], chamfer = 1.2, edges = TOP, anchor = TOP);
    }
}

// Quadratischer Becher (Vollmaterial). Die zur Nachbarwand zeigende Kante
// bleibt ungerundet, damit beide Becher sauber aneinander stossen.
module bin_solid(cx, cy, h, keep_edge) {
    translate([cx, cy, 0])
        cuboid([bb, bb, h], anchor = BOTTOM,
               rounding = corner_r, edges = "Z", except = keep_edge);
}

// Sechseckige Bohrung eines Bechers (vom Boden bis oben offen).
module bin_bore(cx, cy, h) {
    translate([cx, cy, floor_t])
        cyl(h = h - floor_t + eps, d = bore_d, $fn = 6,
            anchor = BOTTOM, chamfer2 = 1.6);
}

// Eingravierte Beschriftung auf der Vorderwand (y = 0).
module front_label(str, cx, z, size = 5) {
    translate([cx, 0.8, z])
        rotate([90, 0, 0])
            linear_extrude(1)
                text(str, size = size, halign = "center", valign = "center");
}

// =============================================================================
// Organizer
// =============================================================================
module organizer() {
    postit_cx = postit_ow / 2;
    usb_cx    = usb_ox + usb_ow / 2;
    bucket_cx_l = bucket_x0 + bb / 2;
    bucket_cx_r = bucket_x0 + bb * 1.5;
    bucket_cy   = bucket_y0 + bb / 2;

    slot_band = usb_slots * usb_slot_pitch;
    slot_y0   = (usb_block_d - slot_band) / 2;

    difference() {
        union() {
            // Notiz-Zone
            box_at(0, 0, postit_ow, front_y, postit_h);
            // USB/SD-Block
            box_at(usb_ox, 0, usb_ow, usb_block_d, usb_h);
            // Quadratische Becher mit sechseckiger Innenwand
            bin_solid(bucket_cx_l, bucket_cy, bucket_h_left,  RIGHT);
            bin_solid(bucket_cx_r, bucket_cy, bucket_h_right, LEFT);
        }

        // --- Notiz-Mulde ---
        translate([wall, wall, floor_t])
            cuboid([postit_size, postit_size, postit_depth + eps],
                   rounding = 2, edges = "Z",
                   anchor = LEFT + FRONT + BOTTOM);

        // Griffmulde (nur durch die vordere Wand)
        translate([postit_cx, wall,
                   postit_h + postit_scoop / 2 - postit_scoop_depth])
            xcyl(l = postit_scoop, d = postit_scoop);

        // --- USB/SD Steckplaetze (quer, in Reihe nach hinten) ---
        for (i = [0 : usb_slots - 1])
            translate([usb_cx, slot_y0 + usb_slot_pitch * (i + 0.5), usb_h])
                slot_cutter();

        // --- Sechseck-Bohrungen ---
        bin_bore(bucket_cx_l, bucket_cy, bucket_h_left);
        bin_bore(bucket_cx_r, bucket_cy, bucket_h_right);

        // --- Beschriftung ---
        if (show_labels) {
            front_label("NOTIZ", postit_cx, postit_h * 0.5);
            front_label("USB SD", usb_cx, usb_h * 0.5, size = 4);
        }
    }
}

organizer();
