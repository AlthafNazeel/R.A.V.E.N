from firebase_utils import FirebaseUtils
from WebCam import WebCam
import os


def main():
    firebase = FirebaseUtils()
    camera = WebCam()

    while True:
        frame = camera.get_frames()

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


if __name__ == "__main__":
    main()
