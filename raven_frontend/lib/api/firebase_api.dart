import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:raven_frontend/main.dart';

class FirebaseApi {
  final _firebaseMessaging = FirebaseMessaging.instance;
  final db = FirebaseFirestore.instance;

  var fCMToken;

  Future<void> initNotification() async {
    await _firebaseMessaging.requestPermission();

    fCMToken = await _firebaseMessaging.getToken();

    print("Token $fCMToken");

    // await db.collection("Notifications").get().then((event) {
    //   for (var doc in event.docs) {
    //     print("${doc.id} => ${doc.data()}");
    //   }
    // });

    // addSystem("ADiWRUE96Mjyzgx41HHh", "dsadsa");
    // print(getNotificationData("ADiWRUE96Mjyzgx41HHh"));

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

  Future<List<dynamic>> getNotificationData(String serverID) async {
    try {
      QuerySnapshot querySnapshot = await FirebaseFirestore.instance
          // .collection("Notifications")
          .collection("NewNotifications") 
          .where("serverID", isEqualTo: serverID)
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

Future<void> updateNotificationReadStatus({
    required String notificationId,
    required bool isRead,
  }) async {
    try {
      // Reference the document containing the notification data
      final docRef = FirebaseFirestore.instance.collection('NewNotifications').doc(notificationId);

      // Update the 'isRead' field
      await docRef.update({
        'isRead': isRead,
      });
    } catch (error) {
      // Handle errors during update
      print('Error updating isRead: $error');
      // Consider providing user feedback
    }
  }


}

