import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:raven_frontend/Pages/Navbar/nav_layout.dart';
import 'package:raven_frontend/Pages/Navbar/navbar.dart';
import 'package:raven_frontend/Pages/SettingsPage.dart';
import 'package:raven_frontend/Pages/get%20started/onboarding.dart';
import 'package:raven_frontend/Pages/alert.dart';
import 'package:raven_frontend/Pages/signInPage.dart';
import 'package:raven_frontend/Pages/homePage.dart';
import 'package:raven_frontend/Pages/add_device.dart';
import 'package:raven_frontend/Pages/Notifications.dart';
import 'package:raven_frontend/api/firebase_api.dart';
import 'package:raven_frontend/firebase_options.dart';


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
      theme: ThemeData(
        scaffoldBackgroundColor: Colors.white,
        primaryColor: Colors.white,
      ),
      home: NavBarLayout(), // Use NavBarLayout as the home page
      navigatorKey: navigatorKey,
      routes: {
        '/navbar':(context) => NavBar(),
        '/notification_screen': (context) => const Alert(),
         '/SettingsPage': (context) => Settings(),
        '/signInPage': (context) => SignIn(),
        '/homePage': (context) => HomePage(),
        '/add_device': (context) => const AddDevice(),
        '/GetStartedPage': (context) => OnboardingPage(),
        '/Notifications': (context) => const NotificationsPageE(),
      },
    );
  }
}


