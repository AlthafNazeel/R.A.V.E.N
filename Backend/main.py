from collections import deque
from firebase_utils import FirebaseUtils
from WebCam import WebCam

# from DetectionModel import DetectionModel
import cv2


def main():
    firebase = FirebaseUtils()
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

    # link = firebase.upload_clip("testvideo.mp4", "testvideo")
    # print("Send Notification")

    # firebase.send_to_token(
    #     "cNbBYeUfRwWODbNTdnkjJE:APA91bEFlgcwEX0NJy0QskDZffVwS1sdrRr6RDPm345_o3VwLtg6C5k6r-QNf9IYtmZU6sbFYNNybGGADEh4izKoTVfAFBKRs-XoAEkvHYf8ks61vvNVqC2a-SkrgdC7pHBppvNn99AP",
    #     "Camera 03",
    #     "Fall Detected !!",
    #     {"videoUrl": link},
    # )

    firebase.update_database("Camera 03", "Fall Detected!")


if __name__ == "__main__":
    main()
