
import 'package:flutter/material.dart';
import 'package:raven_frontend/api/firebase_api.dart'; // Import FirebaseApi
import 'package:intl/intl.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: NotificationsPageE(),
    );
  }
}

class NotificationsPageE extends StatefulWidget {
  @override
  _NotificationsPageState createState() => _NotificationsPageState();
}

class _NotificationsPageState extends State<NotificationsPageE> {
  final FirebaseApi api = FirebaseApi(); // Initialize FirebaseApi

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text(
            'Notifications',
            style: TextStyle(color: Colors.white),
          ),
        ),
        backgroundColor: Color.fromARGB(255, 41, 29, 46),
        leading: IconButton(
          icon: Icon(Icons.menu, color: Colors.white),
          onPressed: () {
            // code to open menu
          },
        ),
      ),
      body: FutureBuilder(
        future: api.getNotificationData("ADiWRUE96Mjyzgx41HHh"), // serverID 
        builder: (context, AsyncSnapshot<List<dynamic>> snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else {
            List<dynamic> notifications = snapshot.data!;
            return ListView.builder(
              itemCount: notifications.length,
              itemBuilder: (context, index) {
                final notification = notifications[index];
                final title = notification['title'] ?? 'No Title';
                final subtitle = notification['subtitle'] ?? 'No Subtitle';
                // final time = notification['time'] ?? 'No Time'; 
                final time = notification['time'] != null
                // ? DateFormat('yyyy-MM-dd HH:mm:ss').format(notification['time'].toDate())
                ? DateFormat('hh:mm:ss').format(notification['time'].toDate())
                : 'No Time';

                return NotificationTile(
                  title: title,
                  subtitle: subtitle,
                  time: time,
                  onTap: () {
                    // what to do on tap
                  },
                );
              },
            );
          }
        },
      ),
    );
  }
}

class NotificationTile extends StatelessWidget {
  final String title;
  final String subtitle;
  final String time;
  final VoidCallback onTap;

  const NotificationTile({
    required this.title,
    required this.subtitle,
    required this.time,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(title),
      subtitle: Text(subtitle),
      trailing: Text(time),
      onTap: onTap,
    );
  }
}
