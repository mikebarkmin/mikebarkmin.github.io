include <BOSL2/std.scad>

$fn = 150;

h = 35;
r = 20;
w = 2;

tube(h=h, or2=r, ir2=r-w, or1=r*4/5, ir1=r*4/5-w, rounding2=w/2) {
  position(BOTTOM)
    cyl(h=w, r=r*4/5, anchor=BOTTOM);
}
