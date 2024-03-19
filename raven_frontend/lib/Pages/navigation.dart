import 'package:flutter/material.dart';

class Navigation extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          DrawerHeader(
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
            leading: Icon(Icons.home),
            title: Text('Home'),
            onTap: () {
              Navigator.popAndPushNamed(context, '/homePage');
            },
          ),
          ListTile(
            leading: Icon(Icons.add),
            title: Text('Add Device'),
            onTap: () {
              Navigator.popAndPushNamed(context, '/add_device');
            },
          ),
          ListTile(
            leading: Icon(Icons.settings),
            title: Text('Settings'),
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
