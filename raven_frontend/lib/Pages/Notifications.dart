import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:raven_frontend/api/firebase_api.dart';
import 'package:intl/intl.dart';
import 'package:raven_frontend/main.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: NotificationsPageE(),
    );
  }
}

class NotificationsPageE extends StatefulWidget {
  const NotificationsPageE({Key? key}) : super(key: key);

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
        title: const Center(
          child: Text(
            'Notifications',
            style: TextStyle(color: Colors.white),
          ),
        ),
        backgroundColor: const Color.fromARGB(255, 41, 29, 46),
        leading: IconButton(
          icon: const Icon(Icons.menu, color: Colors.white),
          onPressed: () {
            // code to open menu
          },
        ),
      actions: [
          _buildFilterButton('All', 'all'),
          _buildFilterButton('Unread', 'unread'),
          _buildFilterButton('Fall', 'Fall'),
          _buildFilterButton('Emergency', 'Emergency'),
        ],
      ),
      body: FutureBuilder(
        future: api.getNotificationData("ADiWRUE96Mjyzgx41HHh"),
        builder: (context, AsyncSnapshot<List<Map<String, dynamic>>> snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else {
            List<Map<String, dynamic>> notifications = snapshot.data!;

            // Filter notifications based on the selected filter
            notifications = filterData(notifications, filter);

            return ListView.builder(
              itemCount: notifications.length,
              itemBuilder: (context, index) {
                final notification = notifications[index];
                final documentId = notification['id'];
                final title = notification['data']['title'] ?? 'No Title';
                final subtitle =
                    notification['data']['subtitle'] ?? 'No Subtitle';
                final time = notification['data']['time'] != null
                    ? DateFormat('hh:mm:ss')
                        .format(notification['data']['time'].toDate())
                    : 'No Time';
                final isRead = notification['data']['isRead'] ?? false;

                final link = notification['data']['link'];

                return NotificationTile(
                  title: title,
                  subtitle: subtitle,
                  time: time,
                  isRead: isRead,
                  onTap: () {
                    // api.markNotificationAsRead(documentId);
                    setState(() {});
                    navigatorKey.currentState?.pushNamed(
                      "/notification_screen",
                      arguments: RemoteMessage(
                        data: {
                          "videoUrl": link,
                          "id": documentId,
                          "title": title,
                          "subtitle": subtitle,
                        },
                      ),
                    );
                    // Navigator.push(
                    //   context,
                    //   MaterialPageRoute(
                    //     builder: (context) => Alert(),
                    //   ),
                    // );
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

  List<Map<String, dynamic>> filterData(List<Map<String, dynamic>> data, String filterType) {
    switch (filterType) {
      case 'all':
        return data;
      case 'unread':
        // return data.where((notification) => notification['data']['isRead'] == false).toList();
        final unreadNotifications = data.where((notification) => notification['data']['isRead'] == false).toList();
        print("Unread notifications: ${unreadNotifications.length}");
        return unreadNotifications;
      case 'Fall':
        final highPriorityNotifications = data.where((notification) => notification['data']['priority'] == 1).toList();
        print("High priority notifications: ${highPriorityNotifications.length}");
        return highPriorityNotifications;
      case 'Emergency':
        final emergencyNotifications = data.where((notification) => notification['data']['priority'] == 2).toList();
        print("Emergency notifications: ${emergencyNotifications.length}");
        return emergencyNotifications;
      default:
        return data; // Handle other filter types if needed
    }
  }

}

class NotificationTile extends StatelessWidget {
  final String title;
  final String subtitle;
  final String time;
  final bool isRead;
  final VoidCallback onTap;

  const NotificationTile({Key? key, 
    required this.title,
    required this.subtitle,
    required this.time,
    required this.isRead,
    required this.onTap,
  }) : super(key: key);

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