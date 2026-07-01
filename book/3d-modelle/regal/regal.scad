include <BOSL2/std.scad>
include <BOSL2/walls.scad>

module leg(anchor) {
  attachable(size=([20, 20, 50]), anchor=anchor) {
    cuboid([20, 20, 50]) {
      position(BOTTOM) {
        cuboid([15, 15, 5]);
      }
    }
    children();
  }
}

module regal() {
  diff() {
    hex_panel([360, 240, 5], strut=1.5, spacing=10, frame=20) {
      // Stützen
      position(FRONT + LEFT) {
        leg(anchor=FRONT + LEFT + TOP);
        translate([2.5, 2.5, 0]) {
          tag("remove") cuboid([15, 15, 5], anchor=BOTTOM + LEFT + FRONT);
        }
      }
      position(FRONT + RIGHT) {
        leg(anchor=FRONT + RIGHT + TOP);
        translate([-2.5, 2.5, 0]) {
          tag("remove") cuboid([15, 15, 5], anchor=BOTTOM + RIGHT + FRONT);
        }
      }
      position(BACK + LEFT) {
        leg(anchor=BACK + LEFT + TOP);
        translate([2.5, -2.5, 0]) {
          tag("remove") cuboid([15, 15, 5], anchor=BOTTOM + LEFT + BACK);
        }
      }
      position(BACK + RIGHT) {
        leg(anchor=BACK + RIGHT + TOP);
        translate([-2.5, -2.5, 0]) {
          tag("remove") cuboid([15, 15, 5], anchor=BOTTOM + RIGHT + BACK);
        }
      }
    }
  }
}

regal();
