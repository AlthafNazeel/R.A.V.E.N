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
    messaging = FcmUtils()
    messaging.send_to_token(
        "cNbBYeUfRwWODbNTdnkjJE:APA91bEFlgcwEX0NJy0QskDZffVwS1sdrRr6RDPm345_o3VwLtg6C5k6r-QNf9IYtmZU6sbFYNNybGGADEh4izKoTVfAFBKRs-XoAEkvHYf8ks61vvNVqC2a-SkrgdC7pHBppvNn99AP",
        "Alert!!",
        "Althaf is at my daughters house",
        {
            "score": "850",
            "time": "2:45am",
        },
    )


if __name__ == "__main__":
    main()
