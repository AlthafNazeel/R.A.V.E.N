//import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:raven_frontend/api/firebase_api.dart';
import 'package:raven_frontend/firebase_options.dart';
//frontend packages 
import 'package:raven_frontend/Pages/SettingsPage.dart';
import 'package:raven_frontend/Pages/get%20started/onboarding.dart';
import 'package:raven_frontend/Pages/alert.dart';
//import 'package:raven_frontend/navMenu.dart';
import 'package:raven_frontend/Pages/signInPage.dart';
// import 'package:raven_frontend/Pages/homePage.dart';
import 'package:raven_frontend/Pages/add_device.dart';
import 'package:raven_frontend/Pages/Notifications.dart';

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
      home: OnboardingPage(),
      navigatorKey: navigatorKey,
      routes: {
        '/signInPage': (context) => SignIn(),
        // '/homePage': (context) => HomePage(),
        '/SettingsPage': (context) => SettingsPage(),
        '/add_device': (context) => const AddDevice(),
        '/notification_screen': (context) => Alert(),
        '/Notifications': (context) => NotificationsPageE(),
      },
    );
  }
}
