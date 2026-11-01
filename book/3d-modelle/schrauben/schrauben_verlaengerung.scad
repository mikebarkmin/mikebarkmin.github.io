include <BOSL2/std.scad>
include <BOSL2/threading.scad>

// Schraubenverlängerung: Zylinder mit durchgehendem M8-Innengewinde,
// separate Gabel zum Aufstecken und passende M8-Gewindestange ohne Kopf

Thread_D = 8;
Pitch = 1.25;

/* [Verlängerung] */
Length = 35;
Wall_Thickness = 2.0;

// Holes shrink in FDM, require more clearance
Clearance_Female = 0.2;

// Chamfer at z=0 to prevent elephant foot from blocking the thread
Elephant_Foot_Comp = 1.0;

/* [Gabel] */
// Two arms that grip the beam on both sides and take the bending load off the screw.
// Printed lying on its side, so the layers run along the arms.
Beam_Thickness = 14;
Beam_Clearance = 0.4;
Arm_Thickness = 4;
Arm_Width = 20;
Arm_Height = 20;
Base_Thickness = 3;
Rounding = 1.5;

// Pocket in the bottom of the fork that the top of the cylinder slides into
Pocket_Depth = 5;
Pocket_Clearance = 0.3;

// Clearance hole for the rod through the fork base
Rod_Hole_D = 8.2;

Cylinder_D = Thread_D + Wall_Thickness*2;
Gap = Beam_Thickness + Beam_Clearance;
Fork_Length = Gap + Arm_Thickness*2;
Base_Height = Pocket_Depth + Base_Thickness;

/* [Schraube] */
Screw_Length = 40;

// Print the rod lying down: layers run along the rod, much stronger against bending
Screw_Lying = true;

// Flat cut on bottom and top of the lying rod, gives a flat face on the bed
Screw_Flat = 1.0;

// Clearance for male threads
Clearance_Male = 0.05;

$fn = 72;

// U-shaped side profile with all corners rounded (outer) and filleted (inner)
module fork_profile() {
    offset(r=Rounding) offset(delta=-Rounding)
    offset(r=-Rounding) offset(delta=Rounding)
    union() {
        translate([-Fork_Length/2, 0])
            square([Fork_Length, Base_Height]);

        for (side = [-1, 1])
            translate([side * (Gap + Arm_Thickness)/2 - Arm_Thickness/2, 0])
                square([Arm_Thickness, Base_Height + Arm_Height]);
    }
}

// Modelled upright (arms up, pocket at the bottom). The profile is extruded along Y,
// so when printed lying on the front face all rounded edges are vertical and the
// holes are teardrops pointing to +Y, which prints without support.
module fork() {
    difference() {
        rotate([90, 0, 0])
            linear_extrude(Arm_Width, center=true)
                fork_profile();

        // Flat-topped teardrop, keeps enough wall above the pocket
        translate([0, 0, Pocket_Depth/2 - 0.01])
            rotate([-90, 0, 0])
                teardrop(d=Cylinder_D + Pocket_Clearance, l=Pocket_Depth + 0.02,
                         cap_h=(Cylinder_D + Pocket_Clearance)/2 + 1);

        translate([0, 0, Base_Height/2])
            rotate([-90, 0, 0])
                teardrop(d=Rod_Hole_D, l=Base_Height + 2);
    }
}

// Verlängerung
difference() {
    cylinder(d=Cylinder_D, h=Length);

    translate([0, 0, Length/2])
        threaded_rod(d=Thread_D + Clearance_Female, l=Length + 0.2, pitch=Pitch, internal=true, bevel=true);

    translate([0, 0, -0.01])
        cylinder(d1=Thread_D + Elephant_Foot_Comp*2, d2=Thread_D, h=Elephant_Foot_Comp);
}

// Gabel, lying on its side
translate([0, -Cylinder_D/2 - 5, Arm_Width/2])
    rotate([90, 0, 0])
        fork();

// Gewindestange
Screw_D = Thread_D - Clearance_Male;

if (Screw_Lying) {
    translate([0, Cylinder_D/2 + Screw_D/2 + 5, Screw_D/2 - Screw_Flat])
        difference() {
            threaded_rod(d=Screw_D, l=Screw_Length, pitch=Pitch, bevel=true, orient=RIGHT);

            for (side = [-1, 1])
                translate([0, 0, side * (Screw_D/2 - Screw_Flat)])
                    cuboid([Screw_Length + 2, Screw_D + 2, Screw_D], anchor=side > 0 ? BOTTOM : TOP);
        }
} else {
    translate([Cylinder_D/2 + 10, 0, Screw_Length/2])
        threaded_rod(d=Screw_D, l=Screw_Length, pitch=Pitch, bevel=true);
}
