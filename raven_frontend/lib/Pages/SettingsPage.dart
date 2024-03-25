
import 'package:flutter/material.dart';
import 'package:raven_frontend/Pages/profileEdit.dart';

class SettingsPage extends StatefulWidget {
  @override
  _SettingsPageState createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 27, 23, 27),
        elevation: 0, // Remove elevation for a flat app bar
        leading: IconButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          icon: Icon(
            Icons.arrow_back,
            color: Colors.white, 
          ),
        ),
      ),
      body: Container(
        padding: EdgeInsets.all(16),
        child: ListView(
          children: [
            Text(
              "Settings",
              style: TextStyle(fontSize: 25, fontWeight: FontWeight.w500),
            ),
            SizedBox(height: 40),
            buildHeadingRow("Account"),
            Divider(height: 15, thickness: 2),
            SizedBox(height: 10),
            buildAccountOptionRow(context, "Edit Profile", () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => EditProfilePage()),
              );
            }),
            buildAccountOptionRow(context, "Content settings", () {}),
            buildAccountOptionRow(context, "Location", () {}),
            buildAccountOptionRow(context, "Language", () {}),
            buildAccountOptionRow(context, "Privacy and security", () {}),
            SizedBox(height: 40),
            buildHeadingRow("Support"),
            Divider(height: 15, thickness: 2),
            SizedBox(height: 10),
            buildNotificationOptionRow("New for you", true),
            buildAccountOptionRow(context, "FAQ", () {}),
            buildAccountOptionRow(context, "Write us a review", () {}),
            buildAccountOptionRow(context, "About", () {}),
            SizedBox(height: 50),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  onPressed: () {
                    // Save changes
                  },
                  child: Text('Save Changes'),
                ),
                ElevatedButton(
                  onPressed: () {
                    // Discard changes
                  },
                  child: Text('Discard Changes'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Row buildHeadingRow(String title) {
    return Row(
      children: [
        Icon(
          Icons.person,
          color: Colors.green,
        ),
        SizedBox(width: 8),
        Text(
          title,
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
      ],
    );
  }

  Row buildNotificationOptionRow(String title, bool isActive) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w500,
            color: Colors.grey[600],
          ),
        ),
        Transform.scale(
          scale: 0.7,
          child: Switch(
            value: isActive,
            onChanged: (bool val) {},
          ),
        )
      ],
    );
  }

  GestureDetector buildAccountOptionRow(
      BuildContext context, String title, VoidCallback onTap) {
    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 8),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              title,
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w500,
                color: Colors.grey[600],
              ),
            ),
            Icon(
              Icons.arrow_forward_ios,
              color: Colors.grey,
            ),
          ],
        ),
      ),
    );
  }
}
