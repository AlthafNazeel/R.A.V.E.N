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
        backgroundColor: Color.fromARGB(255, 225, 225, 225),

        // title: Text('Settings',
        // style: TextStyle(
        //   fontSize: 25,
        //   fontWeight: FontWeight.w800

        // ),
        // ),
        leading: IconButton (
            icon: const Icon(Icons.arrow_back_ios),
            onPressed: (){},
            ),
            
        centerTitle: true,

      ),

      backgroundColor: Color.fromARGB(255, 225, 225, 225),
      body: Padding(
        padding: const EdgeInsets.only(top: 15.0, left: 20.0, right: 15.0,bottom: 30.0),
        child: SafeArea(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [          
                  Text('Settings',
                    style: TextStyle(
                      fontSize: 35 ,
                      fontWeight: FontWeight.w800,
                      color: Color.fromARGB(255, 0, 0, 0),
                    ),
                  ),
                  const SizedBox(height: 20),
                  Text('Account',
                    style: TextStyle(
                      fontSize: 20 ,
                      fontWeight: FontWeight.w800,
                      color: Color.fromARGB(255, 0, 0, 0),
                    ) ,
                  ),
                  const SizedBox(height: 80),
                  Text('General',
                    style: TextStyle(
                      fontSize: 20 ,
                      fontWeight: FontWeight.w800,
                      color: Color.fromARGB(255, 0, 0, 0),
                    ) ,
                  ),
        
                
                
        
                // const SizedBox(height: 30),//space box from top
        
                AccountOption(context,'Language'),
                // const SizedBox(height: 20),//space box from top
                AccountOption(context,'Appearance'),
                // const SizedBox(height: 20),//space box from top
                AccountOption(context,'Notification'),
                // const SizedBox(height: 20),//space box from top
                AccountOption(context,'Connection'),
                 Expanded(
                  child: SizedBox(), // Takes up remaining space
                ),
                AccountOption(context,'Logout'),
        
              ],
              
            ),
        ),
      ),
    );
  }
}

GestureDetector AccountOption(BuildContext context, String title) {
  return GestureDetector(
    
    child: Padding(
      padding: const EdgeInsets.only(left: 0, right: 10),
      child: Container(
        decoration: BoxDecoration(
          // color: Color.fromARGB(255, 101, 36, 120),
          // borderRadius: BorderRadius.circular(12.0), // Adjust the border radius as needed
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                title,
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w700,
                  color: Color.fromARGB(255, 101, 36, 120),
                ),
              ),
              Icon(
                Icons.arrow_forward_ios,
                color: const Color.fromARGB(255, 101, 36, 120),
                size: 18,
              ),
            ],
          ),
        ),
      ),
    ),
  );
}
