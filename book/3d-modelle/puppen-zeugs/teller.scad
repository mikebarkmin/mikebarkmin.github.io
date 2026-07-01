include <BOSL2/std.scad>

$fn = 80;

r = 50;
w = 2;
h = 12;

tube(h=h, or2=r, ir2=r-w, or1=r*7/8, ir1=r*7/8-w, rounding2=w/2) {
  position(BOTTOM)
    cyl(h=w, r=r*7/8, anchor=BOTTOM);
}
