import 'package:flutter/material.dart';

class NavBar extends StatelessWidget {

  final bool isNavBarOpened = false;

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    return Positioned(
      top: 0,
      bottom: 0,
      left: isNavBarOpened ? 0: 0,
      right: isNavBarOpened ? 0: screenWidth -45,
      child: Row(
        children: <Widget>[
          Expanded(
            child: Container(
              color: Color.fromARGB(253, 59, 41, 100) ,
            ),
            ),
          Align(
            // ignore: prefer_const_constructors
            alignment: Alignment(0, -0.9),
            child: Container(
              width: 35,
              height: 110,
              color: Color.fromARGB(253, 59, 41, 100) ,
            ),
          ),
      
        ],
      ),
    );
  }
}
