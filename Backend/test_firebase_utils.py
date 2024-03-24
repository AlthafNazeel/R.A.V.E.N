import unittest
from unittest.mock import patch, MagicMock
from datetime import datetime

from firebase_admin import messaging, credentials, storage, firestore

from firebase_utils import FirebaseUtils
import os


class TestFirebaseUtils(unittest.TestCase):
    def setUp(self):
        self.firebase = FirebaseUtils("E1flICkBKrod6L6OFzpv")

    def test_get_devices(self):
        expected_device = ["ek00sNFHSCWjgSD-aCJ8yR:APA91bE4RLwXZppPMcKg"]

        device = self.firebase.get_devices()

        self.assertEqual(expected_device, device)
        print("Get Devices Success!")

    def test_update_database(self):
        title = "Test Message"
        subtitle = "Camera 03"
        priority = 2
        link = "https://storage.googleapis.com/raven-2e2e0.appspot.com/abc"

        document_id = self.firebase.update_database(
            title,
            subtitle,
            priority,
            link,
        )

        doc_ref = self.firebase.db.collection("Notifications").document(document_id)
        doc = doc_ref.get().to_dict()

        self.assertEqual(doc["title"], title)
        self.assertEqual(doc["subtitle"], subtitle)
        self.assertEqual(doc["priority"], priority)
        self.assertEqual(doc["link"], link)
        print("Update Database Success!")


if __name__ == "__main__":
    unittest.main()
