import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SettingsPage(),
    );
  }
}

class SettingsPage extends StatelessWidget {
  // Define the desired color
  final Color _backgroundColor = Color.fromARGB(255, 36, 32, 40); // b6bbc4

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Settings'),
      ),
      backgroundColor:
          _backgroundColor, // Use the defined color as the background color
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Main Headings
              ListTile(
                title: Text(
                  'General',
                  style: TextStyle(color: Colors.white, fontSize: 20.0),
                ),
              ),
              // Subheadings and Options under General
              ListTile(
                title: Text(
                  'Language',
                  style: TextStyle(color: Colors.white, fontSize: 18.0),
                ),
                trailing: DropdownButton<String>(
                  onChanged: (String? newValue) {
                    // Handle language selection
                  },
                  items: <String>[
                    'English',
                    'Spanish',
                    'French',
                    'German',
                    'Chinese'
                  ].map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(
                        value,
                        style: TextStyle(
                            color: const Color.fromARGB(255, 0, 0, 0),
                            fontSize: 17.0),
                      ),
                    );
                  }).toList(),
                ),
              ),
              ListTile(
                title: Text(
                  'Location',
                  style: TextStyle(color: Colors.white, fontSize: 18.0),
                ),
                onTap: () {
                  // Navigate to location settings page
                },
              ),
              // Main Headings
              ListTile(
                title: Text(
                  'Account',
                  style: TextStyle(color: Colors.white, fontSize: 20.0),
                ),
              ),
              // Options under Account
              ListTile(
                title: Text(
                  'Change Name',
                  style: TextStyle(color: Colors.white, fontSize: 18.0),
                ),
                onTap: () {
                  // Navigate to change name page
                },
              ),
              ListTile(
                title: Text(
                  'Change Password',
                  style: TextStyle(color: Colors.white, fontSize: 18.0),
                ),
                onTap: () {
                  // Navigate to change password page
                },
              ),
              // Options under System
              ListTile(
                title: Text(
                  'System',
                  style: TextStyle(color: Colors.white, fontSize: 20.0),
                ),
              ),
              ListTile(
                title: Text(
                  'Current Server',
                  style: TextStyle(color: Colors.white, fontSize: 18.0),
                ),
                onTap: () {
                  // Show current server details
                },
              ),
              // Options under Support
              ListTile(
                title: Text(
                  'Support',
                  style: TextStyle(color: Colors.white, fontSize: 20.0),
                ),
              ),
              ListTile(
                title: Text(
                  'About',
                  style: TextStyle(color: Colors.white, fontSize: 18.0),
                ),
                onTap: () {
                  // Navigate to about page
                },
              ),
              ListTile(
                title: Text(
                  'Write a Review',
                  style: TextStyle(color: Colors.white, fontSize: 18.0),
                ),
                onTap: () {
                  // Navigate to review page
                },
              ),
              ListTile(
                title: Text(
                  'FAQ',
                  style: TextStyle(color: Colors.white, fontSize: 18.0),
                ),
                onTap: () {
                  // Navigate to FAQ page
                },
              ),
              // Centered Buttons
              Center(
                child: Column(
                  children: [
                    ElevatedButton(
                      onPressed: () {
                        // Save settings
                      },
                      style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all<Color>(Color(
                            0xFF381B4A)), // Change button color to your desired hexadecimal value
                        padding: MaterialStateProperty.all<EdgeInsetsGeometry>(
                            EdgeInsets.symmetric(
                                vertical: 16.0,
                                horizontal: 32.0)), // Adjust padding
                        minimumSize: MaterialStateProperty.all<Size>(
                            Size(200.0, 50.0)), // Adjust minimum size
                      ),
                      child: Text(
                        'Save Settings',
                        style: TextStyle(color: Colors.white, fontSize: 18.0),
                      ),
                    ),
                    ElevatedButton(
                      onPressed: () {
                        // Reset settings
                      },
                      style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all<Color>(Color(
                            0xFF381B4A)), // Change button color to your desired hexadecimal value
                      ),
                      child: Text(
                        'Reset Settings',
                        style: TextStyle(color: Colors.white, fontSize: 18.0),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
