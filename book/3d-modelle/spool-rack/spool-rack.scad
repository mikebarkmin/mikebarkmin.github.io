include <BOSL2/std.scad>
include <BOSL2/walls.scad>

$fn = 100;
rod_diameter = 13;
cut_through = true;
bolt_diameter = 6;
bridge_width = 230;
bridge_height = 80;

pilar_width = bridge_height / 2;
pilar_height = bridge_height + 5;
middle_width = bridge_width - pilar_width * 2;
middle_thickness = max(rod_diameter, 19);
rod_diameter_plus_threshold = rod_diameter + 0.3;

pilar_extender_height = pilar_height / 2;

module bridge() {
  module pilar() {
    difference() {
      cube([pilar_width, middle_thickness + 10, pilar_height], center=true);
      rotate([90, 0, 0])
        translate([0, 0, -middle_thickness / 2])
          cylinder(h=middle_thickness, d=rod_diameter_plus_threshold, center=true);
      rotate([90, 0, 0])
        translate([0, 0, middle_thickness / 2]) if (cut_through) {
          cylinder(h=middle_thickness, d=rod_diameter_plus_threshold, center=true);
        } else {
          cylinder(h=middle_thickness, d=bolt_diameter, center=true);
        }
      translate([0, 0, pilar_height / 2])
        cylinder(h=rod_diameter_plus_threshold * 3, d=rod_diameter_plus_threshold, center=true);
      translate([0, 0, -pilar_height / 2])
        cylinder(h=rod_diameter_plus_threshold * 3, d=rod_diameter_plus_threshold, center=true);
    }
  }

  module middle() {
    s = [
      [0, 0],
      [middle_width, 0],
      [middle_width, -bridge_height / 2 - 20],
      [middle_width - 20, -bridge_height / 2 - 10],
      [20, -bridge_height / 2 - 10],
      [0, -bridge_height / 2 - 20],
    ];
    rotate([90, 0, 0])
      translate([0, 2.5, 0])
        hex_panel(s, 2, 10, h=12, frame=5);
  }

  middle();
  translate([-pilar_width / 2, 0, -bridge_height / 2])
    pilar();
  translate([middle_width + pilar_width / 2, 0, -bridge_height / 2])
    pilar();
}

module pilar_extender() {
  union() {
    cube([pilar_width, middle_thickness + 10, pilar_extender_height], center=true);
    translate([0, 0, pilar_extender_height / 2])
      cylinder(h=rod_diameter_plus_threshold * 2.5, d=rod_diameter, center=true);
  }
}

translate([0, 50, -pilar_height / 2])
pilar_extender();

// bridge();
