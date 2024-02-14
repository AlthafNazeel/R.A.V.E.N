from collections import deque
from firebase_utils import FirebaseUtils
from WebCam import WebCam
from DetectionModel import DetectionModel
import cv2


def main():
    firebase = FirebaseUtils()
    camera = WebCam()
    model = DetectionModel()

    frames_queue = deque(maxlen=16)

    predicted_class_name = ""

    while True:
        ok, processed_frame, frame = camera.get_frame()

        if not ok:
            break

        frames_queue.append(processed_frame)

        if len(frames_queue) == 16:
            predicted_class_name = model.predict_frame(frames_queue)

        cv2.putText(
            frame,
            predicted_class_name,
            (30, 100),
            cv2.FONT_HERSHEY_SIMPLEX,
            2,
            (0, 255, 0),
            8,
        )

        cv2.imshow("Prediction", frame)

        if cv2.waitKey(1) & 0xFF == ord("q"):
            break

    cv2.destroyAllWindows()

    link = firebase.upload_clip("testvideo.mp4", "testvideo")

    firebase.send_to_token(
        "fjFaquaNRK6w7hSbGnXvbi:APA91bEC6RB6QNcGXpyyo-6m3Is9PVaE3QaxL6onoCWEKVWmVGe-kcZlb0EMB-9-noza-x5up5rCWslx4zHvjYW2XVXDAkpmtejRXeQ9YixLuWfe7S5FHtfdtxvasFrx6NlKEg5VYfSg",
        "Violence Detected",
        "Camera 03 has detected violent Activity!",
        {"videoUrl": link},
    )


if __name__ == "__main__":
    main()
