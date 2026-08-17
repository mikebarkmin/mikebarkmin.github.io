include <BOSL2/std.scad>

$fn = 120;

contour_h = 0.4;
h = 2.1 - contour_h;

module einkaufschip() {
  color("white")
    cyl(d=23, h=h, anchor=BOTTOM);

  color("red") {
    translate([0, 0, h])
      tube(od=23, id=21, h=contour_h, anchor=BOTTOM);
    translate([-9.3, -9.5, h])
      linear_extrude(height=contour_h)
        scale([0.5, 0.5, 1])
          import("./logo_fill.svg");

    translate([0, 2, 0]) {
      translate([0, -5, h])
        linear_extrude(h=contour_h)
          text("CECI", font="Roboto Condensed", size=3);
      translate([0, -8.2, h])
        linear_extrude(h=contour_h)
          text("DUS", font="Roboto Condensed", size=3);
      translate([8, -8.1, h])
        rotate([0, 0, 90])
          linear_extrude(h=contour_h)
            text("1907", font="Roboto Condensed", size=1);
    }
  }
}

module anhaenger() {
  diff() {
    cuboid([14, 30, h], anchor=BOTTOM + BACK, rounding=7, edges=[FRONT + LEFT, FRONT + RIGHT]) {
      position(FRONT + CENTER)
        translate([0, 2, 0])
          tag("remove") cyl(d=6, h=h + 1, anchor=FRONT);
    }
    tag("remove") #cyl(d=23, h=h + 1, anchor=BOTTOM);
  }
}

module anhaenger_2() {
  color("white") diff() {
      hull() {
        cyl(d=23, h=h, anchor=BOTTOM);
        translate([0, -30, 0])
          cyl(d=12, h=h, anchor=BOTTOM);
      }
      tag("remove") cyl(d=23, h=h, anchor=BOTTOM);
      translate([0, -30, 0])
        tag("remove") cyl(d=6, h=h + 1, anchor=BOTTOM);
    }
}

union() {
  einkaufschip();
  anhaenger_2();
}
