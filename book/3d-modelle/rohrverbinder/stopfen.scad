include <BOSL2/std.scad>
$fn = 100;

to_d = 38.5;
wall = 2;

difference() {
  union() {
    cyl(h=6, d=to_d + 10, rounding=2);
    for (i = [0:2])
      up(i * 10)
        difference() {
          skin(
            [
              circle(d=to_d + 1),
              circle(d=to_d),
            ], z=[0, 10], slices=10
          );
          skin(
            [
              circle(d=to_d - wall * 2),
              circle(d=to_d - wall * 2),
            ], z=[0, 10], slices=10
          );
        }
  }
  // holes in the lid
  union() {
    for (i = [0:6])
      rotate(i * 360 / 7)
        fwd(to_d / 2 - 5)
          cyl(h=35, d=5);

    for (i = [0:4])
      rotate(i * 360 / 5)
        fwd(to_d / 2 - 12)
          cyl(h=35, d=5);
  }
}
