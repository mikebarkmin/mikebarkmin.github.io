include <BOSL2/std.scad>

$fn = 100;
box_wall_thickness = 2;
box_w = 75 + box_wall_thickness * 2;
box_l = 75 + box_wall_thickness * 2;
box_h = 36.2 + box_wall_thickness + 1;
cable_channel_h = 12;
cable_channel_w = 22;
bolt_r = 10;

module bolt_cover(r = 10, l = 20, anchor = RIGHT + TOP, spin = 0, orient = UP) {
  attachable(anchor=anchor, spin=spin, orient=orient, size=[l, r*2, r*1.5]) {
      cuboid([l, r*2, r*1.5], rounding=r, edges=[LEFT + FWD, LEFT + BACK]);
    children();
  }
}

diff()
  cuboid([box_w, box_l, box_h], rounding=8, edges=[LEFT + FWD, RIGHT + FWD, LEFT + BACK, RIGHT + BACK]) {
    position(BACK + TOP)
      tag("remove") cuboid([cable_channel_w, 10, cable_channel_h], anchor=BACK + TOP);
    position(CENTER)
      translate([0, 0, 2 * box_wall_thickness])
        tag("remove") cuboid([box_w - 2 * box_wall_thickness, box_l - 2 * box_wall_thickness, box_h], rounding=8, edges=[LEFT + FWD, RIGHT + FWD, LEFT + BACK, RIGHT + BACK], anchor=CENTER);
    position(LEFT + TOP)
      bolt_cover(r=bolt_r, l=15);
    position(LEFT + TOP)
      translate([box_wall_thickness*2, 0, 0])
      tag("remove") bolt_cover(r=bolt_r-box_wall_thickness, l=15 + box_wall_thickness / 2);
    position(RIGHT + TOP)
      mirror([1, 0, 0]) bolt_cover(r=bolt_r, l=15);
    position(RIGHT + TOP)
      translate([-box_wall_thickness*2, 0, 0])
      tag("remove") mirror([1, 0, 0]) bolt_cover(r=bolt_r-box_wall_thickness, l=15 + box_wall_thickness / 2);
  }
