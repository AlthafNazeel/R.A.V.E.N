import 'package:flutter/material.dart';
import 'package:raven_frontend/Pages/getStarted.dart';
import 'package:flutter/rendering.dart';
import 'package:raven_frontend/Pages/alert.dart';
import 'package:raven_frontend/Pages/signInPage.dart';
import 'package:raven_frontend/Pages/homePage.dart';
import 'package:raven_frontend/Pages/add_device.dart';
import 'package:raven_frontend/Pages/SettingsPage.dart';
import 'package:raven_frontend/Pages/Notifications.dart';
import 'package:raven_frontend/api/firebase_api.dart';
import 'package:raven_frontend/firebase_options.dart';


final navigatorKey = GlobalKey<NavigatorState>();

void main() {
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
        '/notification_screen': (context) => const Alert(),
        '/SettingsPage': (context) =>  Settings(),
        '/signInPage': (context) =>  SignIn(),
        '/homePage': (context) =>  HomePage(),
        '/add_device': (context) => const AddDevice(),
        '/GetStartedPage': (context) => GetStartedPage(),
        '/Notifications': (context) => NotificationsPage(),
      },
    );
  }
}