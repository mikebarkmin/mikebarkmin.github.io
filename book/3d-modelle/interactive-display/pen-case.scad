include <BOSL2/std.scad>

$fn = 100;
n_pens = 2;
n_tips = 4;
// hexagonal shape
pen_faces = 6;
pen_body_length = 139;
pen_width = 9.5;

eraser_length = 6;

tip_rod_length = 6;
tip_rod_d = 1.5;
tip_cyl1_length = 2;
tip_cyl1_d2 = 4;
tip_cyl1_d1 = 3;
tip_end_length = 7;
tip_end_d = 3;
tip_length = tip_rod_length + tip_cyl1_length + tip_end_length;

pen_length = pen_body_length + tip_length + eraser_length;

magnet_d = 3;
magnet_h = 2;

module tip() {
  cyl(h=tip_rod_length, r=tip_rod_d / 2, $fn=100) {
    align(BOTTOM)
      cyl(h=tip_cyl1_length, r1=tip_cyl1_d1 / 2, r2=tip_cyl1_d2 / 2, $fn=100) {
        align(BOTTOM)
          cyl(h=tip_end_length, r=tip_end_d / 2, rounding1=1, $fn=100);
      }
  }
}

module pen() {
  rotate([0,0,30])
  cyl(h=pen_body_length, r=pen_width / 2, rounding2=0.5, $fn=pen_faces) {
    // eraser 
    align(TOP)
      cyl(h=eraser_length, r=4, rounding2=1, $fn=100);
    align(BOTTOM)
      cyl(h=8.5, r2=pen_width / 2, r1=2.5, $fn=100) {
        // pen tip
        align(BOTTOM)
        translate([0, 0, tip_rod_length])
          tip();
      }
  }
}

module lid() {
  cuboid([pen_length + 20, pen_width * 2 + 20 - 4, 2]);
}

module base() {
  module pen_cutout() {
    rotate([0, 90, 0])
    translate([-4, 0, 4])
    scale(1.01)
    pen();
  }

  module tip_cutout() {
    translate([0,0,4])
    cuboid([20,6,6], rounding=2, edges=[FWD+RIGHT,FWD+LEFT,BACK+RIGHT,BACK+LEFT]);
  }

  // Three magnet holes per pen cutout, extending downward from the pen bottom
  module pen_magnet_cutouts(pen_y) {
    pen_bottom_z = 4 - pen_width / 2 * cos(30) * 1.01;
    magnet_z = pen_bottom_z - magnet_h / 2;
    for (x = [4 - pen_body_length * 1.01 / 3, 4, 4 + pen_body_length * 1.01 / 3]) {
      translate([x, pen_y, magnet_z])
        cyl(h=magnet_h, d=magnet_d, $fn=100);
    }
  }

  // Two magnet holes below the tip cutout
  module tip_magnet_cutouts() {
    magnet_z = (4 - 3) - magnet_h / 2;
    for (x = [-5, 5]) {
      translate([x, 0, magnet_z])
        cyl(h=magnet_h, d=magnet_d, $fn=100);
    }
  }

  difference() {
    cuboid([pen_length + 20, pen_width * 2 + 20, pen_width / 2 + 5], rounding=5, edges=[FWD+RIGHT,FWD+LEFT,BACK+RIGHT,BACK+LEFT]) {
    align(TOP)
    rect_tube(size=[pen_length + 20, pen_width * 2 + 20], wall=4, h= pen_width / 2 + 4, rounding=5); 
    }
    translate([-2,0,12])
    lid();
    translate([0,-10,0])
    pen_cutout();
    translate([0,10,0])
    pen_cutout();
    tip_cutout();

    pen_magnet_cutouts(-10);
    pen_magnet_cutouts(10);
    tip_magnet_cutouts();

  }
}

base();
translate([0,40,0])
scale(0.99)
lid();
