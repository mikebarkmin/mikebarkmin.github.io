include <BOSL2/std.scad>
$fn = 120;

contour_h = 0.4;
h = 1 - contour_h;

module logo() {
  scale([1, 1, 1])
    import("./logo_fill.svg");
}

cyl(d=52, h=h, anchor=BOTTOM);

translate([0, 0, h])
  color("red")
    tube(od=42, id=41, h=contour_h, anchor=BOTTOM);
translate([0, 0, h])
  color("red")
    tube(od=52, id=51, h=contour_h, anchor=BOTTOM);
translate([-15, -20, h])
  color("red")
    linear_extrude(height=contour_h)
      logo();

path_dus = path3d(arc(360, d=46, angle=[180, 360]));
kern_dus = [1, 1, 1, 1, 1, -0.2, 1, 1, 0.5];
color("red")
  translate([0, 0, h])
    path_text(path_dus, "Düsseldorf", font="Roboto Condensed", size=3, lettersize=2, normal=UP, center=true, kern=kern_dus, valign="center", textmetrics=true);

path_ceci = path3d(arc(360, d=47, angle=[270, -90]));
kern_ceci = [1, 1, 1, 0, 0, 0, 1, 1, 0, 1, 0, 1.7, 0.5, 0.5, 0.2, -0.5, 0.5];
translate([0, 0, h])
  color("red")
    path_text(path_ceci, "Cecilien-Gymnasium", font="Roboto Condensed", size=3, lettersize=2, normal=UP, center=true, kern=kern_ceci, valign="center", textmetrics=true);

translate([0, 0, h])
  color("red")
    arc_copies(r=23, n=7, sa=160, ea=220) if ($idx == 3)
      linear_extrude(height=contour_h)
        star(n=5, r=2, ir=1);
    else
      cyl(d=1, h=contour_h, anchor=BOTTOM + CENTER);

mirror([1, 0, 0])
translate([0, 0, h])
  color("red")
    arc_copies(r=23, n=7, sa=160, ea=220) if ($idx == 3)
      linear_extrude(height=contour_h)
        star(n=5, r=2, ir=1);
    else
      cyl(d=1, h=contour_h, anchor=BOTTOM + CENTER);
