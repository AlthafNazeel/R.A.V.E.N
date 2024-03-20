from collections import deque
from firebase_utils import FirebaseUtils
from WebCam import WebCam

import cv2


def main():
    firebase = FirebaseUtils("ADiWRUE96Mjyzgx41HHh")
    camera = WebCam()

    # link = firebase.upload_clip("test.mp4", "test2")
    # # firebase.update_database("Hello There", "ICUP", 2, link)
    # print(link)
    # print("Send Notification")

    firebase.send_notification(
        "You cant see me",
        "John Cena",
        {"videoUrl": "link"},
        2,
    )

    # firebase.update_database("Camera 03", "Fall Detected!")
    # firebase.get_devices()


if __name__ == "__main__":
    main()
