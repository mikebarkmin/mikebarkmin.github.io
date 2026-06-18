include <BOSL2/std.scad>
$fn = 100;

wall = 2;
to_d = 38;
from_d = 60;
from_ring_d = 63;

union() {
  color("green")
    difference() {
      skin(
        [
          circle(d=from_ring_d),
          circle(d=from_ring_d),
        ], z=[0, 3], slices=10
      );
      skin(
        [
          circle(d=from_ring_d - wall * 2),
          circle(d=from_ring_d - wall * 2),
        ], z=[0, 3], slices=10
      );
      fwd(from_ring_d / 2) cuboid([5, 5, 5], anchor=BOTTOM + FWD);
    }
  color("blue")
    difference() {
      skin(
        [
          circle(d=from_d),
          circle(d=from_d),
          fwd(11, circle(d=to_d)),
        ], z=[0, 3, 10], slices=10
      );
      skin(
        [
          circle(d=from_d - wall * 2),
          circle(d=from_d - wall * 2),
          fwd(11, circle(d=to_d - wall * 2)),
        ], z=[0, 3, 10], slices=10
      );
      back(from_d / 2 / 3 * 2.2) cuboid([from_d / 2, 10, 20], rounding=5, anchor=BOTTOM + BACK);
    }

  color("red")
    union() {
      fwd(11)for (i = [0:2])
        up(10 + i * 10)
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
