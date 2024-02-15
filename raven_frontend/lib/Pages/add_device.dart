import 'package:flutter/material.dart';

void main() {
  runApp(const MaterialApp(
    debugShowCheckedModeBanner: false,
    home: AddDevice(),
  ));
}


MyTextField(String label, String hint){
  // @override
  // Widget build(BuildContext context) {
    return TextField(
      style: TextStyle(color: const Color.fromARGB(255, 209, 209, 209)),
      decoration: InputDecoration(
        labelText: label,
        hintText: hint,
        labelStyle: TextStyle(color: Colors.white),
        hintStyle: TextStyle(color: Colors.grey),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(50.0), // Adjust the radius as needed to make it rounded
        ),
      ),
    );
    SizedBox(height: 16);
  // }
}


class AddDevice extends StatelessWidget {
  const AddDevice({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Color.fromARGB(255, 12, 0, 27),
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.transparent,

      appBar: AppBar(
        title: Center(
          child: Text(
            'ADD DEVICE         ',
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

                // MyTextField('hello','name'),

                TextField(
                  style: TextStyle(color: const Color.fromARGB(255, 209, 209, 209)),
                  decoration: InputDecoration(
                    labelText: 'Adding Type',
                    labelStyle: TextStyle(color: Colors.white),
                    hintStyle: TextStyle(color: Colors.grey),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(50.0), // Adjust the radius as needed to make it rounded
                    ),
                  ),
                ),
                SizedBox(height: 16),

                TextField(
                  style: TextStyle(color: const Color.fromARGB(255, 209, 209, 209)), // Set text color to offwhite
                  decoration: InputDecoration(
                    labelText: 'Alias',
                    hintText: 'Enter the alias',
                    labelStyle: TextStyle(color: Colors.white),
                    hintStyle: TextStyle(color: Colors.grey),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(50.0), // Adjust the radius as needed to make it rounded
                    ),
                  ),
                ),
                SizedBox(height: 16),

                TextField(
                  style: TextStyle(color: const Color.fromARGB(255, 209, 209, 209)),
                  decoration: InputDecoration(
                    labelText: 'Address',
                    hintText: 'Enter the Address',
                    labelStyle: TextStyle(color: Colors.white),
                    hintStyle: TextStyle(color: Colors.grey),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(50.0), // Adjust the radius as needed to make it rounded
                    ),
                  ),
                ),
                SizedBox(height: 16),

                TextField(
                  style: TextStyle(color: const Color.fromARGB(255, 209, 209, 209)),
                  decoration: InputDecoration(
                    labelText: 'Port',
                    hintText: 'Enter the port',
                    labelStyle: TextStyle(color: Colors.white),
                    hintStyle: TextStyle(color: Colors.grey),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(50.0), // Adjust the radius as needed to make it rounded
                    ),
                  ),
                ),
                SizedBox(height: 16),

                TextField(
                  style: TextStyle(color: const Color.fromARGB(255, 209, 209, 209)),
                  decoration: InputDecoration(
                    labelText: 'Username',
                    hintText: 'Enter your username',
                    labelStyle: TextStyle(color: Colors.white),
                    hintStyle: TextStyle(color: Colors.grey),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(50.0), // Adjust the radius as needed to make it rounded
                    ),
                  ),
                ),
                SizedBox(height: 16),

                TextField(
                  style: TextStyle(color: const Color.fromARGB(255, 209, 209, 209)),
                  obscureText: true, // This hides the entered text for password fields
                  decoration: InputDecoration(
                    labelText: 'Password',
                    hintText: 'Enter your password',
                    labelStyle: TextStyle(color: Colors.white),
                    hintStyle: TextStyle(color: Colors.grey),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(50.0), // Adjust the radius as needed to make it rounded
                    ),
                  ),
                ),
                SizedBox(height: 16),

                TextField(
                  style: TextStyle(color: const Color.fromARGB(255, 209, 209, 209)),
                  decoration: InputDecoration(
                    labelText: 'Camera No.',
                    hintText: 'Enter the Camera No.',
                    labelStyle: TextStyle(color: Colors.white),
                    hintStyle: TextStyle(color: Colors.grey),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(50.0), // Adjust the radius as needed to make it rounded
                    ),
                  ),
                ),
                SizedBox(height: 60),
                
                ElevatedButton(
                  onPressed: () {
                    // Add the add button code here
                  },
                  style: ElevatedButton.styleFrom(fixedSize: const Size(150, 60)),
                  child: Text(
                    'Add',
                    style: TextStyle(fontSize: 20),
                  ),
                ),
              ],
            ),
          ),
        ),
    );
  }
}
