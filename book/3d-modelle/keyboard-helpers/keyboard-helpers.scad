include <BOSL2/std.scad>

$fn = 100;

octave = 4; // octave number for the note labels (C4 = middle C)
key_body_w = 12.5; // measured white key width
connector_w = 3; // width of the connector strip at the back
bk_gap = 15.5; // measured black key gap
ww_gap = 1; // measured gap between adjacent white keys (E–F)
height = 1;
key_length = 36;
line_spacing = 2.5; // mm between staff lines

module white_key(note = "C4", staff_offset = 0) {
  // [id, y-position, Helmholtz label, clef]
  // F clef: bottom line G2 = 0  |  G clef: bottom line E4 = 0
  // Each diatonic step = line_spacing/2
  s = line_spacing / 2; // one diatonic step
  note_pos = [
    ["C1", -11 * s, "C,", "f"],
    ["D1", -10 * s, "D,", "f"],
    ["E1", -9 * s, "E,", "f"],
    ["F1", -8 * s, "F,", "f"],
    ["G1", -7 * s, "G,", "f"],
    ["A1", -6 * s, "A,", "f"],
    ["B1", -5 * s, "H,", "f"],
    ["C2", -4 * s, "C", "f"],
    ["D2", -3 * s, "D", "f"],
    ["E2", -2 * s, "E", "f"],
    ["F2", -s, "F", "f"],
    ["G2", 0, "G", "f"],
    ["A2", +s, "A", "f"],
    ["B2", 2 * s, "H", "f"],
    ["C3", 3 * s, "c", "f"],
    ["D3", 4 * s, "d", "f"],
    ["E3", 5 * s, "e", "f"],
    ["F3", 6 * s, "f", "f"],
    ["G3", 7 * s, "g", "f"],
    ["A3", 8 * s, "a", "f"],
    ["B3", 9 * s, "h", "f"],
    ["C4", -2 * s, "c'", "g"],
    ["D4", -s, "d'", "g"],
    ["E4", 0, "e'", "g"],
    ["F4", s, "f'", "g"],
    ["G4", 2 * s, "g'", "g"],
    ["A4", 3 * s, "a'", "g"],
    ["B4", 4 * s, "h'", "g"],
    ["C5", 5 * s, "c''", "g"],
    ["D5", 6 * s, "d''", "g"],
    ["E5", 7 * s, "e''", "g"],
    ["F5", 8 * s, "f''", "g"],
    ["G5", 9 * s, "g''", "g"],
    ["A5", 10 * s, "a''", "g"],
    ["B5", 11 * s, "h''", "g"],
    ["C6", 12 * s, "c'''", "g"],
    ["D6", 13 * s, "d'''", "g"],
    ["E6", 14 * s, "e'''", "g"],
    ["F6", 15 * s, "f'''", "g"],
    ["G6", 16 * s, "g'''", "g"],
    ["A6", 17 * s, "a'''", "g"],
    ["B6", 18 * s, "h'''", "g"],
  ];
  ids = [for (e = note_pos) e[0]];
  values = [for (e = note_pos) e[1]];
  labels = [for (e = note_pos) e[2]];
  clefs = [for (e = note_pos) e[3]];

  idx = search([note], ids)[0];
  pos = values[idx];
  label = labels[idx];
  clef = clefs[idx];

  // ── key body ──────────────────────────────────────────────────────────────
  color("white")
    cuboid(
      [key_body_w, key_length, height], rounding=1,
      edges=[FWD + RIGHT, FWD + LEFT],
    );

  // ── 5 staff lines ─────────────────────────────────────────────────────────
  for (l = [0:4])
    translate([-key_body_w / 2 + 2, staff_offset + l * line_spacing, 0])
      color("black")
        cube([key_body_w - 4, 0.5, height / 2 + 0.5]);

  // ── ledger lines below staff (pos < 0) ────────────────────────────────────
  for (i = [1:floor(-pos / line_spacing)])
    translate([-3.5 / 2, staff_offset + (-i * line_spacing), 0])
      color("black")
        cube([3.5, 0.5, height / 2 + 0.5]);

