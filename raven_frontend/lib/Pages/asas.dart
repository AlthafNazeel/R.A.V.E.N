// import 'dart:ffi';

import 'package:flutter/material.dart';

void main() {
  runApp(const MaterialApp(
    home: MyLoginPage(),
  ));
}

class MyLoginPage extends StatelessWidget {
  const MyLoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Color.fromARGB(255, 12, 0, 27),
      backgroundColor: Colors.transparent,

      appBar: AppBar(
        title: Center(
          child: Text(
            'ADD DEVICE          ',
            style: TextStyle(color: Colors.white),
            )), // Center the title
        leading: BackButton(
          onPressed: () {
            // Handle back navigation
          },
        ),
        iconTheme: IconThemeData(color: Colors.white),
        backgroundColor: Color.fromARGB(255, 41, 29, 46),
      ),

      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Color.fromARGB(255, 41, 29, 46), Color.fromARGB(255, 54, 36, 63)],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
      
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [

              TextField(
                decoration: InputDecoration(
                  labelText: 'Adding Type',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(50.0), // Adjust the radius as needed to make it rounded
                  ),
                ),
              ),
              SizedBox(height: 16),

              TextField(
                decoration: InputDecoration(
                  labelText: 'Alias',
                  hintText: 'Enter the alias',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(50.0), // Adjust the radius as needed to make it rounded
                  ),
                ),
              ),
              SizedBox(height: 16),

              TextField(
                decoration: InputDecoration(
                  labelText: 'Address',
                  hintText: 'Enter the Address',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(50.0), // Adjust the radius as needed to make it rounded
                  ),
                ),
              ),
              SizedBox(height: 16),

              TextField(
                decoration: InputDecoration(
                  labelText: 'Port',
                  hintText: 'Enter the port',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(50.0), // Adjust the radius as needed to make it rounded
                  ),
                ),
              ),
              SizedBox(height: 16),

              TextField(
                decoration: InputDecoration(
                  labelText: 'Username',
                  hintText: 'Enter your username',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(50.0), // Adjust the radius as needed to make it rounded
                  ),
                ),
              ),
              SizedBox(height: 16),

              TextField(
                obscureText: true, // This hides the entered text for password fields
                decoration: InputDecoration(
                  labelText: 'Password',
                  hintText: 'Enter your password',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(50.0), // Adjust the radius as needed to make it rounded
                  ),
                ),
              ),
              SizedBox(height: 16),

              TextField(
                decoration: InputDecoration(
                  labelText: 'Camera No.',
                  hintText: 'Enter the Camera No.',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(50.0), // Adjust the radius as needed to make it rounded
                  ),
                ),
              ),
              SizedBox(height: 16),
              
              ElevatedButton(
                onPressed: () {
                  // Add the add button code here
                },
                child: Text('Add'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
