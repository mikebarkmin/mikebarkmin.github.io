include <BOSL2/std.scad>

$fn = 100;

/* [Rail] */
// Width of the rectangular rail the clip snaps onto (mm)
rail_w = 4;
// Height of the rectangular rail (mm)
rail_h = 3;
// Clearance on each side of the rail width - smaller = snugger (mm)
rail_clearance_w = 0.05;
// Clearance above the rail height - smaller = snugger (mm)
rail_clearance_h = 0.15;

/* [Clip] */
// Length of the clip along the rail (mm)
clip_len = 16;
// Wall thickness of the clip sides (mm)
wall = 1.2;
// How far the retaining lips reach in under the rail (mm)
lip_reach = 0.7;
// Height of the retaining lips / how far the rail is lifted off the wall bottom (mm)
lip_height = 1;
// Lead-in chamfer on the lips so the rail funnels in (mm)
lip_chamfer = 0.6;

/* [Label plate] */
// Length of the label plate, along the rail - keep >= clip length (mm)
plate_l = 24;
// Width of the label plate, sticking out to the side (mm)
plate_w = 18;
// Thickness of the label plate (mm)
plate_t = 1.6;
// Corner rounding of the plate (mm)
plate_rounding = 2;

/* [Preview] */
// Show the rail in the preview (never exported)
show_rail = true;

/* [Hidden] */
ch_w    = rail_w + 2 * rail_clearance_w;   // channel inner width  (Y)
ch_h    = rail_h + rail_clearance_h;       // channel inner height (Z)
outer_w = ch_w + 2 * wall;                 // outside width of the clip
ceil_z  = lip_height + ch_h;               // top of the walls = underside of the plate

// =========================================================================
// Clip
//
// A C-shaped channel that grips a rectangular rail.  The rail rests on the
// two inward lips (lifted `lip_height` off the wall bottom) and is held down
// by them; the plate on top stops it lifting out.  The lips carry a lead-in
// chamfer on the inner bottom edge so the mouth funnels the rail in.
// =========================================================================
module clip() {
    // Side walls + retaining lips, mirrored across the centre plane.
    mirror_copy([0, 1, 0]) {
        // Wall.
        translate([0, ch_w / 2 + wall / 2, ceil_z / 2])
            cuboid([clip_len, wall, ceil_z]);

        // Retaining lip: lead-in chamfer on the inner bottom edge so the
        // mouth funnels the rail in, while the flat top face keeps a square
        // 90 deg edge that locks under the rail.
        translate([0, ch_w / 2 - lip_reach, 0])
            cuboid([clip_len, lip_reach + wall, lip_height],
                   chamfer = lip_chamfer,
                   edges   = FRONT + BOTTOM,
                   anchor  = FRONT + BOTTOM);
    }
}

// =========================================================================
// Label plate
//
// Flat plate for a sticker and the closed top of the clip in one.  One long
// edge is flush with the clip wall; the plate sits on the full clip top and
// cantilevers out to one side.
// =========================================================================
module plate() {
    y_off = (plate_w - outer_w) / 2;   // flush with the -Y clip wall
    translate([0, y_off, 0])
        cuboid([plate_l, plate_w, plate_t],
               rounding = plate_rounding,
               edges    = "Z",
               anchor   = BOTTOM);
}

// =========================================================================
// Assembly
//
// Print recommendation: plate flat on the bed, clip pointing up.  The
// channel then opens upwards and the lip chamfers are self-supporting.
// =========================================================================
module ablage_clip() {
    clip();
    translate([0, 0, ceil_z])
        plate();
}

ablage_clip();

if (show_rail && $preview)
    color([0.5, 0.5, 0.5, 0.3])
        translate([0, 0, lip_height + rail_clearance_h / 2 + rail_h / 2])
            cuboid([clip_len + 40, rail_w, rail_h]);
