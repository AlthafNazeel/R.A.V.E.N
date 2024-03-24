// import 'package:flutter/material.dart';
// import 'package:raven_frontend/Pages/Navbar/navbar.dart';
// import 'package:raven_frontend/Pages/Navbar/navigation_bloc.dart';
// //import 'package:raven_frontend/Pages/homePage.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';

// class NavBarLayout extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: BlocProvider<NavigationBloc>(
//         create: (context) => NavigationBloc(),
//         child: Stack(
//           children: <Widget>[
//             BlocBuilder<NavigationBloc, NavigationStates>(
//               builder: (context, navigationState) {
//                 return navigationState as Widget;
//               },
//             ),
//             NavBar(),
//           ],
//         ),
//       ),
//     );
//   }
// }
