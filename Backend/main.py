from firebase_utils import FirebaseUtils
from WebCam import WebCam
import os
import cv2
import numpy as np
from collections import deque
from tensorflow.keras.models import load_model


def main():
    firebase = FirebaseUtils()
    camera = WebCam()
    file_path = os.path.dirname(os.path.abspath(__file__))

    CLASSES_LIST = ["non-violent", "violent"]

    MoBiLSTM_model = load_model(os.path.join(file_path, "model.keras"))

    video_reader = cv2.VideoCapture(0)

    # VideoWriter to store the output video in the disk.
    original_video_width = int(video_reader.get(cv2.CAP_PROP_FRAME_WIDTH))
    original_video_height = int(video_reader.get(cv2.CAP_PROP_FRAME_HEIGHT))

    video_writer = cv2.VideoWriter(
        "output.mp4",
        cv2.VideoWriter_fourcc("m", "p", "4", "v"),
        video_reader.get(cv2.CAP_PROP_FPS),
        (original_video_width, original_video_height),
    )

    # Declare a queue to store video frames.
    frames_queue = deque(maxlen=16)

    # Store the predicted class in the video.
    predicted_class_name = ""

    while True:
        # Read a frame from the webcam.
        ok, frame = video_reader.read()

        if not ok:
            break

        # Resize the Frame to fixed Dimensions.
        resized_frame = cv2.resize(frame, (64, 64))

        # Normalize the resized frame.
        normalized_frame = resized_frame / 255

        # Appending the pre-processed frame into the frames list.
        frames_queue.append(normalized_frame)

        # We Need at Least number of SEQUENCE_LENGTH Frames to perform a prediction.
        # Check if the number of frames in the queue is equal to the fixed sequence length.
        # if len(frames_queue) == 16:
        #     # Pass the normalized frames to the model and get the predicted probabilities.
        #     predicted_labels_probabilities = MoBiLSTM_model.predict(
        #         np.expand_dims(frames_queue, axis=0)
        #     )[0]

        #     # Get the index of class with the highest probability.
        #     predicted_label = np.argmax(predicted_labels_probabilities)

        #     # Get the class name using the retrieved index.
        #     predicted_class_name = CLASSES_LIST[predicted_label]

        # # Write predicted class name on top of the frame.
        # if predicted_class_name == "Violence":
        #     cv2.putText(
        #         frame,
        #         predicted_class_name,
        #         (5, 100),
        #         cv2.FONT_HERSHEY_SIMPLEX,
        #         3,
        #         (0, 0, 255),
        #         12,
        #     )
        # else:
        #     cv2.putText(
        #         frame,
        #         predicted_class_name,
        #         (5, 100),
        #         cv2.FONT_HERSHEY_SIMPLEX,
        #         3,
        #         (0, 255, 0),
        #         12,
        #     )

        # Display the frame.
        cv2.imshow("Prediction", frame)

        # Write The frame into the disk using the VideoWriter.
        video_writer.write(frame)

        # Break the loop if 'q' key is pressed.
        if cv2.waitKey(1) & 0xFF == ord("q"):
            break

    video_reader.release()
    video_writer.release()
    cv2.destroyAllWindows()

    # firebase.send_to_token(
    #     "fjFaquaNRK6w7hSbGnXvbi:APA91bEC6RB6QNcGXpyyo-6m3Is9PVaE3QaxL6onoCWEKVWmVGe-kcZlb0EMB-9-noza-x5up5rCWslx4zHvjYW2XVXDAkpmtejRXeQ9YixLuWfe7S5FHtfdtxvasFrx6NlKEg5VYfSg",
    #     "Message From Server",
    #     "Hello There!",
    #     {
    #         "videoUrl": "https://storage.googleapis.com/raven-2e2e0.appspot.com/testvideo"
    #     },
    # )
    # link = firebase.upload_clip("testvideo.mp4", "testvideo")
    # print(link)
    # messaging = FcmUtils()
    # messaging.send_to_token(
    #     "cNbBYeUfRwWODbNTdnkjJE:APA91bEFlgcwEX0NJy0QskDZffVwS1sdrRr6RDPm345_o3VwLtg6C5k6r-QNf9IYtmZU6sbFYNNybGGADEh4izKoTVfAFBKRs-XoAEkvHYf8ks61vvNVqC2a-SkrgdC7pHBppvNn99AP",
    #     "Alert!!",
    #     "Althaf is at my daughters house",
    #     {
    #         "score": "850",
    #         "time": "2:45am",
    #     },
    # )


if __name__ == "__main__":
    main()
