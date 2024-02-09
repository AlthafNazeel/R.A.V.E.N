from fcm_utils import FcmUtils


def main():
    messaging = FcmUtils()
    messaging.send_to_token(
        "cNbBYeUfRwWODbNTdnkjJE:APA91bEFlgcwEX0NJy0QskDZffVwS1sdrRr6RDPm345_o3VwLtg6C5k6r-QNf9IYtmZU6sbFYNNybGGADEh4izKoTVfAFBKRs-XoAEkvHYf8ks61vvNVqC2a-SkrgdC7pHBppvNn99AP",
        "Alert!!",
        "Althaf is at my daughters house",
        {
            'score': '850',
            'time': '2:45am',
        },
    )


if __name__ == "__main__":
    main()
