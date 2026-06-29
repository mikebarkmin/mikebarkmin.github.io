include <BOSL2/std.scad>

$fn = 60;
width = 18;
length = width * 3;
height = 2;

module arm() {
  back_half()
    tube(ir=2, or=4, h=14) {
      back_half()
        position(TOP)
          tube(ir=2, or=5, h=2);
    }
}

module base() {
  rect_tube(size=[length, width], irounding=2, wall=4, h=height) {
    position(LEFT)
    rotate([0, 0, 90])
    back_half()
    cyl(l=height, r=width / 2);

    position(RIGHT)
    rotate([0, 0, -90])
    back_half()
    cyl(l=height, r=width / 2);
    children();
  }
}

base() {
  translate([0, width / 2, 6])
  rotate([0, 0, 180])
  arm();
  translate([-16, width / 2, 6])
  rotate([0, 0, 180])
  arm();
  translate([16, width / 2, 6])
  rotate([0, 0, 180])
  arm();

  translate([0, -width /2 , 6])
  arm();
  translate([-16, -width / 2, 6])
  arm();
  translate([16, -width /2, 6])
  arm();

  translate([length / 2, 0, 6])
  rotate([0,0,90])
  arm();

  translate([-length / 2, 0, 6])
  rotate([0,0,-90])

  arm();


}
