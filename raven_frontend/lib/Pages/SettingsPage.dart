import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Settings(),
    );
  }
}

class Settings extends StatelessWidget {
  @override
  _SettingsState createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  @override
  Widget build(BuildContext context) => Scaffold(
          body: SafeArea(
              child: ListView(
        padding: EdgeInsets.all(24),
        children: [SettingsGroup(title: 'Genera')],
      )));
}
