
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
  String filter = 'all'; // Default filter value
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
      actions: [
          _buildFilterButton('All', 'all'),
          _buildFilterButton('Unread', 'unread'),
          _buildFilterButton('Fall', 'Fall'),
          _buildFilterButton('Motion', 'motion'),
        ],
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
                final isRead = notification['isRead'] ?? false;

                return NotificationTile(
                  title: title,
                  subtitle: subtitle,
                  time: time,
                  isRead: isRead,
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

  Widget _buildFilterButton(String text, String filterType) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextButton(
        onPressed: () {
          setState(() {
            filter = filterType;
          });
        },
        child: Text(
          text,
          style: TextStyle(
            color: filter == filterType ? Colors.purple : Colors.white,
          ),
        ),
      ),
    );
  }

}

class NotificationTile extends StatelessWidget {
  final String title;
  final String subtitle;
  final String time;
  final bool isRead;
  final VoidCallback onTap;

  const NotificationTile({
    required this.title,
    required this.subtitle,
    required this.time,
    required this.isRead,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(
      title,
      style: TextStyle(
        fontWeight: isRead ? FontWeight.normal : FontWeight.bold,
      ),
    ),
      subtitle: Text(subtitle),
      trailing: Text(time),
      leading: Icon(
        // trailing Displays the time on the right side of the tile
        isRead ? Icons.notifications_off : Icons.notifications,
        color: isRead ? Colors.grey : Colors.purple,
        // if notification read turn icon to gray
      ),
      onTap: onTap,
    );
  }
}