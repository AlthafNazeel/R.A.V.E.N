import 'package:flutter/material.dart';

void main() {
  runApp(const MaterialApp(
    debugShowCheckedModeBanner: false,
    home: Notifications(),
  ));
}

class Notifications extends StatelessWidget {
  const Notifications({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,

      appBar: AppBar(
        title: Center(                                                     // Center the title
          child: Text(
            'NOTIFICATIONS        ',
            style: TextStyle(color: Colors.white),
          ),
        ),

        backgroundColor: Color.fromARGB(255, 41, 29, 46),

        leading: IconButton(
          icon: Icon(Icons.menu, color: Colors.white),
          onPressed: () {
            // open the menu on button press
          },
        ),
      ),

      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Color.fromARGB(255, 41, 29, 46),
              Color.fromARGB(255, 54, 36, 63)
            ],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
      ),
    );
  }
}