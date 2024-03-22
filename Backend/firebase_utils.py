from typing import Any
from firebase_admin import messaging, credentials, storage, firestore
import firebase_admin
import os
from datetime import datetime


class FirebaseUtils:
    def __init__(self, ID):
        # Variable to store the root file path
        self.file_path = os.path.dirname(os.path.abspath(__file__))

        # Firebase service account credentials loaded from a JSON file
        self.creds = credentials.Certificate(
            os.path.join(self.file_path, "serviceAccountKey.json")
        )

        # Initialize the default Firebase app with the provided credentials
        default_app = firebase_admin.initialize_app(
            self.creds, {"storageBucket": "raven-2e2e0.appspot.com"}
        )

        # Initialize Firestore database client
        self.db = firestore.client()

        # Store the server ID provided during initialization
        self.serverID = ID

        # Retrieve devices associated with the server from Firestore
        self.get_devices()

    def send_notification(self, title, body, data, priority) -> Any:

        document_id = self.update_database(title, body, priority, data["videoUrl"])
        data["id"] = document_id
        # devices = self.get_devices()
        devices = [
            "ek00sNFHSCWjgSD-aCJ8yR:APA91bE4RLwXZppPMcKg95gsqWB0H4KSGkLPxzIZRCDUN_6bQVrioiQKXvuuhKQ2K_ryMEoZ-q3pZL7ZBHaeJuG-OczP1zsFvoh150lHGW2mHmATLD363JBs5S5rbV6Q9heNSu4kAu3f"
        ]

        for d in devices:
            message = messaging.Message(
                notification=messaging.Notification(
                    title=title,
                    body=body,
                ),
                data=data,
                token=d,
            )
            response = messaging.send(message)
            print(response)

    def upload_clip(self, path, name):
        # Complete file path
        path = os.path.join(self.file_path, path)

        # Stores the clip into Firebase Storage
        bucket = storage.bucket()
        blob = bucket.blob(name)
        blob.upload_from_filename(path)

        # Set the access control list (ACL) of the blob to public-read
        blob.acl.all().grant_read()
        blob.acl.save()

        # Return the public URL of the uploaded file
        return blob.public_url

    def update_database(self, title, body, priority, link):
        doc_ref = self.db.collection("Notifications").document()
        doc_ref.set(
            {
                "subtitle": title,
                "time": datetime.now(),
                "title": body,
                "serverID": self.serverID,
                "priority": priority,
                "link": link,
                "isRead": False,
            }
        )

        document_id = doc_ref.id
        return document_id

    def get_devices(self):
        document = self.db.collection("Servers").document(self.serverID)

        doc_snapshot = document.get()

        if doc_snapshot.exists:
            document_data = doc_snapshot.to_dict()
            return document_data["tokenIDs"]
