include <BOSL2/std.scad>

$fn = 120;

ow = 83; // Äußerer Abstand der Stangen
r = 8.2; // Radius der Stange

buckle_w = 27.9;
buckle_l = 34;
buckle_h = 7.2;
tongue_r = 7.2;
buckle_wall = 4;

h = buckle_h;

diff() {
  cuboid([ow + 10, r, h], anchor=BOTTOM + BACK, rounding=2, edges=[LEFT+FWD, RIGHT+FWD]) {
    position(CENTER + FRONT + TOP)
      cuboid([ow  - 3 * r, r*1.7, h], anchor=BOTTOM + FRONT, rounding=2, edges=[TOP+FWD]);
    position(CENTER + BACK + TOP)
      cuboid([ow + 10, 2 * r, h], anchor=FRONT + TOP);
    position(CENTER + FRONT + TOP)
      translate([ow / 2, 0, 0])
        tag("remove")
          cuboid(
            [r*2, r*3, h * 2], anchor=RIGHT, rounding=r, edges=[
              BACK+LEFT, BACK+RIGHT,
            ]
          );
    position(CENTER + FRONT + TOP)
      translate([-ow / 2, 0, 0])
        tag("remove")
          cuboid(
            [r*2, r*3, h * 2], anchor=LEFT, rounding=r, edges=[
              BACK+LEFT, BACK+RIGHT,
            ]
          );
    position(FRONT + BOTTOM)
      translate([0, buckle_l / 2 + buckle_wall - tongue_r, 0])
        cuboid([buckle_w + buckle_wall * 2, buckle_l + buckle_wall * 2, buckle_h + buckle_wall], anchor=BOTTOM + BACK) {
          position(CENTER + FRONT)
            tag("remove") cuboid([buckle_w, buckle_l, buckle_h], anchor=FRONT);
          position(LEFT + CENTER)
          translate([0, -buckle_wall, 0])
            tag("remove")
              cyl(h=buckle_h + buckle_wall, r=tongue_r);
          translate([0, -buckle_wall, 0])
          position(RIGHT + CENTER)
            tag("remove")
              cyl(h=buckle_h + buckle_wall, r=tongue_r);
        }
  }
}
