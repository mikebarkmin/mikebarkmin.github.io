include <BOSL2/std.scad>

$fn = 200;

// Diameters
d = [70, 71, 72, 72.5, 73.5, 74];
// Height of the ring
h = 10;

// Dynamic grid layout parameters
cols = ceil(sqrt(len(d))); // Automatically computes grid dimension for a square arrangement
spacing = max(d) + 15;     // Dynamic spacing based on maximum ring size

module ring(d = 70) {
  tube(h=h, ir=d / 2, or=d / 2 + 2, anchor=BOTTOM) {
    diff() {
      position(FWD + BOTTOM)
        cyl(h=2, r=20, anchor=BOTTOM + CENTER) {
          fwd(8)
            position(CENTER)
              linear_extrude(2)
                text(str(d), anchor=CENTER);
        }
      tag("remove") cyl(h=10, r=d / 2 + 2);
    }
  }
}

// Grid arrangement loop
for (a = [0:len(d) - 1]) {
  col = a % cols;
  row = floor(a / cols);
  
  translate([col * spacing, row * (spacing + 20), 0])
    ring(d = d[a]);
}
