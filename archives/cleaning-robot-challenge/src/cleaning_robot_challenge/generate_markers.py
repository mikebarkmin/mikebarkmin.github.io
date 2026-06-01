"""Generate and save printable ArUco marker images for the challenge setup.

Produces one PNG per marker (IDs 0-4) plus a single sheet PDF with all five
arranged for easy printing.
"""

from __future__ import annotations

import argparse
import pathlib

import cv2
import numpy as np

from cleaning_robot_challenge.analyzer import ARUCO_DICT_ID, CORNER_IDS, DEFAULT_ROBOT_ID

MARKER_LABELS = {
    0: "TOP-LEFT",
    1: "TOP-RIGHT",
    2: "BOTTOM-RIGHT",
    3: "BOTTOM-LEFT",
    DEFAULT_ROBOT_ID: "ROBOT",
}


def generate_marker(marker_id: int, size_px: int = 400) -> np.ndarray:
    """Return a BGR image of a single ArUco marker with border and label."""
    aruco_dict = cv2.aruco.getPredefinedDictionary(ARUCO_DICT_ID)
    marker_img = cv2.aruco.generateImageMarker(aruco_dict, marker_id, size_px)

    # Add white border around the marker
    border = size_px // 8
    bordered = cv2.copyMakeBorder(
        marker_img, border, border, border, border,
        cv2.BORDER_CONSTANT, value=255
    )
    bgr = cv2.cvtColor(bordered, cv2.COLOR_GRAY2BGR)

    # Label below: ID number and role
    label_area = np.full((border * 3, bgr.shape[1], 3), 255, dtype=np.uint8)
    role = MARKER_LABELS.get(marker_id, "")
    text = f"ID {marker_id}  {role}"
    font, scale = cv2.FONT_HERSHEY_SIMPLEX, 0.9
    (tw, _), _ = cv2.getTextSize(text, font, scale, 2)
    x = (label_area.shape[1] - tw) // 2
    cv2.putText(label_area, text, (x, border * 2), font, scale, (0, 0, 0), 2, cv2.LINE_AA)

    return np.vstack([bgr, label_area])


def generate_sheet(marker_size_px: int = 300) -> np.ndarray:
    """Return a single-sheet image with all five markers arranged in a grid."""
    ids = CORNER_IDS + [DEFAULT_ROBOT_ID]
    images = [generate_marker(mid, marker_size_px) for mid in ids]

    # Arrange in a 3-2 grid
    row1 = np.hstack(images[:3])
    # Pad the second row to the same width
    pad = (row1.shape[1] - images[3].shape[1] * 2) // 2
    row2_mid = np.hstack(images[3:])
    left_pad = np.full((row2_mid.shape[0], pad, 3), 255, dtype=np.uint8)
    right_pad = np.full((row2_mid.shape[0], row1.shape[1] - pad - row2_mid.shape[1], 3), 255, dtype=np.uint8)
    row2 = np.hstack([left_pad, row2_mid, right_pad])

    sheet = np.vstack([row1, row2])
    return sheet


def main() -> None:
    parser = argparse.ArgumentParser(
        prog="generate-markers",
        description="Generate printable ArUco marker images for the cleaning robot challenge.",
    )
    parser.add_argument(
        "--output-dir",
        "-d",
        default="markers",
        metavar="DIR",
        help="Directory to write marker images into (default: ./markers)",
    )
    parser.add_argument(
        "--size",
        type=int,
        default=400,
        metavar="PX",
        help="Marker image size in pixels (default: 400)",
    )
    parser.add_argument(
        "--sheet",
        action="store_true",
        default=True,
        help="Also generate a combined sheet image (default: true)",
    )
    args = parser.parse_args()

    out_dir = pathlib.Path(args.output_dir)
    out_dir.mkdir(parents=True, exist_ok=True)

    all_ids = CORNER_IDS + [DEFAULT_ROBOT_ID]
    for mid in all_ids:
        img = generate_marker(mid, args.size)
        path = out_dir / f"marker_{mid:02d}_{MARKER_LABELS.get(mid, '').lower().replace('-', '_')}.png"
        cv2.imwrite(str(path), img)
        print(f"  Saved {path}")

    if args.sheet:
        sheet = generate_sheet(args.size)
        sheet_path = out_dir / "all_markers_sheet.png"
        cv2.imwrite(str(sheet_path), sheet)
        print(f"  Saved {sheet_path}")

    print(f"\nDone. Print the files from '{out_dir}/' and place them at the corners of the cleaning area.")
    print("Laminating the markers is recommended for durability.")


if __name__ == "__main__":
    main()
