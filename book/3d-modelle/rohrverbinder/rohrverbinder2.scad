include <BOSL2/std.scad>
$fn = 100;

wall = 2;
to_d = 48;
from_d = 70.3;
l = 30;

union() {
  color("green")
    down(l)
    difference() {
      skin(
        [
          circle(d=from_d),
          circle(d=from_d),
        ], z=[0, l], slices=10
      );
      skin(
        [
          circle(d=from_d - wall * 2),
          circle(d=from_d - wall * 2),
        ], z=[0, l], slices=10
      );
    }
  color("blue")
    difference() {
      skin(
        [
          circle(d=from_d),
          circle(d=from_d),
          fwd(11, circle(d=to_d)),
        ], z=[0, 3, 20], slices=10
      );
      skin(
        [
          circle(d=from_d - wall * 2),
          circle(d=from_d - wall * 2),
          fwd(11, circle(d=to_d - wall * 2)),
        ], z=[0, 3, 20], slices=10
      );
      back(from_d / 2 / 3 * 2.2) cuboid([from_d / 2, 10, 20], rounding=5, anchor=BOTTOM + BACK);
    }

  color("red")
    union() {
      fwd(11)for (i = [0:2])
        up(20 + i * 10)
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
}
