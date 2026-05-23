include <BOSL2/std.scad>
include <BOSL2/threading.scad>

r = 14;
type = "football"; // [football:Football, smooth:Smooth]

module connector() {
  threaded_rod(d=r, height=r, pitch=2, $fa=1, $fs=1);
}

module ball() {
  difference() {
    if (type == "smooth") {
      sphere(r=r, $fn=100);
    } else {
      spheroid(d=r * 2, style="icosa", circum=true, $fn=10);
    }
    connector();
  }
}

module ball_half(lower = false) {
  difference() {
    ball();
    if (lower) {
      translate([0, 0, r]) cube([r * 3, r * 3, r * 2], center=true);
    } else {
      translate([0, 0, -r]) cube([r * 3, r * 3, r * 2], center=true);
    }
  }
}

translate([-r * 2, 0, 0]) ball_half();
translate([0, 0, r / 2]) connector();
rotate([180, 0, 0]) translate([r * 2, 0, 0]) ball_half(true);
