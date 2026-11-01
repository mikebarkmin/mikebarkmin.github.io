/*
  Magnetic hook for a 25 x 3 mm disc magnet
  -----------------------------------------
  ASSEMBLY: the magnet slides into the pocket from the TOP EDGE of the back
  plate and clicks past a small ridge. After that it is trapped on every
  side: a thin skin towards the metal, the solid wall towards the hook, the
  pocket walls all around. Pulling the hook off a whiteboard or a fridge
  leaves the magnet in the hook, not on the board. To get it out again,
  push it back up through the slot.

  The skin costs holding force - a 3 mm magnet is very sensitive to the air
  gap, so keep it thin. back_skin = 0 gives an open back (magnet touches the
  metal, strongest hold), but then only friction and glue keep it in place.

  PRINTING: the file is already in print orientation - it lies flat on its
  side, Z is the build direction. Large flat first layer, and the layers run
  along the hook, so the load pulls *along* them instead of peeling them
  apart at the root (that is what breaks hooks printed standing up).

  The back plate has to be as wide as the magnet, the hook does not:

    hook_w = 14, hook_chamfer = 2.5  slim hook, no supports (default). The
                                     hook edges taper to a ridge so nothing
                                     is flatter than 45 deg, but the ridge
                                     under the curve still starts in mid-air
                                     - expect it to look rough down there.
    hook_w = 14, hook_chamfer = 0    same hook with flat sides. Cleanest
                                     result, but print it with supports.
    hook_w = plate width (31)        chunky version: the whole part is one
                                     extruded profile, prints perfectly with
                                     nothing at all to clean up.

  A slim hook only touches the bed with the back plate and then grows a
  25 mm cantilever sideways - use a brim.
*/

/* [Magnet] */
// Magnet diameter (mm)
magnet_d = 25;
// Magnet thickness (mm)
magnet_h = 3;
// Extra diameter so the magnet slides in (mm)
magnet_fit = 0.3;
// Extra depth of the channel (mm)
magnet_play = 0.2;
// Skin between magnet and metal - holds the magnet in, 0 = open back (mm)
back_skin = 0.8;
// Solid wall on the hook side of the magnet (mm)
front_wall = 1.6;
// How far the retaining ridge overlaps the magnet, 0 = plain slot (mm)
slot_grip = 0.25;
// Length of the lead-in ramp above that ridge (mm)
slot_ramp = 1.5;

/* [Back plate] */
// Material around the magnet (mm)
plate_margin = 3;

/* [Hook] */
// Thickness of the hook arm, seen from the side (mm)
arm_t = 5;
// Width of the hook - at or above the plate width gives the chunky version (mm)
hook_w = 14;
// 45 deg chamfer on the hook edges - arm_t/2 prints without support, 0 = flat sides (mm)
hook_chamfer = 2.5;
// Distance over which the hook widens into the plate. Keep it <= half the
// width it has to bridge, otherwise the flare becomes a >45 deg overhang (mm)
hook_flare = 7;
// Straight part of the arm before the curve (mm)
arm_len = 10;
// Radius of the hook curve, centre line (mm)
hook_r = 7;
// Sweep of the curve - 180 = tip points straight back, less opens the mouth (deg)
hook_sweep = 170;

/* [Details] */
// Radius of the fillets in the inner corners (mm)
fillet = 3;
// Rounding of the outer edges of the profile (mm)
edge_round = 0.8;
// Segments of the hook curve
hook_steps = 48;
// Segments of the straight arm - only needed so the flare comes out smooth
arm_steps = 8;

$fn = 96;

/* ---------- Derived ---------- */

pocket_d     = magnet_d + magnet_fit;
pocket_depth = magnet_h + magnet_play;
plate_t      = back_skin + pocket_depth + front_wall;   // 5.6 mm
plate_h      = magnet_d + 2 * plate_margin;             // 31 mm
width        = plate_h;                                 // overall width of the plate

magnet_y  = plate_h / 2;                      // centre of the magnet, in use: up
magnet_z  = width / 2;                        // centre of the magnet, across the hook
arm_y     = arm_t / 2;                        // centre line of the arm
arm_end_x = plate_t + arm_len;                // where the curve starts
curve_cx  = arm_end_x;
curve_cy  = arm_y + hook_r;
root_x    = plate_t + fillet;                 // up to here the hook keeps full width
slim      = hook_w < width;

/* ---------- Centre line of the hook ---------- */

function hook_pts() = concat(
    [ for (i = [0 : arm_steps])
        [ arm_t / 2 + (arm_end_x - arm_t / 2) * i / arm_steps, arm_y ] ],
    [ for (i = [1 : hook_steps])
        let (a = -90 + hook_sweep * i / hook_steps)
        [ curve_cx + hook_r * cos(a), curve_cy + hook_r * sin(a) ] ]
);

