include <BOSL2/std.scad>

$fn = 80;

// Frame Width
w = 63.5;
// Frame Length
l = 58.5;
// Frame Height
h = 3;
// Frame Border
border = 10;

// Magnet diameter
magnet_d = 3;
// MAgnet height
magnet_h = 2;
// Magnet tolerance
magnet_tolerance = 0.3;
// Magnet placed inside the frame or outside the frame
magnet_inside = false;

// Text at the bottom of the frame
text1 = "Familien";
// Text at the top of the frame
text2 = "Momente";

// Font for the text
font = "Storytime"; // font

module magnet_cutout() {
  cylinder(d=magnet_d + magnet_tolerance, h=magnet_h + magnet_tolerance, anchor=BOTTOM);
}

module picture_frame(anchor, spin, orient) {
  attachable(size=[w + border * 2, l + border * 3, h], anchor=anchor, spin=spin, orient=orient) {
    difference() {
      cuboid([w + border * 2, l + border * 4, h], rounding=2, edges=[FRONT + LEFT, FRONT + RIGHT, BACK + LEFT, BACK + RIGHT]);
      translate([0, border, 0])
        cuboid([w, l, h], rounding=2, edges=[FRONT + LEFT, FRONT + RIGHT, BACK + LEFT, BACK + RIGHT]);
    }
    children();
  }
}

diff() {
  picture_frame() {
    position(BACK + LEFT + TOP)
      color("blue") linear_extrude(height=0.4)
          text(text1, size=12, font=font, halign="left", valign="center");

    position(BACK + LEFT + TOP)
      translate([0, 0, -h])
        linear_extrude(height=h)
          offset(delta=2)
            text(text1, size=12, font=font, halign="left", valign="center");

    position(FRONT + CENTER + TOP)
      color("blue") linear_extrude(height=0.4)
          translate([0, 11, 0])
            text(text2, size=12, font=font, halign="center", valign="center");

    // magnet holes in all four corners
    position(FRONT + LEFT + BOTTOM)
      translate([border / 2, border / 2, magnet_inside ? 0.4 : 0])
        tag("remove") magnet_cutout();

    
    position(FRONT + RIGHT + BOTTOM)
      translate([-border / 2, border / 2, magnet_inside ? 0.4 : 0])
        tag("remove") magnet_cutout();

    
    position(BACK + LEFT + BOTTOM)
      translate([border / 2, -border / 2, magnet_inside ? 0.4 : 0])
        tag("remove") magnet_cutout();

    
    position(BACK + RIGHT + BOTTOM)
      translate([-border / 2, -border / 2, magnet_inside ? 0.4 : 0])
        tag("remove") magnet_cutout();
  }
}
