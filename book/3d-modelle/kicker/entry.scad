include <BOSL2/std.scad>
depth = 9;
radius = 17.5;
rim = 2;
thickness = 1;
$fn = 100;

module entry() {
  union() {
    back_half()
      tube(h=depth, or=radius + thickness, wall=thickness);
    down(depth / 2 - thickness / 2)
      tube(h=thickness, ir=radius, or=radius + rim);
    difference() {
      up(depth / 2)
        top_half()
          back_half()
            sphere(radius + thickness);
      up(depth / 2)
        top_half()
          back_half()
            sphere(radius);
    }
  }
}

entry();
