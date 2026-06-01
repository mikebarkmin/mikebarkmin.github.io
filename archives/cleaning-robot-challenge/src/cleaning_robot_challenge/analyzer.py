"""Core video analysis logic for the cleaning robot challenge."""

from __future__ import annotations

import time
from dataclasses import dataclass
from typing import Optional

import cv2
import numpy as np

# ---------------------------------------------------------------------------
# ArUco configuration
# ---------------------------------------------------------------------------
ARUCO_DICT_ID = cv2.aruco.DICT_4X4_50

# Corner marker IDs define the cleaning area (placed at the four corners).
# Order: top-left, top-right, bottom-right, bottom-left.
CORNER_IDS: list[int] = [0, 1, 2, 3]

DEFAULT_ROBOT_ID = 4

# Size of the normalised (warped) canvas in pixels.
OUTPUT_SIZE = 800


# ---------------------------------------------------------------------------
# Data classes
# ---------------------------------------------------------------------------

@dataclass
class RobotState:
    position: tuple[int, int]   # (x, y) in warped space
    heading_deg: float           # 0° = right, 90° = up (screen convention)


# ---------------------------------------------------------------------------
# Analyser
# ---------------------------------------------------------------------------

class VideoAnalyzer:
    """Analyse a top-down video to compute cleaning coverage.

    ArUco markers (DICT_4X4_50) must be placed as follows:
        ID 0 – top-left corner of the cleaning area
        ID 1 – top-right corner
        ID 2 – bottom-right corner
        ID 3 – bottom-left corner
        ID <robot_id> – on top of the robot (default: 4)

    The four corner markers are used to apply a perspective transform so
    the output is always a stable, axis-aligned view of the cleaning area.
    """

    def __init__(
        self,
        source: str | int,
        robot_id: int = DEFAULT_ROBOT_ID,
        robot_radius: int = 80,
        output_path: Optional[str] = None,
        headless: bool = False,
        timer_seconds: Optional[float] = None,
    ) -> None:
        self.source = source
        self.robot_id = robot_id
        self.robot_radius = robot_radius
        self.output_path = output_path
        self.headless = headless
        self.timer_seconds = timer_seconds

        aruco_dict = cv2.aruco.getPredefinedDictionary(ARUCO_DICT_ID)
        self._detector = cv2.aruco.ArucoDetector(
            aruco_dict, cv2.aruco.DetectorParameters()
        )

        # Persistent state across frames
        self._last_corners: dict[int, np.ndarray] = {}  # id -> centre (x, y)
        # Float accumulator: each pixel counts how many frames the robot covered it.
        self._coverage = np.zeros((OUTPUT_SIZE, OUTPUT_SIZE), dtype=np.float32)
        self._last_robot: Optional[RobotState] = None
        self._start_time: Optional[float] = None  # set on first valid (warped) frame

    # ------------------------------------------------------------------
    # Detection helpers
    # ------------------------------------------------------------------

    def _detect_markers(self, frame: np.ndarray) -> dict[int, np.ndarray]:
        """Return {marker_id: corners_4x2} for every detected ArUco marker."""
        gray = cv2.cvtColor(frame, cv2.COLOR_BGR2GRAY)
        corners, ids, _ = self._detector.detectMarkers(gray)
        result: dict[int, np.ndarray] = {}
        if ids is not None:
            for i, mid in enumerate(ids.flatten()):
                result[int(mid)] = corners[i][0]  # shape (4, 2)
        return result

    def _build_transform(
        self, markers: dict[int, np.ndarray]
    ) -> Optional[np.ndarray]:
        """Compute the perspective transform matrix from the four corner markers.

        Uses the last known position for any marker that is temporarily
        occluded, so the transform stays stable across brief occlusions.
        """
        src_pts: list[np.ndarray] = []
        for mid in CORNER_IDS:
            if mid in markers:
                centre = markers[mid].mean(axis=0)
                self._last_corners[mid] = centre
            if mid in self._last_corners:
                src_pts.append(self._last_corners[mid])
            else:
                return None  # not enough corner data yet

        src = np.array(src_pts, dtype=np.float32)
        dst = np.array(
            [
                [0, 0],
                [OUTPUT_SIZE - 1, 0],
                [OUTPUT_SIZE - 1, OUTPUT_SIZE - 1],
                [0, OUTPUT_SIZE - 1],
            ],
            dtype=np.float32,
        )
        return cv2.getPerspectiveTransform(src, dst)

    def _get_robot(
        self, markers: dict[int, np.ndarray], M: np.ndarray
    ) -> Optional[RobotState]:
        """Return the robot's position and heading in the warped coordinate space."""
        if self.robot_id not in markers:
            return self._last_robot  # keep last known state

        pts = markers[self.robot_id]  # (4, 2): TL, TR, BR, BL corner order

        # Warp centre to normalised space
        centre = pts.mean(axis=0).reshape(1, 1, 2).astype(np.float32)
        cx, cy = cv2.perspectiveTransform(centre, M)[0, 0]

        # Heading is the direction from centre toward the top-edge midpoint
        top_mid = ((pts[0] + pts[1]) / 2.0).reshape(1, 1, 2).astype(np.float32)
        tx, ty = cv2.perspectiveTransform(top_mid, M)[0, 0]
        heading_deg = float(np.degrees(np.arctan2(-(ty - cy), tx - cx)))

        state = RobotState(position=(int(cx), int(cy)), heading_deg=heading_deg)
        self._last_robot = state
        return state

    # ------------------------------------------------------------------
    # Coverage
    # ------------------------------------------------------------------

    def _update_coverage(self, robot: RobotState) -> None:
        mask = np.zeros((OUTPUT_SIZE, OUTPUT_SIZE), dtype=np.uint8)
        cv2.circle(mask, robot.position, self.robot_radius, 1, -1)
        self._coverage += mask

    def coverage_pct(self) -> float:
        """Return the percentage of the cleaning area that has been visited."""
        covered = int(np.count_nonzero(self._coverage))
        return covered / (OUTPUT_SIZE * OUTPUT_SIZE) * 100.0

    # ------------------------------------------------------------------
    # Rendering
    # ------------------------------------------------------------------

    def _draw_markers(
        self,
        image: np.ndarray,
        markers: dict[int, np.ndarray],
        M: Optional[np.ndarray] = None,
    ) -> None:
        """Draw a highlighted rectangle and ID label around each detected marker."""
        for mid, corners in markers.items():
            if M is not None:
                pts = cv2.perspectiveTransform(
                    corners.reshape(1, -1, 2).astype(np.float32), M
                )[0].astype(np.int32)
            else:
                pts = corners.astype(np.int32)

            if mid == self.robot_id:
                color = (0, 255, 255)   # cyan  – robot
            elif mid in CORNER_IDS:
                color = (255, 100, 0)   # blue  – area corners
            else:
                color = (0, 255, 0)     # green – other markers

            cv2.polylines(image, [pts], True, color, 2)
            label_pos = (int(pts[:, 0].min()), int(pts[:, 1].min()) - 6)
            cv2.putText(image, f"ID {mid}", label_pos,
                        cv2.FONT_HERSHEY_SIMPLEX, 0.5, color, 1, cv2.LINE_AA)

    def _render(
        self,
        warped: np.ndarray,
        robot: Optional[RobotState],
        markers: Optional[dict[int, np.ndarray]] = None,
        M: Optional[np.ndarray] = None,
        timer_remaining: Optional[float] = None,
    ) -> np.ndarray:
        """Compose the annotated output frame."""
        display = warped.copy()

        # Heat map overlay: blue (visited once) → red (visited many times)
        if self._coverage.max() > 0:
            normalized = (self._coverage / self._coverage.max() * 255).astype(np.uint8)
            heatmap = cv2.applyColorMap(normalized, cv2.COLORMAP_JET)
            visited = self._coverage > 0
            blended = cv2.addWeighted(display, 0.6, heatmap, 0.4, 0)
            display[visited] = blended[visited]

        if robot:
            pos = robot.position

            # Robot footprint circle
            cv2.circle(display, pos, self.robot_radius, (0, 255, 255), 2)

            # Heading arrow pointing in direction of travel
            rad = np.radians(robot.heading_deg)
            arrow_len = self.robot_radius + 20
            tip = (
                int(pos[0] + arrow_len * np.cos(rad)),
                int(pos[1] - arrow_len * np.sin(rad)),
            )
            cv2.arrowedLine(display, pos, tip, (0, 165, 255), 2, tipLength=0.35)

        # Highlight detected ArUco markers with colour-coded rectangles
        if markers and M is not None:
            self._draw_markers(display, markers, M)

        # Coverage percentage (black outline + white fill for readability)
        pct = self.coverage_pct()
        label = f"Coverage: {pct:.1f}%"
        origin = (12, 40)
        font, scale, thickness = cv2.FONT_HERSHEY_SIMPLEX, 1.1, 2
        cv2.putText(display, label, origin, font, scale, (0, 0, 0), thickness + 3, cv2.LINE_AA)
        cv2.putText(display, label, origin, font, scale, (255, 255, 255), thickness, cv2.LINE_AA)

        # Countdown timer
        if timer_remaining is not None:
            mins = int(timer_remaining) // 60
            secs = int(timer_remaining) % 60
            timer_label = f"Time: {mins}:{secs:02d}"
            timer_color = (0, 255, 0) if timer_remaining > 0 else (0, 0, 255)
            timer_origin = (12, 80)
            cv2.putText(display, timer_label, timer_origin, font, scale, (0, 0, 0), thickness + 3, cv2.LINE_AA)
            cv2.putText(display, timer_label, timer_origin, font, scale, timer_color, thickness, cv2.LINE_AA)

        return display

    # ------------------------------------------------------------------
    # Main analysis loop
    # ------------------------------------------------------------------

    def analyze(self) -> float:
        """Process the video source and return the final coverage percentage."""
        cap = cv2.VideoCapture(self.source)
        if not cap.isOpened():
            raise RuntimeError(f"Cannot open source: {self.source!r}")

        fps = cap.get(cv2.CAP_PROP_FPS) or 30.0
        writer: Optional[cv2.VideoWriter] = None

        if not self.headless:
            print("Controls: press 'q' to stop early, 'r' to reset coverage map.")

        try:
            while True:
                ret, frame = cap.read()
                if not ret:
                    break

                markers = self._detect_markers(frame)
                M = self._build_transform(markers)

                if M is None:
                    # Haven't seen all four corner markers yet
                    if not self.headless:
                        waiting = frame.copy()
                        self._draw_markers(waiting, markers)
                        cv2.putText(
                            waiting,
                            "Waiting for corner markers (IDs 0-3)...",
                            (20, 50),
                            cv2.FONT_HERSHEY_SIMPLEX,
                            0.9,
                            (0, 0, 255),
                            2,
                            cv2.LINE_AA,
                        )
                        cv2.imshow("Cleaning Robot Challenge", waiting)
                else:
                    warped = cv2.warpPerspective(frame, M, (OUTPUT_SIZE, OUTPUT_SIZE))
                    robot = self._get_robot(markers, M)

                    if self._start_time is None:
                        self._start_time = time.time()

                    elapsed = time.time() - self._start_time
                    recording = self.timer_seconds is None or elapsed < self.timer_seconds
                    timer_remaining = (
                        max(0.0, self.timer_seconds - elapsed)
                        if self.timer_seconds is not None
                        else None
                    )

                    if robot and recording:
                        self._update_coverage(robot)
                    display = self._render(warped, robot, markers, M, timer_remaining=timer_remaining)

                    if self.output_path and writer is None:
                        fourcc = cv2.VideoWriter.fourcc(*"mp4v")
                        writer = cv2.VideoWriter(
                            self.output_path, fourcc, fps, (OUTPUT_SIZE, OUTPUT_SIZE)
                        )
                    if writer:
                        writer.write(display)

                    if not self.headless:
                        cv2.imshow("Cleaning Robot Challenge", display)

                if not self.headless:
                    key = cv2.waitKey(1) & 0xFF
                    if key == ord("q"):
                        break
                    if key == ord("r"):
                        self._coverage[:] = 0
                        self._start_time = None
                        print("Coverage map reset.")

        finally:
            cap.release()
            if writer:
                writer.release()
            if not self.headless:
                cv2.destroyAllWindows()

        final = self.coverage_pct()
        print(f"\n=== Final Coverage Score: {final:.1f}% ===")
        return final
