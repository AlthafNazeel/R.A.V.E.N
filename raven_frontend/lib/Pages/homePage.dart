import 'package:flutter/material.dart';
import 'package:raven_frontend/components/AppFonts.dart';

class HomePage extends StatelessWidget {
  HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 255, 255, 255),
        title: Text(
          'Home Page',
          style: TextStyle(
            fontSize: 25,
            fontWeight: FontWeight.w800,
          ),
        ),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios),
          onPressed: () {
            Navigator.pushNamed(context, '/signInPage');
          },
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.settings),
            onPressed: () {
              Navigator.pushNamed(context, '/SettingsPage');
            },
          ),
        ],
        centerTitle: true,
      ),
      resizeToAvoidBottomInset: false,
      backgroundColor: Color.fromARGB(255, 255, 255, 255),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'HOME PAGE',
              style: TextStyle(
                fontSize: 40.0,
                fontWeight: FontWeight.w900,
                color: Color.fromARGB(255, 101, 36, 120),
              ),
            ),

            SizedBox(height: 30),

            ElevatedButton(
              onPressed: () {
                // Navigate to the next page
                Navigator.pushNamed(
                  context,
                  '/add_device', 
                );
              },
              child: Container(
                padding: EdgeInsets.symmetric(
                  horizontal: 70,
                  vertical: 8,
                ),
                decoration: BoxDecoration(
                  color: Color.fromARGB(255, 101, 36, 120),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Text(
                  'Add Device',
                  style: AppFonts.ButtonFont(),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
