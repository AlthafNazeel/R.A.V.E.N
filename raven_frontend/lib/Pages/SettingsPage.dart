// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';

// class SettingsPage extends StatefulWidget {
//   @override
//   _SettingsPageState createState() => _SettingsPageState();
// }

// class _SettingsPageState extends State<SettingsPage> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         backgroundColor: Color.fromARGB(255, 27, 23, 27),
//         elevation: 1,
//         leading: IconButton(
//           onPressed: () {
//             Navigator.of(context).pop();
//           },
//           icon: Icon(
//             Icons.arrow_back,
//             color: const Color.fromARGB(255, 0, 0, 0),
//           ),
//         ),
//       ),
//       body: Container(
//         padding: EdgeInsets.only(left: 16, top: 25, right: 16),
//         child: ListView(
//           children: [
//             Text(
//               "Settings",
//               style: TextStyle(fontSize: 25, fontWeight: FontWeight.w500),
//             ),
//             SizedBox(
//               height: 40,
//             ),
//             Row(
//               children: [
//                 Icon(
//                   Icons.person,
//                   color: Color.fromRGBO(76, 175, 80, 1),
//                 ),
//                 SizedBox(
//                   width: 8,
//                 ),
//                 Text(
//                   "Account",
//                   style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
//                 ),
//               ],
//             ),
//             Divider(
//               height: 15,
//               thickness: 2,
//             ),
//             SizedBox(
//               height: 10,
//             ),
//             buildAccountOptionRow(context, "Edit Profile"),
//             buildAccountOptionRow(context, "Content settings"),
//             buildAccountOptionRow(context, "Location"),
//             buildAccountOptionRow(context, "Language"),
//             buildAccountOptionRow(context, "Privacy and security"),
//             SizedBox(
//               height: 40,
//             ),
//             Row(
//               children: [
//                 Icon(
//                   Icons.volume_up_outlined,
//                   color: Colors.green,
//                 ),
//                 SizedBox(
//                   width: 8,
//                 ),
//                 Text(
//                   "Notifications",
//                   style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
//                 ),
//               ],
//             ),
//             Divider(
//               height: 15,
//               thickness: 2,
//             ),
//             SizedBox(
//               height: 10,
//             ),
//             buildNotificationOptionRow("New for you", true),
//             buildNotificationOptionRow("Account activity", true),
//             buildNotificationOptionRow("Opportunity", false),
//             SizedBox(
//               height: 50,
//             ),
//             Center(
//               child: OutlinedButton(
//                 style: ButtonStyle(
//                   padding: MaterialStateProperty.all<EdgeInsets>(
//                     EdgeInsets.symmetric(horizontal: 40),
//                   ),
//                   shape: MaterialStateProperty.all<OutlinedBorder>(
//                     RoundedRectangleBorder(
//                       borderRadius: BorderRadius.circular(20),
//                     ),
//                   ),
//                 ),
//                 onPressed: () {},
//                 child: Text(
//                   "SIGN OUT",
//                   style: TextStyle(
//                     fontSize: 16,
//                     letterSpacing: 2.2,
//                     color: Colors.black,
//                   ),
//                 ),
//               ),
//             )
//           ],
//         ),
//       ),
//     );
//   }

//   Row buildNotificationOptionRow(String title, bool isActive) {
//     return Row(
//       mainAxisAlignment: MainAxisAlignment.spaceBetween,
//       children: [
//         Text(
//           title,
//           style: TextStyle(
//               fontSize: 18,
//               fontWeight: FontWeight.w500,
//               color: Colors.grey[600]),
//         ),
//         Transform.scale(
//             scale: 0.7,
//             child: CupertinoSwitch(
//               value: isActive,
//               onChanged: (bool val) {},
//             ))
//       ],
//     );
//   }

//   GestureDetector buildAccountOptionRow(BuildContext context, String title) {
//     return GestureDetector(
//       onTap: () {
//         showDialog(
//             context: context,
//             builder: (BuildContext context) {
//               return AlertDialog(
//                 title: Text(title),
//                 content: Column(
//                   mainAxisSize: MainAxisSize.min,
//                   children: [
//                     Text("Option 1"),
//                     Text("Option 2"),
//                     Text("Option 3"),
//                   ],
//                 ),
//                 actions: [
//                   TextButton(
//                       onPressed: () {
//                         Navigator.of(context).pop();
//                       },
//                       child: Text("Close")),
//                 ],
//               );
//             });
//       },
//       child: Padding(
//         padding: const EdgeInsets.symmetric(vertical: 8.0),
//         child: Row(
//           mainAxisAlignment: MainAxisAlignment.spaceBetween,
//           children: [
//             Text(
//               title,
//               style: TextStyle(
//                 fontSize: 18,
//                 fontWeight: FontWeight.w500,
//                 color: Colors.grey[600],
//               ),
//             ),
//             Icon(
//               Icons.arrow_forward_ios,
//               color: Colors.grey,
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:raven_frontend/Pages/profileEdit.dart';

class SettingsPage extends StatefulWidget {
  @override
  _SettingsPageState createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 27, 23, 27),
        elevation: 0, // Remove elevation for a flat app bar
        leading: IconButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          icon: Icon(
            Icons.arrow_back,
            color: Colors.white, // Match app bar title text color
          ),
        ),
      ),
      body: Container(
        padding: EdgeInsets.all(16),
        child: ListView(
          children: [
            Text(
              "Settings",
              style: TextStyle(fontSize: 25, fontWeight: FontWeight.w500),
            ),
            SizedBox(height: 40),
            buildHeadingRow("Account"),
            Divider(height: 15, thickness: 2),
            SizedBox(height: 10),
            buildAccountOptionRow(context, "Edit Profile", () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => EditProfilePage()),
              );
            }),
            buildAccountOptionRow(context, "Content settings", () {}),
            buildAccountOptionRow(context, "Location", () {}),
            buildAccountOptionRow(context, "Language", () {}),
            buildAccountOptionRow(context, "Privacy and security", () {}),
            SizedBox(height: 40),
            buildHeadingRow("Support"),
            Divider(height: 15, thickness: 2),
            SizedBox(height: 10),
            buildNotificationOptionRow("New for you", true),
            buildAccountOptionRow(context, "FAQ", () {}),
            buildAccountOptionRow(context, "Write us a review", () {}),
            buildAccountOptionRow(context, "About", () {}),
            SizedBox(height: 50),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  onPressed: () {
                    // Save changes
                  },
                  child: Text('Save Changes'),
                ),
                ElevatedButton(
                  onPressed: () {
                    // Discard changes
                  },
                  child: Text('Discard Changes'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Row buildHeadingRow(String title) {
    return Row(
      children: [
        Icon(
          Icons.person,
          color: Colors.green,
        ),
        SizedBox(width: 8),
        Text(
          title,
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
      ],
    );
  }

  Row buildNotificationOptionRow(String title, bool isActive) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w500,
            color: Colors.grey[600],
          ),
        ),
        Transform.scale(
          scale: 0.7,
          child: Switch(
            value: isActive,
            onChanged: (bool val) {},
          ),
        )
      ],
    );
  }

  GestureDetector buildAccountOptionRow(
      BuildContext context, String title, VoidCallback onTap) {
    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 8),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              title,
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w500,
                color: Colors.grey[600],
              ),
            ),
            Icon(
              Icons.arrow_forward_ios,
              color: Colors.grey,
            ),
          ],
        ),
      ),
    );
  }
}
