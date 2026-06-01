// =============================================
//  Cleaning Robot Challenge — Winner Medal
//  Lego Mindstorms Edition
// =============================================
//  Award medal / keychain for winning the
//  Mindstorms cleaning robot challenge.
//  Icon: sweeping broom + laurel wreath + star.
//
//  Print face-UP (face on top, flat back on bed).
//  No supports needed.
//  ~40 mm diameter, ~6 mm total height
// =============================================

$fn = 72;

/* ─── Medal body ────────────────────────────── */
M_R   = 20;   // radius (mm) → 40 mm diameter
M_H   =  5;   // base thickness

/* ─── Raised rim on face ─────────────────────── */
RIM_H = 1.0;  // rim height above face
RIM_W = 1.8;  // rim radial width

/* ─── Keychain hole (through face, near top) ─── */
K_R    = 2.8;  // hole radius  (fits standard split ring)
K_WALL = 1.8;  // minimum wall around hole
HOLE_Y = M_R - K_R - K_WALL;  // = 15.4

/* ─── Standard relief height above face ─────── */
REL = 0.9;

/* ─── Broom icon ─────────────────────────────── */
BROOM_A  = -30;   // tilt angle (negative = clockwise, handle upper-right)
BROOM_Y  =  -1;   // broom geometric centre y on medal face

HANDLE_W = 1.8;   // handle rod width
HANDLE_L = 11.0;  // handle rod length

BIND_H   = 1.8;   // binding collar height
BIND_W   = 8.0;   // binding collar width

BRIST_H  = 5.0;   // bristle block height
BRIST_TW = 7.0;   // bristle width at top  (narrow end, at binding)
BRIST_BW = 13.0;  // bristle width at base (wide sweep end)

/* ─── Laurel wreath ──────────────────────────── */
LEAF_R = M_R * 0.78;  // arc radius for leaves

/* ─── Year label ─────────────────────────────── */
YEAR_Y  = -14.0;  // centre y of "26" text
YEAR_SZ =   5.0;  // font size


/* ════════════════ 2D helpers ════════════════ */

module rrect(w, h, r) {
    hull() {
        translate([ w/2 - r,  h/2 - r]) circle(r = r);
        translate([-w/2 + r,  h/2 - r]) circle(r = r);
        translate([ w/2 - r, -h/2 + r]) circle(r = r);
        translate([-w/2 + r, -h/2 + r]) circle(r = r);
    }
}


/* ════════════════ Medal base ════════════════ */

module medal_base() {
    difference() {
        cylinder(r = M_R, h = M_H);
    }
}

module medal_rim() {
    translate([0, 0, M_H])
    difference() {
        cylinder(r = M_R,         h = RIM_H);
        cylinder(r = M_R - RIM_W, h = RIM_H + 0.1);
    }
}

// Through-hole for keyring / ribbon (subtracted in assembly)
module keychain_hole() {
    translate([0, HOLE_Y, -0.1])
        cylinder(r = K_R, h = M_H + RIM_H + 0.2);
}

// Raised ring that reinforces and frames the keychain hole
module hole_boss() {
    translate([0, HOLE_Y, M_H])
    difference() {
        cylinder(r = K_R + K_WALL, h = RIM_H);
        cylinder(r = K_R,          h = RIM_H + 0.1);
    }
}


/* ════════════════ Broom icon ════════════════
   Raised silhouette: handle rod + binding
   collar + tapered bristle head.
   ═════════════════════════════════════════════ */

module broom_icon() {
    translate([0, BROOM_Y, M_H])
    rotate([0, 0, BROOM_A])
    linear_extrude(height = REL)
    union() {
        // Handle rod
        translate([0, BIND_H/2 + HANDLE_L/2])
            square([HANDLE_W, HANDLE_L], center = true);

        // Binding collar
        square([BIND_W, BIND_H], center = true);

        // Bristle head (trapezoid — wide at sweep end)
        translate([0, -(BIND_H/2 + BRIST_H/2)])
        polygon([
            [-BRIST_TW/2,  BRIST_H/2],
            [ BRIST_TW/2,  BRIST_H/2],
            [ BRIST_BW/2, -BRIST_H/2],
            [-BRIST_BW/2, -BRIST_H/2]
        ]);
    }

    // Extra raised band on the binding collar for emphasis
    translate([0, BROOM_Y, M_H + REL])
    rotate([0, 0, BROOM_A])
    linear_extrude(height = REL * 0.5)
        square([BIND_W, BIND_H * 0.5], center = true);
}


/* ════════════════ Decorations ════════════════ */

module laurel_branch(side) {
    // 5 oval leaves swept along an arc at radius LEAF_R
    for (i = [0 : 4]) {
        a  = side * (62 + i * 20);
        translate([LEAF_R * sin(a), LEAF_R * cos(a), M_H])
            rotate([0, 0, a + 90])        // long axis follows arc tangent
            linear_extrude(height = 0.7)
                scale([0.5, 1, 1]) circle(r = 2.0);
    }
}

module year_label() {
    translate([0, YEAR_Y, M_H])
    linear_extrude(height = REL * 1.4)
        text("26", size = YEAR_SZ,
             halign = "center", valign = "center",
             font = "Liberation Sans:style=Bold");
}


/* ════════════════ Assembly ════════════════ */

module trophy_medal() {
    difference() {
        union() {
            color("white")
            medal_base();
            color("brown")
            medal_rim();
            color("brown")
            hole_boss();
            color("brown")
            broom_icon();
            color("brown")
            laurel_branch( 1);
            color("brown")
            laurel_branch(-1);
            color("brown")
            year_label();
        }
        keychain_hole();
    }
}

trophy_medal();
