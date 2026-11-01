include <BOSL2/std.scad>

$fn = 100;

h = 28;
id = 12;
od = 39;
wall = 1;

union() {
  difference() {
    down(wall)
      cyl(h=h + wall, d=id + wall, anchor=BOTTOM);
    down(wall)
      cyl(h=h, d=id, anchor=BOTTOM);
  }

  difference() {
    cyl(h=h, d=od + wall, anchor=BOTTOM);
    down(wall)
      cyl(h=h, d=od, anchor=BOTTOM);
  }
}