// Full width at the root, hook_w once the flare is over
function width_at(x) =
    width + (hook_w - width) * min(1, max(0, (x - root_x) / hook_flare));

/* ---------- Body: 2D profile (X = away from the wall, Y = up) ---------- */

module seg(p1, p2) {
    hull() {
        translate(p1) circle(d = arm_t);
        translate(p2) circle(d = arm_t);
    }
}

module hook_path() {
    pts = hook_pts();
    for (i = [0 : len(pts) - 2]) seg(pts[i], pts[i + 1]);
}

module profile() {
    // Keep the back dead flat - nothing may stick out behind the magnet face
    intersection() {
        translate([0, -50]) square([200, 200]);

        // offset(+r) offset(-r) rounds the outer corners (applied last),
        // offset(-r) offset(+r) fills the inner corners with a fillet (applied first)
        offset(r =  edge_round) offset(r = -edge_round)
        offset(r = -fillet)     offset(r =  fillet)
        union() {
            square([plate_t, plate_h]);
            hook_path();
        }
    }
}

/* ---------- Width envelope for the slim hook ---------- */

// Round bead with 45 deg chamfers on both ends. Swept along the centre line
// it gives the hook a cross section that is pointed in build direction, so
// the underside never turns into a flat face hanging in the air.
module bead(p, w) {
    r = arm_t / 2 + 0.05;                     // a hair over the profile, avoids
                                              // coincident faces in the intersection
    // No chamfer where the hook is still as wide as the plate - that part sits
    // flat on the bed and must stay square. It grows in as the hook narrows.
    c = min(hook_chamfer * (width - w) / (width - hook_w), r - 0.2, w / 2);
    translate([p.x, p.y, magnet_z])
        hull() {
            cylinder(r = r,     h = max(w - 2 * c, 0.02), center = true, $fn = 32);
            cylinder(r = r - c, h = w,                    center = true, $fn = 32);
        }
}

module width_envelope() {
    // Full width around the plate so the root fillets survive the intersection
    cube([root_x, plate_h, width]);

    pts = hook_pts();
    for (i = [0 : len(pts) - 2])
        hull() {
            bead(pts[i],     width_at(pts[i].x));
            bead(pts[i + 1], width_at(pts[i + 1].x));
        }
}

module body() {
    if (slim)
        intersection() {
            linear_extrude(height = width) profile();
            width_envelope();
        }
    else
        linear_extrude(height = width) profile();
}

/* ---------- Magnet pocket ---------- */

// Circle with a 45 deg roof, cut off flat at the top of the circle. A plain
// round hole lying on its side droops at the top because every perimeter
// hangs over the one below; here nothing is flatter than 45 deg.
// Tip points towards local -X, which the rotation below turns into "up".
module teardrop_2d(r) {
    intersection() {
        hull() {
            circle(r = r);
            translate([-r * sqrt(2), 0]) circle(r = 0.01);
        }
        translate([-r, -r]) square([2 * r, 2 * r]);
    }
}

// Pocket seen from the front: the magnet seat plus the slide-in slot that
// runs out through the top edge of the plate.
module pocket_2d() {
    r = pocket_d / 2;
    union() {
        teardrop_2d(r);
        translate([-r, 0]) square([2 * r, plate_h]);
    }
}

module magnet_pocket() {
    // rotate([0,90,0]): local +Z becomes +X (the pocket axis),
    //                   local -X becomes +Z (the flat roof ends up on top),
    //                   local +Y stays +Y (the slot points up)
    translate([back_skin, magnet_y, magnet_z])
        rotate([0, 90, 0])
            linear_extrude(height = pocket_depth)
                pocket_2d();
}

// Ridge on the inner face of the front wall. The magnet snaps past it - the
// 1.6 mm wall bends out of the way - and is then held down by the flat face
// underneath.
module slot_ridge() {
    x1 = back_skin + pocket_depth;            // inner face of the front wall
    y0 = magnet_y + pocket_d / 2;             // just above the seated magnet
    d  = magnet_play + slot_grip;

    translate([0, 0, magnet_z - pocket_d / 2])
        linear_extrude(height = pocket_d)
            polygon([[x1 - d, y0], [x1, y0], [x1, y0 + slot_ramp]]);
}

/* ---------- Model ---------- */

module magnet_hook() {
    union() {
        difference() {
            body();
            magnet_pocket();
        }
        if (slot_grip > 0) slot_ridge();
    }
}

magnet_hook();