  // ── ledger lines above staff (pos > 4*line_spacing) ───────────────────────
  for (i = [1:floor((pos - 4 * line_spacing) / line_spacing)])
    translate([-3.5 / 2, staff_offset + 4 * line_spacing + i * line_spacing, 0])
      color("black")
        cube([3.5, 0.5, height / 2 + 0.5]);

  // ── clef — only on C notes ────────────────────────────────────────────────
  if (note[0] == "C") {
    if (clef == "g") {
      translate([-key_body_w / 2 + 1, staff_offset + 2.5 * line_spacing, 0])
        color("black")
          linear_extrude(height + 0.01)
            scale([0.3, 0.3]) import("GClef.svg");
    } else if (clef == "f") {
      translate([-key_body_w / 2 + 1, staff_offset + 3 * line_spacing, 0])
        color("black")
          linear_extrude(height + 0.01)
            scale([0.3, 0.3]) import("FClef.svg");
    }
  }

  // ── label ─────────────────────────────────────────────────────────────────
  label_sz = min(6, key_body_w * 1.2 / len(label));
  color("black")
    translate([0, -4, 0])
      path_text(
        path=[
          [-key_body_w, -key_length / 4, 0],
          [key_body_w, -key_length / 4, 0],
        ],
        text=label,
        font="Liberation Mono",
        size=label_sz,
        lettersize=label_sz / 1.2,
        thickness=height,
        center=true,
        normal=UP,
        offset=height / 2
      );

  // ── note head ─────────────────────────────────────────────────────────────
  color("black")
    translate([0, staff_offset + pos, 0])
      linear_extrude(height + 0.01)
        rect([2.5, line_spacing - 0.3], rounding=0.8);
}

module octave(oct = 4) {
  notes = ["C", "D", "E", "F", "G", "A", "B"];

  // Physical gap between key bodies:
  //   13 mm where a black key sits between two white keys
  //    1 mm where two white keys are directly adjacent (E–F)

  // Precompute center x of each key (C anchored at 0)
  step_bk = key_body_w + bk_gap; // 28 mm (white key + black key gap)
  step_ww = key_body_w + ww_gap; // 13.5 mm (white key + white-white gap)
  key_x = [
    0,                      // C
    step_bk,                // D
    2 * step_bk,            // E
    2 * step_bk + step_ww,  // F  (only 1 mm gap from E)
    3 * step_bk + step_ww,  // G
    4 * step_bk + step_ww,  // A
    5 * step_bk + step_ww,  // B
  ];

  // Connector strip spans the full width of all 7 keys (solid, no cutouts)
  total_w = key_x[6] + key_body_w; // right edge of B
  connector_x = (key_x[0] - key_body_w / 2 + key_x[6] + key_body_w / 2) / 2;
  connector_y = key_length / 2 - connector_w / 2;

  // connector strip
  translate([connector_x, connector_y, 0])
    color("white")
      cuboid([total_w, connector_w, height]);

  // Shift staff down so the highest note (B) fits within the key's upper area.
  // B of a G-clef octave: pos = (4 + 7*(oct-4)) * line_spacing/2
  // B of an F-clef octave: pos = (9 + 7*(oct-1)) * line_spacing/2  (relative, oct 1-3)
  s_local = line_spacing / 2;
  max_pos = (oct >= 4)
    ? (4 + 7 * (oct - 4)) * s_local   // B_oct in G clef
    : (9 * s_local - 7 * (oct - 1) * s_local); // B_oct in F clef (unused currently)
  staff_offset = min(0, key_length / 2 - 1 - max_pos);

  // 7 white keys at their computed positions
  for (i = [0:6])
    translate([key_x[i], 0, 0])
      white_key(str(notes[i], oct), staff_offset);
}

// Place multiple octaves side by side with the correct B→C gap between them.
module octaves(oct_list = [4]) {
  for (i = [0:len(oct_list) - 1])
    translate([0, -i * (key_length + 5), 0])
      octave(oct_list[i]);
}

octaves([2,3,4,5,6]);
