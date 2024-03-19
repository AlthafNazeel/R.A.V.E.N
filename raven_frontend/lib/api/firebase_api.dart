import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:raven_frontend/main.dart';
import 'package:firebase_storage/firebase_storage.dart';

class FirebaseApi {
  final _firebaseMessaging = FirebaseMessaging.instance;
  final db = FirebaseFirestore.instance;
  final FirebaseStorage storage = FirebaseStorage.instance;

  var fCMToken;

  Future<void> initNotification() async {
    await _firebaseMessaging.requestPermission();

    fCMToken = await _firebaseMessaging.getToken();

    print("Token $fCMToken");

    initPushNotifications();
  }

  void handleMessage(RemoteMessage? message) {
    if (message == null) return;

    navigatorKey.currentState
        ?.pushNamed("/notification_screen", arguments: message);
  }

  Future initPushNotifications() async {
    FirebaseMessaging.instance.getInitialMessage().then(handleMessage);

    FirebaseMessaging.onMessageOpenedApp.listen(handleMessage);
  }

  void addSystem(String serverID, String pwd) async {
    try {
      DocumentSnapshot documentSnapshot =
          await db.collection("Servers").doc(serverID).get();

      if (documentSnapshot.exists) {
        if (documentSnapshot.get("password") == pwd) {
          await db.collection("Servers").doc(serverID).update({
            "tokenIDs": FieldValue.arrayUnion([fCMToken]),
          });
          print("${documentSnapshot.id} => ${documentSnapshot.data()}");
        } else {
          print("Password does not match!");
        }
      } else {
        print("Document does not exist");
      }
    } catch (error) {
      print('Error getting document: $error');
    }
  }

  Future<List<Map<String, dynamic>>> getNotificationData(
      String serverID) async {
    try {
      QuerySnapshot querySnapshot = await FirebaseFirestore.instance
          .collection("Notifications")
          .where("serverID", isEqualTo: serverID)
          .get();

      if (querySnapshot.docs.isNotEmpty) {
        return querySnapshot.docs.map((doc) {
          return {'id': doc.id, 'data': doc.data()};
        }).toList();
      } else {
        print("No documents found with serverID: $serverID");
        return [];
      }
    } catch (error) {
      print('Error getting notification data: $error');
      return [];
    }
  }

  Future<void> markNotificationAsRead(String documentId) async {
    try {
      await FirebaseFirestore.instance
          .collection("Notifications")
          .doc(documentId)
          .update({'isRead': true});
      print('Notification marked as read: $documentId');
    } catch (error) {
      print('Error marking notification as read: $error');
    }
  }

  Future<List<dynamic>> getNotificationCount(
      String serverID, int priority) async {
    try {
      QuerySnapshot querySnapshot = await FirebaseFirestore.instance
          .collection("Notifications")
          .where("serverID", isEqualTo: serverID)
          .where("priority", isEqualTo: priority)
          .get();

      if (querySnapshot.docs.isNotEmpty) {
        return querySnapshot.docs.map((doc) => doc.data()).toList();
      } else {
        print("No documents found with serverID: $serverID");
        return [];
      }
    } catch (error) {
      print('Error getting notification data: $error');
      return [];
    }
  }
}
