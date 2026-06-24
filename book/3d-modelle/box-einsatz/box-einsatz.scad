include <BOSL2/std.scad>
$fn = 100;

/* [Box Dimensions] */
// Width of the box (mm)
w = 154;
// Length of the box (mm)
l = 204;
// Height of the box (mm)
h = 26;

/* [Grid] */
// Wall thickness of the dividers (mm)
wall = 0.8;
// Number of rows
rows = 3;
// Number of columns
columns = 3;

/* [Rounding] */
// Radius of the rounded edges (mm)
rounding = 6;
// Round the left-front vertical edge
rounded_edge_left_front  = true;
// Round the left-back vertical edge
rounded_edge_left_back   = true;
// Round the right-front vertical edge
rounded_edge_right_front = false;
// Round the right-back vertical edge
rounded_edge_right_back  = false;

/* [Hidden] */
_edges = [
    if (rounded_edge_left_front)  LEFT + FRONT,
    if (rounded_edge_left_back)   LEFT + BACK,
    if (rounded_edge_right_front) RIGHT + FRONT,
    if (rounded_edge_right_back)  RIGHT + BACK,
];

_tube_rounding = [
    rounded_edge_right_back ? rounding : 0,
    rounded_edge_left_back   ? rounding : 0,rounded_edge_left_front  ? rounding : 0,
    rounded_edge_right_front ? rounding : 0,
];


union() {
    rect_tube(size=[w, l], wall=wall, h=h, rounding=_tube_rounding);
    cuboid([w, l, 0.2], rounding=rounding, edges=_edges) {
        for (i = [1:rows-1]) {
            position(BACK)
                translate([0, -l / rows * i, 0])
                    cuboid([w, wall, h], anchor=BOTTOM);
        }
        for (i = [1:columns-1]) {
            position(LEFT)
                translate([w / columns * i, 0, 0])
                    cuboid([wall, l, h], anchor=BOTTOM);
        }
    }
}