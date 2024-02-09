from fcm_utils import FcmUtils


def main():
    messaging = FcmUtils()
    messaging.send_to_token(
        "fjFaquaNRK6w7hSbGnXvbi:APA91bEC6RB6QNcGXpyyo-6m3Is9PVaE3QaxL6onoCWEKVWmVGe-kcZlb0EMB-9-noza-x5up5rCWslx4zHvjYW2XVXDAkpmtejRXeQ9YixLuWfe7S5FHtfdtxvasFrx6NlKEg5VYfSg",
        "Message From Server",
        "Hello There!",
    )


if __name__ == "__main__":
    main()
