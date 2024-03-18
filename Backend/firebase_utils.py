from typing import Any
from firebase_admin import messaging, credentials, storage, firestore
import firebase_admin
import os
from datetime import datetime, timedelta
from google.auth.transport.requests import Request


class FirebaseUtils:
    def __init__(self, ID):
        self.file_path = os.path.dirname(os.path.abspath(__file__))

        self.creds = credentials.Certificate(
            os.path.join(self.file_path, "serviceAccountKey.json")
        )
        default_app = firebase_admin.initialize_app(
            self.creds, {"storageBucket": "raven-2e2e0.appspot.com"}
        )

        self.db = firestore.client()
        self.serverID = ID

    def send_to_token(self, registration_token, title, body, data, priority) -> Any:
        message = messaging.Message(
            notification=messaging.Notification(
                title=title,
                body=body,
            ),
            data=data,
            token=registration_token,
        )
        response = messaging.send(message)

        # self.update_database(title, body, priority, data[0])

        return response

    def send_to_token_multicast(self, registration_tokens, title, body, data=None):
        assert isinstance(registration_tokens, list)

        message = messaging.MulticastMessage(
            notification=messaging.Notification(
                title=title,
                body=body,
            ),
            data=data,
            token=registration_tokens,
        )
        response = messaging.send_multicast(message)
        print(response)
        return response

    def send_to_topic(self, topic, title, body, data=None) -> Any:
        message = messaging.Message(
            notification=messaging.Notification(
                title=title,
                body=body,
            ),
            data=data,
            topic=topic,
        )
        response = messaging.send(message)
        print(response)
        return response

    def upload_clip(self, path, name):
        path = os.path.join(self.file_path, path)

        bucket = storage.bucket()
        blob = bucket.blob(name)
        blob.upload_from_filename(path)

        # Set ACL to public-read
        blob.acl.all().grant_read()
        blob.acl.save()

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

    def get_devices(self):
        document = self.db.collection("Servers").document(self.serverID)

        doc_snapshot = document.get()

        if doc_snapshot.exists:
            document_data = doc_snapshot.to_dict()
            print(document_data["tokenIDs"])
