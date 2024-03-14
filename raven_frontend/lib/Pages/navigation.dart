import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Side Pop-up Navigation'),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            _showSideNavigation(context);
          },
          child: Text('Show Navigation'),
        ),
      ),
    );
  }

  void _showSideNavigation(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return MySideNavigation();
      },
    );
  }
}

class MySideNavigation extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200.0, // Set the height as per your requirement
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          ListTile(
            title: Text('Option 1'),
            onTap: () {
              // Handle Option 1
              Navigator.pop(context);
            },
          ),
          ListTile(
            title: Text('Option 2'),
            onTap: () {
              // Handle Option 2
              Navigator.pop(context);
            },
          ),
          // Add more ListTile widgets for additional options
        ],
      ),
    );
  }
}
