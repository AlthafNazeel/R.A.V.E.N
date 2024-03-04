import 'package:flutter/material.dart';
import 'package:raven_frontend/Pages/getStarted.dart';


void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: GetStartedPage(),
    );
  }
}
