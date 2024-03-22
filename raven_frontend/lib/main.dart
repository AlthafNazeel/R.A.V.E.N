import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:raven_frontend/Pages/Navbar/navbar.dart';
import 'package:raven_frontend/Pages/get%20started/onboarding.dart';
import 'package:raven_frontend/Pages/alert.dart';
import 'package:raven_frontend/Pages/signInPage.dart';
//import 'package:raven_frontend/Pages/homePage.dart';
import 'package:raven_frontend/Pages/add_device.dart';
import 'package:raven_frontend/Pages/Notifications.dart';
import 'package:raven_frontend/api/firebase_api.dart';
import 'package:raven_frontend/firebase_options.dart';


final navigatorKey = GlobalKey<NavigatorState>();

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  await FirebaseApi().initNotification();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp( 

      debugShowCheckedModeBanner: false,
      home: NotificationsPageE(),
      navigatorKey: navigatorKey,
      routes: {
        // '/navbar':(context) => NavBar(),
        '/notification_screen': (context) =>  const Alert(),
        // '/SettingsPage': (context) => Settings(),
        '/signInPage': (context) => SignIn(),
        // '/homePage': (context) => HomePage(),
        '/add_device': (context) => const AddDevice(),
         // ignore: prefer_const_constructors
        //  '/GetStartedPage': (context) => OnboardingScreen(),
        // '/Notifications': (context) => NotificationsPage(),
     
        '/Notifications': (context) => const NotificationsPageE(),
      },
    );
  }
}
