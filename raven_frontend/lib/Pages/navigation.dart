import 'package:flutter/material.dart';

class Navigation extends StatelessWidget {
  const Navigation({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          const DrawerHeader(
            decoration: BoxDecoration(
              color: Colors.blue,
            ),
            child: Text(
              'Drawer Header',
              style: TextStyle(
                color: Colors.white,
                fontSize: 24,
              ),
            ),
          ),
          ListTile(
            leading: const Icon(Icons.home),
            title: const Text('Home'),
            onTap: () {
              Navigator.popAndPushNamed(context, '/homePage');
            },
          ),
          ListTile(
            leading: const Icon(Icons.add),
            title: const Text('Add Device'),
            onTap: () {
              Navigator.popAndPushNamed(context, '/add_device');
            },
          ),
          ListTile(
            leading: const Icon(Icons.settings),
            title: const Text('Settings'),
            onTap: () {
              Navigator.popAndPushNamed(context, '/SettingsPage');
            },
          ),
          // Add more list tiles for other drawer items
        ],
      ),
    );
  }
}
