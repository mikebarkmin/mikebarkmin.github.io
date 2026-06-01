include <BOSL2/std.scad>
pen_width = 9.8;
pen_faces = 6;

rotate([0, 90, 0])
  rotate([0, 0, 30])
    tube(h=20, ir=pen_width / 2, wall=2, $fn=pen_faces);

translate([0, 0, 6])
  text3d("{BA}", h=2, size=5, atype="ycenter", center=true);
