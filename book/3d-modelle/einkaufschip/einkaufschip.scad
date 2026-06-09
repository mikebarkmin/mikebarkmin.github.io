lh = 0.2;
h = 2;
d = 23;

$fn=100;
color("black")
cylinder(d=d, h=h);

color("white")
translate([0,0,lh])
difference() {
  cylinder(d=d-3, h=h);
  cylinder(d=d-4, h=h);
}

color("white")
translate([-1,-0.5,lh])
linear_extrude(height=h)
scale(0.11)
import("./koala.svg", center=true);
