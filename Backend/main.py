from collections import deque
from firebase_utils import FirebaseUtils
from WebCam import WebCam
from detection import EmergencyDetection


def main():
    firebase = FirebaseUtils("ADiWRUE96Mjyzgx41HHh")
    camera = WebCam()
    model = EmergencyDetection()

    while True:
        detected = model.analyze_frame()
    # link = firebase.upload_clip("webcam_output.avi", "b")

    # print("Send Notification")

    # firebase.send_notification(
    #     "Newklfd.fs",
    #     "John Cena",
    #     {"videoUrl": link},
    #     2,
    # )


if __name__ == "__main__":
    main()
