import cv2
import mediapipe as mp
import math
from firebase_utils import FirebaseUtils
import os
import time

# Initialize mediapipe pose class
mp_pose = mp.solutions.pose

# Setting up the Pose function
pose = mp_pose.Pose(
    static_image_mode=False, min_detection_confidence=0.5, model_complexity=1
)

# Initializing mediapipe drawing class, useful for annotation.
mp_drawing = mp.solutions.drawing_utils

firebase = FirebaseUtils("ADiWRUE96Mjyzgx41HHh")
file_path = os.path.dirname(os.path.abspath(__file__))


def detectPose(image, pose, display=True):
    # Create a copy of the input image.
    output_image = image.copy()

    # Convert the image from BGR into RGB format.
    imageRGB = cv2.cvtColor(image, cv2.COLOR_BGR2RGB)

    # Perform the Pose Detection.
    results = pose.process(imageRGB)

    # Retrieve the height and width of the input image.
    height, width, _ = image.shape

    # Initialize a list to store the detected landmarks.
    landmarks = []

    # Check if any landmarks are detected.
    if results.pose_landmarks:

        # Draw Pose landmarks on the output image.
        mp_drawing.draw_landmarks(
            image=output_image,
            landmark_list=results.pose_landmarks,
            connections=mp_pose.POSE_CONNECTIONS,
        )

        # Iterate over the detected landmarks.
        for landmark in results.pose_landmarks.landmark:

            # Append the landmark into the list.
            landmarks.append(
                (
                    int(landmark.x * width),
                    int(landmark.y * height),
                    int(landmark.z * width),
                )
            )

    return output_image, landmarks, results


def record_webcam(cap, duration=10, output_filename="webcam_output.avi", fps=30):
    if not cap.isOpened():
        print("Error opening webcam")
        return

    frame_width = int(cap.get(cv2.CAP_PROP_FRAME_WIDTH))
    frame_height = int(cap.get(cv2.CAP_PROP_FRAME_HEIGHT))
    fourcc = cv2.VideoWriter_fourcc(*"XVID")
    out = cv2.VideoWriter(
        os.path.join(file_path, output_filename),
        fourcc,
        fps,
        (frame_width, frame_height),
    )

    start_time = time.time()
    while time.time() - start_time <= duration:
        ret, frame = cap.read()

        if not ret:
            print("Error reading frame")
            break

        out.write(frame)
        cv2.imshow("Webcam Recording", frame)

        if cv2.waitKey(1) & 0xFF == ord("q"):
            break

    print("Video Saved")


def main():
    # Initialize the VideoCapture object to read from the webcam
    camera_video = cv2.VideoCapture(0)
    camera_video.set(3, 1380)
    camera_video.set(4, 960)

    while camera_video.isOpened():
        # Read a frame
        ok, frame = camera_video.read()

        if not ok:
            continue

        # Flip the frame horizontally for natural (selfie-view) visualization
        frame = cv2.flip(frame, 1)

        # Get the width and height of the frame
        frame_height, frame_width, _ = frame.shape

        # Resize the frame while keeping the aspect ratio
        frame = cv2.resize(frame, (int(frame_width * (640 / frame_height)), 640))

        # Perform Pose landmark detection
        frame, landmarks, results = detectPose(frame, pose, display=False)

        # Example fall detection logic (modify as needed)
        if results.pose_landmarks is not None:
            # Extract relevant landmarks for fall detection
            left_shoulder = results.pose_landmarks.landmark[
                mp_pose.PoseLandmark.LEFT_SHOULDER
            ]
            left_hip = results.pose_landmarks.landmark[mp_pose.PoseLandmark.LEFT_HIP]
            right_shoulder = results.pose_landmarks.landmark[
                mp_pose.PoseLandmark.RIGHT_SHOULDER
            ]
            right_hip = results.pose_landmarks.landmark[mp_pose.PoseLandmark.RIGHT_HIP]
            left_knee = results.pose_landmarks.landmark[mp_pose.PoseLandmark.LEFT_KNEE]
            right_knee = results.pose_landmarks.landmark[
                mp_pose.PoseLandmark.RIGHT_KNEE
            ]
            nose = results.pose_landmarks.landmark[mp_pose.PoseLandmark.NOSE]

            # Calculate angles between shoulders, hips, and knees
            angle_left = math.degrees(
                math.atan2(left_shoulder.y - left_hip.y, left_shoulder.x - left_hip.x)
            )
            angle_right = math.degrees(
                math.atan2(
                    right_shoulder.y - right_hip.y, right_shoulder.x - right_hip.x
                )
            )
            angle_knees = math.degrees(
                math.atan2(left_knee.y - left_hip.y, left_knee.x - left_hip.x)
            ) + math.degrees(
                math.atan2(right_knee.y - right_hip.y, right_knee.x - right_hip.x)
            )

            # Set thresholds for angles to determine a fall
            shoulder_threshold = 45  # Adjust this threshold as needed
            knee_threshold = 45  # Adjust this threshold as needed

            # Check if both shoulders are tilted beyond the threshold and knees are lower than hips
            if (
                abs(angle_left) > shoulder_threshold
                and abs(angle_right) > shoulder_threshold
                and angle_knees < -knee_threshold
                and nose.y > left_shoulder.y
            ):
                record_webcam(camera_video)
                print("Fall detected!")
                # print("Left Shoulder Angle:", angle_left)
                # print("Right Shoulder Angle:", angle_right)
                # print("Knees Angle:", angle_knees)
                # label = "Fall detected!"
                # cv2.putText(frame, label, (50, 50), cv2.FONT_HERSHEY_SIMPLEX, 1, (0, 0, 255), 2)

        # Display the frame with the webcam video
        cv2.imshow("Webcam Video", frame)

        # Check for the 'ESC' key to exit the loop
        key = cv2.waitKey(1)
        if key == 27:  # 27 is the ASCII code for 'ESC'
            break

    # Release the VideoCapture object
    camera_video.release()
    cv2.destroyAllWindows()


if __name__ == "__main__":
    main()
