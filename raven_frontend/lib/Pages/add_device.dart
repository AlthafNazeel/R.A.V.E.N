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
      style: const TextStyle(color: Color.fromARGB(255, 209, 209, 209)),
      decoration: InputDecoration(
        labelText: label,
        hintText: hint,
        labelStyle: const TextStyle(color: Colors.white),
        hintStyle: const TextStyle(color: Colors.grey),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(50.0), // Adjust the radius as needed to make it rounded
        ),
      ),
    );
    const SizedBox(height: 16);
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
        title: const Center(
          child: Text(
            'ADD SERVER         ',
            style: TextStyle(color: Colors.white),
            )), // Center the title
        leading: BackButton(
          onPressed: () {
          // Navigate back to the home page
          Navigator.pushNamed(context, '/homePage');
        },
        ),
        iconTheme: const IconThemeData(color: Colors.white),
        backgroundColor: const Color.fromARGB(255, 41, 29, 46),
      ),

      body: Container(
          decoration: const BoxDecoration(
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
                  style: const TextStyle(color: Color.fromARGB(255, 209, 209, 209)),
                  decoration: InputDecoration(
                    labelText: 'Server ID',           // change this field to unchangable
                    labelStyle: const TextStyle(color: Colors.white),
                    hintStyle: const TextStyle(color: Colors.grey),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(50.0), // Adjust the radius as needed to make it rounded
                    ),
                  ),
                ),
                const SizedBox(height: 16),

                TextField(
                  style: const TextStyle(color: Color.fromARGB(255, 209, 209, 209)),
                  decoration: InputDecoration(
                    labelText: 'Alertspace Name',
                    hintText: 'Enter the desired Alertspace Name',
                    labelStyle: const TextStyle(color: Colors.white),
                    hintStyle: const TextStyle(color: Colors.grey),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(50.0), // Adjust the radius as needed to make it rounded
                    ),
                  ),
                ),
                const SizedBox(height: 16),

                TextField(
                  style: const TextStyle(color: Color.fromARGB(255, 209, 209, 209)),
                  decoration: InputDecoration(
                    labelText: 'Username',
                    hintText: 'Enter your username',
                    labelStyle: const TextStyle(color: Colors.white),
                    hintStyle: const TextStyle(color: Colors.grey),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(50.0), // Adjust the radius as needed to make it rounded
                    ),
                  ),
                ),
                const SizedBox(height: 16),

                TextField(
                  style: const TextStyle(color: Color.fromARGB(255, 209, 209, 209)), // Set text color to offwhite
                  decoration: InputDecoration(
                    labelText: 'Password',
                    hintText: 'Enter the Password',
                    labelStyle: const TextStyle(color: Colors.white),
                    hintStyle: const TextStyle(color: Colors.grey),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(50.0), // Adjust the radius as needed to make it rounded
                    ),
                  ),
                ),
                const SizedBox(height: 16),
                
                ElevatedButton(
                  onPressed: () {
                    // Add the add button code here
                  },
                  style: ElevatedButton.styleFrom(fixedSize: const Size(150, 60)),
                  child: const Text(
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
