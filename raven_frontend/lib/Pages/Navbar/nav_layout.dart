import 'package:flutter/material.dart';
import 'package:raven_frontend/Pages/Navbar/navbar.dart';
import 'package:raven_frontend/Pages/homePage.dart';

 class NavBarLayout extends StatelessWidget {
  const NavBarLayout({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        HomePage(),
        const NavBar(),
        ],
    );
  }

}