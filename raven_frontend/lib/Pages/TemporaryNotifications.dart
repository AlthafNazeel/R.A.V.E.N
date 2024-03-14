import 'package:flutter/material.dart';



void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: NotificationsPage(),
    );
  }
}

class NotificationsPage extends StatefulWidget {
  @override
  _NotificationsPageState createState() => _NotificationsPageState();
}

class _NotificationsPageState extends State<NotificationsPage> {
  String filter = 'all'; // Default filter value

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text(
            'Notifications         ',
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
          _buildFilterButton('Motion', 'motion'),
          _buildFilterButton('Crime', 'crime'),
        ],
      ),
      body: ListView(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(top: 15, left: 17),
            child: Text(
              'Today',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
          ),
          // Notification tiles for each notification


//           StreamBuilder<QuerySnapshot>(
//   stream: FirebaseFirestore.instance
//       .collection('your_collection_name') // Replace with your collection name
//       .snapshots(),
//   builder: (context, snapshot) {
//     if (snapshot.hasError) {
//       return Center(child: Text('Error fetching notifications'));
//     }

//     if (snapshot.connectionState == ConnectionState.waiting) {
//       return Center(child: CircularProgressIndicator());
//     }

//     final notifications = snapshot.data!.docs; // List of documents

//     return ListView.builder(
//       itemCount: notifications.length,
//       itemBuilder: (context, index) {
        
//         final notificationData = notifications[index].data();
//         final title = notificationData['title'] as String;
//         final subtitle = notificationData['subtitle'] as String;
//         final time = notificationData['time'] as String;
//         final isRead = notificationData['isRead'] as bool;

//         return NotificationTile(
//           key: UniqueKey(),
//           title: title,
//           subtitle: subtitle,
//           time: time,
//           isRead: isRead,
//           onTap: () {}, // Handle tile tap if needed
//         );
//       },
//     );
//   },
// ),

// StreamBuilder<QuerySnapshot>(
//         stream: FirebaseFirestore.instance
//             .collection('Notifications') // Replace with your collection name
//             .snapshots(),
//         builder: (context, snapshot) {
//           if (snapshot.hasError) {
//             return Center(child: Text('Error fetching notifications'));
//           }

//           if (snapshot.connectionState == ConnectionState.waiting) {
//             return Center(child: CircularProgressIndicator());
//           }

//           final notifications = snapshot.data!.docs; // List of documents

//           return ListView.builder(
//             itemCount: notifications.length,
//             itemBuilder: (context, index) {
//               final notificationData = notifications[index].data(); // Using null-aware operator

//               // Safely access notification data using null-aware operator (?)
//               final title = notificationData?['title'] as String?;
//               final subtitle = notificationData?['subtitle'] as String?;
//               final time = notificationData?['time'] as String?;
//               final isRead = notificationData?['isRead'] as bool?;

//               if (title != null && subtitle != null && time != null && isRead != null) {
//                 // Use the retrieved data to build NotificationTile widgets
//                 return NotificationTile(
//                   key: UniqueKey(),
//                   title: title,
//                   subtitle: subtitle,
//                   time: time,
//                   isRead: isRead,
//                   onTap: () {}, // Handle tile tap if needed
//                 );
//               } else {
//                 // Handle the case where some data is missing
//                 return Text('Missing notification data');
//               }
//             },
//           );
//         },
//       ),

        

          NotificationTile(
            key: UniqueKey(),
            title: 'Motion detected',
            subtitle: 'Camera 03',
            time: '14:23',
            isRead: false,
            onTap: () {},
          ),
          NotificationTile(
            key: UniqueKey(),
            title: 'Crime detected',
            subtitle: 'Camera 05',
            time: '16:13',
            isRead: true,
            onTap: () {},
          ),
          NotificationTile(
            key: UniqueKey(),
            title: 'Motion detected',
            subtitle: 'Camera 03',
            time: '14:23',
            isRead: true,
            onTap: () {},
          ),
          NotificationTile(
            key: UniqueKey(),
            title: 'Crime detected',
            subtitle: 'Camera 05',
            time: '16:13',
            isRead: false,
            onTap: () {},
          ),

          Padding(
            padding: const EdgeInsets.only(top: 15, left: 17),
            child: Text(
              'Older',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
          ),

          NotificationTile(
            key: UniqueKey(),
            title: 'Motion detected',
            subtitle: 'Camera 03',
            time: '14:23',
            isRead: true,
            onTap: () {},
          ),
          NotificationTile(
            key: UniqueKey(),
            title: 'Crime detected',
            subtitle: 'Camera 05',
            time: '16:13',
            isRead: true,
            onTap: () {},
          ),
        ],
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
  // final Key key;
  final String title;
  final String subtitle;
  final String time;
  final bool isRead;
  final VoidCallback onTap;

  const NotificationTile({
    required Key key,
    required this.title,
    required this.subtitle,
    required this.time,
    required this.isRead,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(title),
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
