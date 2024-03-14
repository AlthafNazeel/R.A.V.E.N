import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:raven_frontend/Pages/alert.dart';
// import 'package:raven_frontend/Pages/signIn.dart';
// import 'package:raven_frontend/Pages/SettingsPage.dart';
import 'package:raven_frontend/Pages/signInPage.dart';
import 'package:raven_frontend/api/firebase_api.dart';
import 'package:raven_frontend/firebase_options.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';


final navigatorKey = GlobalKey<NavigatorState>();

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  await FirebaseApi().initNotification();

  final firestore = FirebaseFirestore.instance;

  
  debugPaintSizeEnabled = false; // Disable debug paint overlay
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SignIn(),
      navigatorKey: navigatorKey,
      routes: {'/notification_screen': (context) => const Alert()},
    );
  }
}
