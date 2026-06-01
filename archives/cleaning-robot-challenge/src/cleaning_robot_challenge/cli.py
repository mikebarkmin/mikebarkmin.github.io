"""Command-line interface for the cleaning robot challenge analyser."""

from __future__ import annotations

import argparse
import sys

from cleaning_robot_challenge.analyzer import DEFAULT_ROBOT_ID, VideoAnalyzer


DESCRIPTION = """\
Analyse a top-down video of the EV3 Mindstorms cleaning robot challenge.
Computes what percentage of the designated area was visited by the robot.

ArUco marker layout  (dictionary: DICT_4X4_50)
───────────────────────────────────────────────
  [ID 0] ──────────────── [ID 1]
     |                       |
     |    cleaning area       |
     |                       |
  [ID 3] ──────────────── [ID 2]

  ID {robot_id}  →  placed on top of the robot (configurable via --robot-id)

Print the markers with:  uv run generate-markers
"""


def main() -> None:
    parser = argparse.ArgumentParser(
        prog="analyze-robot",
        description=DESCRIPTION.format(robot_id=DEFAULT_ROBOT_ID),
        formatter_class=argparse.RawDescriptionHelpFormatter,
    )
    parser.add_argument(
        "source",
        help="Path to a video file, or an integer camera index (e.g. 0 for webcam)",
    )
    parser.add_argument(
        "--robot-id",
        type=int,
        default=DEFAULT_ROBOT_ID,
        metavar="N",
        help=f"ArUco marker ID attached to the robot (default: {DEFAULT_ROBOT_ID})",
    )
    parser.add_argument(
        "--robot-radius",
        type=int,
        default=30,
        metavar="PX",
        help=(
            "Radius of the robot footprint in normalised pixels "
            "(default: 30). Increase if your robot is larger."
        ),
    )
    parser.add_argument(
        "--output",
        "-o",
        metavar="FILE",
        help="Save the annotated video to this file (e.g. result.mp4)",
    )
    parser.add_argument(
        "--timer",
        type=float,
        default=None,
        metavar="SECONDS",
        help=(
            "Countdown timer in seconds. Coverage recording stops when the timer "
            "reaches zero, but the video display keeps running."
        ),
    )
    parser.add_argument(
        "--headless",
        action="store_true",
        help="Run without opening a display window (useful on headless servers)",
    )

    args = parser.parse_args()

    # Treat source as a camera index when it is a bare integer
    try:
        source: str | int = int(args.source)
    except ValueError:
        source = args.source

    analyzer = VideoAnalyzer(
        source=source,
        robot_id=args.robot_id,
        robot_radius=args.robot_radius,
        output_path=args.output,
        headless=args.headless,
        timer_seconds=args.timer,
    )

    try:
        analyzer.analyze()
    except RuntimeError as exc:
        print(f"Error: {exc}", file=sys.stderr)
        sys.exit(1)


if __name__ == "__main__":
    main()
