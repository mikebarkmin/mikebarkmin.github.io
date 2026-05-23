include <BOSL2/std.scad>

// Number of score cubes
score_cubes = 5; // [1:20]
// show numbers on the score cubes
score_cube_show_numbers = true;
// Font for the score cubes
score_cube_font = "Liberation Sans"; // font
// Length of the beam
beam_length = 150;
// Width of the beam
beam_width = 6;
// Height of the posts
post_height = 20;
// Gap between the supports
support_gap = 13;
// Width of the supports
support_width = 2;
// Height of the supports
support_height = 20;

module post() {

  support_gap = support_gap + support_width;

  module support() {
    cube([support_width, support_gap, support_height], center=true);
  }

  difference() {
    union() {
      translate([-support_gap / 2 + support_width / 2, 0, -post_height + support_height / 2]) support();
      translate([support_gap / 2 - support_width / 2, 0, -post_height + support_height / 2]) support();
      cuboid([support_gap, support_gap, post_height], edges=[TOP], rounding=2);
    }
    translate([0, -support_gap / 2, post_height / 2 - support_gap / 2]) cube([beam_width + 0.1, support_gap, beam_width + 0.1], center=true);
  }
}

module beam() {
  difference() {
    cube([beam_width, beam_length, beam_width], center=true);
  }
}

module score_cube(n) {
  difference() {
    cuboid([support_gap, support_gap, support_gap], rounding=1);
    rotate([0, 0, 0]) cuboid([beam_width + 1, beam_width + 1, support_gap + 2], rounding=1);
  }
  t = str(n);
  size = support_gap - 2;
  tm = textmetrics(t, size=size, font=score_cube_font);

  module number() {
    max_width = support_gap - 4;
    scale_factor = max_width < tm.size[0] ? max_width / tm.size[0] : 1;
    linear_extrude(0.4)
      xscale(scale_factor)
        text(text=t, size=size, font=score_cube_font, halign="center", valign="center");
  }

  if (score_cube_show_numbers) {
    fwd(support_gap / 2)
      rotate([90, 270, 0])
        number();

    fwd(-support_gap / 2)
      rotate([-90, 90, 0])
        number();
  }
}

translate([-support_gap * 3, 0, 0]) rotate([90, 180, 0]) post();
translate([-support_gap * 4.5, 0, 0]) rotate([90, 180, 0]) post();
translate([-beam_width - support_gap, 0, 0]) rotate([0, 0, 180]) beam();

grid_size = ceil(sqrt(score_cubes));
for (i = [0:grid_size - 1]) {
  for (j = [0:grid_size - 1]) {
    n = i * grid_size + j;
    if (n < score_cubes) {
      translate([i * 15, j * 15, 0]) score_cube(n + 1);
    }
  }
}
