import tensorflow as tf
import cv2
import matplotlib.pyplot as plt
import numpy as np
import os
import tensorflow_hub as hub
import time

import warnings

warnings.filterwarnings("ignore")


# Creating the instance of VideoCapture for capturing the video
cap = cv2.VideoCapture(0)

# Define the window and its size
cv2.namedWindow("MultiPose Estimation", cv2.WINDOW_NORMAL)
window_width = 1080
window_height = 720
cv2.resizeWindow("MultiPose Estimation", window_width, window_height)

# Initialize variables for emergency detection and notification outside the loop
EDGES = {
    (0, 1): "m",
    (0, 2): "c",
    (1, 3): "m",
    (2, 4): "c",
    (0, 5): "m",
    (0, 6): "c",
    (5, 7): "m",
    (7, 9): "m",
    (6, 8): "c",
    (8, 10): "c",
    (5, 6): "y",
    (5, 11): "m",
    (6, 12): "c",
    (11, 12): "y",
    (11, 13): "m",
    (13, 15): "m",
    (12, 14): "c",
    (14, 16): "c",
}


class EmergencyDetection:
    def __init__(self):
        self.file_path = os.path.dirname(os.path.abspath(__file__))
        # Load the model
        self.model = hub.load("https://tfhub.dev/google/movenet/multipose/lightning/1")

        # Access a specific signature
        self.signature = self.model.signatures["serving_default"]

        # Store the 'serving_default' signature of model object in the 'movenet' variable.
        self.movenet = self.model.signatures["serving_default"]

        self.emergency_detected = False
        self.last_notification_time = time.time()

    def draw_connections(self, frame, keypoints, edges, confidence_threshold):
        y, x, c = frame.shape
        shaped = np.squeeze(np.multiply(keypoints, [y, x, 1]))

        for edge, color in edges.items():
            p1, p2 = edge
            y1, x1, c1 = shaped[p1]
            y2, x2, c2 = shaped[p2]

            if (c1 > confidence_threshold) & (c2 > confidence_threshold):
                cv2.line(
                    frame, (int(x1), int(y1)), (int(x2), int(y2)), (0, 0, 0), 2
                )  # Decreased line thickness

    def loop_through_people(
        self, frame, keypoints_with_scores, edges, confidence_threshold
    ):
        for person in keypoints_with_scores:
            self.draw_connections(frame, person, edges, confidence_threshold)
            self.draw_keypoints(frame, person, confidence_threshold)

    def draw_keypoints(self, frame, keypoints, confidence_threshold):
        y, x, c = frame.shape
        shaped = np.squeeze(np.multiply(keypoints, [y, x, 1]))

        for kp in shaped:
            ky, kx, kp_conf = kp
            if kp_conf > confidence_threshold:
                cv2.circle(
                    frame, (int(kx), int(ky)), 5, (0, 255, 0), -1
                )  # Decreased circle size

    def detect_emergency(self, keypoints_with_scores, threshold=0.2):
        if not self.emergency_detected:
            for person in keypoints_with_scores:
                head = person[0]
                wrist_left = person[9]
                wrist_right = person[10]

                if (
                    abs(wrist_left[1] - head[1]) > threshold
                    and abs(wrist_right[1] - head[1]) > threshold
                ):
                    self.emergency_detected = True
                    self.last_notification_time = time.time()
                    return True
        else:
            # Check if 2 minutes (120 seconds) have passed since the last notification
            current_time = time.time()
            if current_time - self.last_notification_time >= 60:
                self.emergency_detected = False

        return False

    def record_webcam(self, duration=10, output_filename="webcam_output.avi", fps=30):
        if not cap.isOpened():
            print("Error opening webcam")
            return

        frame_width = int(cap.get(cv2.CAP_PROP_FRAME_WIDTH))
        frame_height = int(cap.get(cv2.CAP_PROP_FRAME_HEIGHT))

        # Define the codec and create a VideoWriter object
        fourcc = cv2.VideoWriter_fourcc(*"XVID")
        file_path = os.path.dirname(os.path.abspath(__file__))
        out = cv2.VideoWriter(
            file_path + "/" + output_filename, fourcc, fps, (frame_width, frame_height)
        )

        start_time = time.time()
        while time.time() - start_time <= duration:
            ret, frame = cap.read()

            if not ret:
                print("Error reading frame")
                break

            # Write the frame to the output video file
            out.write(frame)

            cv2.imshow("Webcam Recording", frame)

            # Press 'q' to stop recording manually
            if cv2.waitKey(1) & 0xFF == ord("q"):
                break

        # Release resources
        cap.release()
        out.release()
        print("Video Saved")

    def analyze_frame(self):
        ret, frame = cap.read()

        img = frame.copy()
        img = tf.image.resize_with_pad(tf.expand_dims(img, axis=0), 160, 288)
        input_img = tf.cast(img, dtype=tf.int32)

        results = self.movenet(input_img)
        keypoints_with_scores = (
            results["output_0"].numpy()[:, :, :51].reshape((6, 17, 3))
        )

        self.loop_through_people(frame, keypoints_with_scores, EDGES, 0.1)

        if self.detect_emergency(keypoints_with_scores):
            print("Emergency detected (hands raised)")

            return True
            # det.record_webcam()
            # link = det.firebase.upload_clip("webcam_output.avi", "ml test")
            # det.firebase.send_notification(
            #     "Its working",
            #     "Finalllyyyyyyy!!!!",
            #     {"videoUrl": link},
            #     2,
            # )

        cv2.imshow("MultiPose Estimation", frame)
        return False


# while True:
#     ret, frame = cap.read()

#     det = EmergencyDetection()

#     if not ret:
#         break

#     img = frame.copy()
#     img = tf.image.resize_with_pad(tf.expand_dims(img, axis=0), 160, 288)
#     input_img = tf.cast(img, dtype=tf.int32)

#     results = det.movenet(input_img)
#     keypoints_with_scores = results["output_0"].numpy()[:, :, :51].reshape((6, 17, 3))

#     det.loop_through_people(frame, keypoints_with_scores, EDGES, 0.1)

#     if det.detect_emergency(keypoints_with_scores):
#         print("Emergency detected (hands raised)")
#         det.record_webcam()
#         # link = det.firebase.upload_clip("webcam_output.avi", "ml test")
#         # det.firebase.send_notification(
#         #     "Its working",
#         #     "Finalllyyyyyyy!!!!",
#         #     {"videoUrl": link},
#         #     2,
#         # )

#     cv2.imshow("MultiPose Estimation", frame)

#     if cv2.waitKey(1) == 27:
#         break

# cap.release()
# cv2.destroyAllWindows()
