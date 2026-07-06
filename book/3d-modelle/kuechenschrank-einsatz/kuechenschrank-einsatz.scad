include <BOSL2/std.scad>
include <BOSL2/walls.scad>

// Dimensionen des Schranks
w = 565.0;
h = 240;

// Dimensionen des Druckers
dw = 240; // wirklich: 250
dl = 200; // wirklich: 220
dh = 270;

n = 3;

module raiser(h = 140, w = 240, l = 200, thickness = 8) {
  diff() {
    hex_panel([w, l, thickness*2], 15, 30, anchor=BOTTOM) {
      position(LEFT + FRONT)
        cuboid([20, 20, h-thickness*2], anchor=BOTTOM + LEFT + FRONT);
      position(RIGHT + FRONT)
        cuboid([20, 20, h-thickness*2], anchor=BOTTOM + RIGHT + FRONT);
      position(LEFT + BACK)
        cuboid([20, 20, h-thickness*2], anchor=BOTTOM + LEFT + BACK);
      position(RIGHT + BACK)
        cuboid([20, 20, h-thickness*2], anchor=BOTTOM + RIGHT + BACK);
    }
    tag("remove") 
    translate([0,0,thickness - 2])
    cuboid([w - thickness, l - thickness, h], anchor=BOTTOM);
  }
}

raiser(w = w / 3, l = dl);
