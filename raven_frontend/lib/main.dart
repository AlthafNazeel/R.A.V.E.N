import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:raven_frontend/Pages/getStarted.dart';

import 'package:raven_frontend/Pages/alert.dart';
import 'package:raven_frontend/Pages/navigation.dart';
import 'package:raven_frontend/Pages/signInPage.dart';
import 'package:raven_frontend/Pages/homePage.dart';
import 'package:raven_frontend/Pages/add_device.dart';
import 'package:raven_frontend/Pages/SettingsPage.dart';
import 'package:raven_frontend/Pages/Notifications.dart';
import 'package:raven_frontend/api/firebase_api.dart';
import 'package:raven_frontend/firebase_options.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';


final navigatorKey = GlobalKey<NavigatorState>();

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  await FirebaseApi().initNotification();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: GetStartedPage(),
      navigatorKey: navigatorKey,
      routes: {
        '/notification_screen': (context) => const VideoApp(),
        '/SettingsPage': (context) => Settings(),
        '/signInPage': (context) => SignIn(),
        '/homePage': (context) => HomePage(),
        '/add_device': (context) => const AddDevice(),
        '/GetStartedPage': (context) => GetStartedPage(),
        '/Notifications': (context) => NotificationsPage(),
      },

       home: Scaffold(
        appBar: AppBar(
          title: Text('My App'),
        ),
        drawer: Navigation(), // Add your custom drawer widget here
        body: GetStartedPage(),
       ),
    );
  }
}
