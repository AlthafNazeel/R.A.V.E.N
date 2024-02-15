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

  String selectedFilter = 'All';

  void onFilterSelected(String filter) {
    setState(() {
      selectedFilter = filter;
    });
    // Implement your filtering logic here based on the selected filter
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(
        title: Center(
          child: Text('Notifications         ',
          style: TextStyle(color: Colors.white),
          ),
        ),

        backgroundColor: Color.fromARGB(255, 41, 29, 46),

        leading: IconButton(
          icon: Icon(Icons.menu, color: Colors.white),
          onPressed: (){
            // code to open menu
          },
        ),
      ),
      
      body: ListView(
        children: 
        
        <Widget>[

          

          Padding(
            padding: const EdgeInsets.only(top: 15, left: 17),
            child: Text(
              'Today',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
          ),

          // Notification tiles for each notification
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
  }): super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(title),
      subtitle: Text(subtitle),
      trailing: Text(time),
      leading: Icon(                                                                      // trailing Displays the time on the right side of the tile 
        isRead ? Icons.notifications_off : Icons.notifications,
        color: isRead ? Colors.grey : Colors.purple,                                  // if notification read turn icon to gray
      ),
      onTap: onTap,
    );
  }
}

class FilterButtons extends StatelessWidget {
  final String selectedFilter;
  final Function(String) onFilterSelected;

  const FilterButtons({
    Key? key,
    required this.selectedFilter,
    required this.onFilterSelected,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return PopupMenuButton<String>(
      onSelected: onFilterSelected,
      itemBuilder: (BuildContext context) => [
        PopupMenuItem<String>(
          value: 'All',
          child: Text('All'),
        ),
        PopupMenuItem<String>(
          value: 'Unread',
          child: Text('Unread'),
        ),
        PopupMenuItem<String>(
          value: 'Motion Detection',
          child: Text('Motion Detection'),
        ),
        PopupMenuItem<String>(
          value: 'Crime Detection',
          child: Text('Crime Detection'),
        ),
      ],
      child: Text(
        selectedFilter,
        style: TextStyle(color: Colors.white),
      ),
    );
  }
}