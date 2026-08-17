include <BOSL2/std.scad>
$fn = 120;

// Set this to render only what you need:
// "both"  -> full assembled model (red on top of white, as before)
// "red"   -> red parts only, flattened to z=0 so it prints flat
// "white" -> white base only
part = "red"; // ["both", "red", "white"]

contour_h = 0.4;
h = 2.1 - contour_h;

// z offset for red geometry: 0 when printing red on its own, h when combined
red_z = (part == "red") ? 0 : h;

module label(t = "CECI", size = 10) {
  if (part == "both" || part == "red")
    color("red")
      translate([0, 0, red_z])
        linear_extrude(height=contour_h)
          text(t, font="Storytime", size=size);
  if (part == "both" || part == "white")
    color("white")
      linear_extrude(height=h)
        offset(3)
          text(t, font="Storytime", size=size);
}

if (part == "both" || part == "red")
  translate([0, 0, red_z])
    color("red")
      linear_extrude(height=contour_h)
        import("./logo_fill.svg");

if (part == "both" || part == "white") {
  color("white")
    linear_extrude(height=h)
      offset(3)
        import("./logo_fill.svg");

  diff() {
    translate([10, -6, 0])
      color("white")
        cuboid([10, 42, h], anchor=BOTTOM, rounding=5, edges=[FRONT + LEFT, FRONT + RIGHT]) {
          translate([0, 2, 0])
            position(FRONT + CENTER)
              tag("remove") cyl(r=3, h=h + 1, anchor=FRONT);
        }
  }
}

translate([-5, 0.5, 0]) {
  translate([15, -20, 0])
    rotate([0, 0, 90]) {
      label("CECI");
    }
  translate([5, -0.5, 0])
    label("1907", size=5);
  rotate([0, 0, 90])
    translate([-20, -22, 0])
      label("Düsseldorf", size=5);

  if (part == "both" || part == "red") {
    color("red")
      translate([18.2, -16.5, red_z])
        cyl(r=0.4, h=contour_h, anchor=BOTTOM);
    color("red")
      translate([18.2, -15.2, red_z])
        cyl(r=0.4, h=contour_h, anchor=BOTTOM);
  }
}
