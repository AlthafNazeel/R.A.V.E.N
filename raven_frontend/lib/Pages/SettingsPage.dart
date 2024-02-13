import 'package:flutter/material.dart';
void main() {
  runApp( MaterialApp(
    debugShowCheckedModeBanner: false,
    home: Settings(),
  ));
}

class Settings extends StatelessWidget {
  Settings({Key? key}) : super(key: key);

  final userNameController = TextEditingController();
  final paswordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Settings',
        style: TextStyle(
          fontSize: 25,
          fontWeight: FontWeight.w800

        ),
        ),
        leading: IconButton (
            icon: const Icon(Icons.menu),
            onPressed: (){},
            ),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(20),
                bottomRight: Radius.circular(20)
              )
            ),
        centerTitle: true,

      ),

      backgroundColor: Color.fromARGB(255, 0, 0, 0),
      body: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 20),//space box from top
              Padding(
                padding: const EdgeInsets.only(left: 20.0),
                child: Text(
                  'General Settings',
                  style: TextStyle(
                    fontSize: 25 ,
                    fontWeight: FontWeight.w800,
                    color: Colors.white,
                  ),
                ),
              ),

              const SizedBox(height: 30),//space box from top

              AccountOption(context,'Language'),
              const SizedBox(height: 10),//space box from top
              AccountOption(context,'Theme'),
              const SizedBox(height: 10),//space box from top
              AccountOption(context,'Notification'),
              const SizedBox(height: 10),//space box from top
              AccountOption(context,'Connection'),

            ],
            
          ),
      ),
    );
  }
}

GestureDetector AccountOption(BuildContext context, String title) {
  return GestureDetector(
    
    child: Padding(
      padding: const EdgeInsets.only(left: 20, right: 20),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12.0), // Adjust the border radius as needed
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                title,
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w400,
                  color: Colors.black,
                ),
              ),
              Icon(
                Icons.arrow_forward_ios,
                color: Colors.black,
                size: 18,
              ),
            ],
          ),
        ),
      ),
    ),
  );
}
