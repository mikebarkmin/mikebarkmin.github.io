# Cleaning Robot Challenge – Video Analyser

Analyses a top-down video of an EV3 Mindstorms robot navigating a cleaning area and computes what **percentage of the area was visited**.

## How it works

1. Four **ArUco markers** (IDs 0-3) are placed at the corners of the cleaning area on the floor.
2. A fifth marker (ID 4) is attached to the top of the robot.
3. The program detects the corner markers every frame and applies a **perspective warp** – so the output is always a stable, axis-aligned view even if the camera shakes.
4. The robot's position (and heading) is tracked in the warped view.
5. A **coverage mask** accumulates every position the robot has visited (circle with configurable radius).
6. At the end a final score is printed: `Coverage: XX.X%`.

```
[ID 0] ──────────────── [ID 1]
   |                       |
   |    cleaning area       |
   |                       |
[ID 3] ──────────────── [ID 2]

       [ID 4] = robot
```

## Setup

Requires Python ≥ 3.11 and [uv](https://docs.astral.sh/uv/).

```bash
uv sync
```

## Generate & print markers

```bash
uv run generate-markers          # saves to ./markers/
uv run generate-markers -d ~/Desktop/markers --size 500
```

Print the five PNGs (or the combined sheet `all_markers_sheet.png`) at roughly **10 × 10 cm** each. Laminating is recommended.

## Analyse a video

```bash
uv run analyze-robot path/to/run.mp4
```

### Save the annotated output

```bash
uv run analyze-robot path/to/run.mp4 -o result.mp4
```

### Live webcam

```bash
uv run analyze-robot 0            # camera index 0
```

### All options

```
usage: analyze-robot [-h] [--robot-id N] [--robot-radius PX] [--output FILE] [--headless] source

positional arguments:
  source               Path to a video file, or an integer camera index

options:
  --robot-id N         ArUco marker ID on the robot (default: 4)
  --robot-radius PX    Radius of robot footprint in normalised pixels (default: 30)
  --output / -o FILE   Save annotated video to this file
  --headless           Run without a display window
```

### Controls (live window)

| Key | Action |
|-----|--------|
| `q` | Quit early |
| `r` | Reset coverage map |

## Tips

- Print markers as large as practical (≥ 8 cm) for reliable detection.
- Use a fixed camera mount; the perspective correction handles minor shake but large movements reduce accuracy.
- If the robot marker is sometimes occluded, increase `--robot-radius` slightly so small gaps in tracking don't hurt the score.
- For indoor fluorescent lighting, markers ≥ 10 cm usually work well.
