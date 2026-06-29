include <BOSL2/std.scad>

$fn = 60;

r = 9;
thickness = 1;

module pin() {
  cuboid([thickness * 4, thickness * 2, 14], anchor=BOTTOM) {
    position(TOP + FRONT)
      cuboid([thickness * 4, thickness * 3, 2], anchor=BOTTOM + FRONT, rounding=0.5, edges=[TOP]);
  }
}

tube(or=r + thickness * 2, ir=r, h=35) {
  position(TOP)for (i = [0:5]) {
    rotate([0, 0, i * 360 / 6])
      translate([0, r + thickness, -4]) {
        pin();
      }
  }
}
