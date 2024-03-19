from collections import deque
from firebase_utils import FirebaseUtils
from WebCam import WebCam

# from DetectionModel import DetectionModel
import cv2


def main():
    firebase = FirebaseUtils("ADiWRUE96Mjyzgx41HHh")
    camera = WebCam()
    # model = DetectionModel()

    frames_queue = deque(maxlen=16)

    predicted_class_name = ""

    # while True:
    #     ok, processed_frame, frame = camera.get_frame()

    #     if not ok:
    #         break

    #     frames_queue.append(processed_frame)

    #     if len(frames_queue) == 16:
    #         predicted_class_name = model.predict_frame(frames_queue)

    #     cv2.putText(
    #         frame,
    #         predicted_class_name,
    #         (30, 100),
    #         cv2.FONT_HERSHEY_SIMPLEX,
    #         2,
    #         (0, 255, 0),
    #         8,
    #     )

    #     cv2.imshow("Prediction", frame)

    #     if cv2.waitKey(1) & 0xFF == ord("q"):
    #         break

    # cv2.destroyAllWindows()

    link = firebase.upload_clip("test.mp4", "test2")
    # firebase.update_database("Hello There", "ICUP", 2, link)
    print(link)
    print("Send Notification")

    firebase.send_to_token(
        "ek00sNFHSCWjgSD-aCJ8yR:APA91bE4RLwXZppPMcKg95gsqWB0H4KSGkLPxzIZRCDUN_6bQVrioiQKXvuuhKQ2K_ryMEoZ-q3pZL7ZBHaeJuG-OczP1zsFvoh150lHGW2mHmATLD363JBs5S5rbV6Q9heNSu4kAu3f",
        "Camera 03",
        "Fall Detected !!",
        {"videoUrl": link},
        2,
    )

    # firebase.update_database("Camera 03", "Fall Detected!")
    # firebase.get_devices()


if __name__ == "__main__":
    main()
