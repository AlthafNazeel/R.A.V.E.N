// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:raven_frontend/Pages/Notifications.dart';
// import 'package:raven_frontend/Pages/SettingsPage.dart';
// import 'package:raven_frontend/Pages/add_device.dart';
// import 'package:raven_frontend/Pages/homePage.dart';

// class NavMenu extends StatelessWidget {
//   const NavMenu({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     final controller = Get.put(NavigationController());

//     return Scaffold(
//       bottomNavigationBar: Obx(
//         () => NavigationBar(
//           height: 80,
//           elevation: 0,
//           selectedIndex: controller.selectedIndex.value,
//           onDestinationSelected: (index) =>
//               controller.selectedIndex.value = index,
//           destinations: const [
//             NavigationDestination(icon: Icon(Icons.home), label: 'Home'),
//             NavigationDestination(icon: Icon(Icons.add), label: 'Add Device'),
//             NavigationDestination(
//                 icon: Icon(Icons.notifications), label: 'Notifications'),
//             NavigationDestination(
//                 icon: Icon(Icons.settings), label: 'Settings'),
//           ],
//         ),
//       ),
//       body: Obx(() => controller.screens[controller.selectedIndex.value]),
//     );
//   }
// }

// class NavigationController extends GetxController {
//   final Rx<int> selectedIndex = 0.obs;
//   final screens = [
//     HomePage(),
//     AddDevice(),
//     NotificationsPageE(),
//     SettingsPage(),
//   ];
// }


import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:raven_frontend/Pages/Notifications.dart';
import 'package:raven_frontend/Pages/SettingsPage.dart';
import 'package:raven_frontend/Pages/add_device.dart';
import 'package:raven_frontend/Pages/homePage.dart';

// Assume you have NavigationDestination and NavigationBar widgets defined elsewhere

class NavMenu extends StatelessWidget {
  const NavMenu({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(NavigationController());

    return Scaffold(
      bottomNavigationBar: Obx(
        () => NavigationBar(
          height: 80,
          elevation: 0,
          selectedIndex: controller.selectedIndex.value,
          onDestinationSelected: (index) =>
              controller.selectedIndex.value = index,
          destinations: const [
            NavigationDestination(icon: Icon(Icons.home), label: 'Home'),
            NavigationDestination(icon: Icon(Icons.add), label: 'Add Device'),
            NavigationDestination(
                icon: Icon(Icons.notifications), label: 'Notifications'),
            NavigationDestination(
                icon: Icon(Icons.settings), label: 'Settings'),
          ],
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: Obx(() => controller.screens[controller.selectedIndex.value]),
          ),
        ],
      ),
    );
  }
}

class NavigationController extends GetxController {
  final Rx<int> selectedIndex = 0.obs;
  final screens = [
    HomePage(),
    AddDevice(),
    NotificationsPageE(),
    SettingsPage(),
  ];
}