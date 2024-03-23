// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
 import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:raven_frontend/Pages/Navbar/navigation_bloc.dart';
import 'dart:async';

import 'package:rxdart/rxdart.dart';
import 'package:raven_frontend/Pages/Navbar/navItem.dart';

// void main() {
//   runApp(const MyApp());
// }

// class MyApp extends StatelessWidget {
//   const MyApp({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return const MaterialApp(
//       debugShowCheckedModeBanner: false,
//       home: NavBar(),
//     );
//   }
// }


class NavBar extends StatefulWidget {
  const NavBar({Key? key}) : super(key: key);

@override
  _NavBarState createState() => _NavBarState();
}

class _NavBarState extends State<NavBar> with SingleTickerProviderStateMixin<NavBar>{
  late AnimationController _animationController;
  late Stream<bool> isNavBarOpenedStream;
  late StreamController<bool> isNavBarOpenedStreamController;
  late StreamSink<bool> isNavBarOpenedSink;
  final _animationDuration = const Duration(milliseconds: 500);

  @override
  void initState() {
    super.initState();
    _animationController =AnimationController(vsync: this, duration: _animationDuration);
    isNavBarOpenedStreamController = PublishSubject<bool>();
    isNavBarOpenedStream = isNavBarOpenedStreamController.stream;
    isNavBarOpenedSink = isNavBarOpenedStreamController.sink;

  }

 @override
  void dispose() {
    _animationController.dispose();
    isNavBarOpenedStreamController.close();
    isNavBarOpenedSink.close();
    super.dispose();
  }

  void onIconPressed() {
    final animationStatus = _animationController.status;
    final isAnimationCompleted = animationStatus == AnimationStatus.completed;

    if (isAnimationCompleted) {
      isNavBarOpenedSink.add(false);
      _animationController.reverse();
    } else {
      isNavBarOpenedSink.add(true);
      _animationController.forward();
    }
  }


  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    return StreamBuilder<bool>(
      initialData: false,
      stream: isNavBarOpenedStream,
      builder: (context, isNavBarOpenedAsync) {
        return AnimatedPositioned(
          duration: _animationDuration,
          top: 0,
          bottom: 0,
          left: isNavBarOpenedAsync.data ?? false ? 0 : -screenWidth, // Using null-aware operator '?'
          right: isNavBarOpenedAsync.data ?? false ? 0 : screenWidth - 50, // Using null-aware operator '?'
      
          child: Row(
            children: <Widget>[
              Expanded(
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  color: Color.fromARGB(253, 59, 41, 100) ,
                  child: Column(
                    children: <Widget>[
                      
                      SizedBox(
                        height: 100,
                      ),
                      
                      ListTile(
                        title: Text(
                          "Oshadhi",
                          style: TextStyle(color: Colors.white, fontSize: 30, fontWeight: FontWeight.w800),
                        ),

                        subtitle: Text(
                          "www.raven.com",
                          style: TextStyle(
                            color: Color(0xFF1BB5FD),
                            fontSize: 18,
                          ),
                        ),
                        leading: CircleAvatar(
                          child: Icon(
                            Icons.perm_identity,
                            color: Colors.white,
                          ),
                          radius: 40,
                        ),
                      ),
                      Divider(
                        height: 64,
                        thickness: 0.5,
                        color: Colors.white.withOpacity(0.3),
                        indent: 32,
                        endIndent: 32,
                      ),
                      NavItem(
                        icon: Icons.home,
                        title: "Home",
                        onTap: () {
                          onIconPressed();
                          BlocProvider.of<NavigationBloc>(context).add(NavigationEvents.HomePageClickedEvent);
                        },
                      ),
                      NavItem(
                        icon: Icons.person,
                        title: "My Account",
                        onTap: () {
                          onIconPressed();
                          BlocProvider.of<NavigationBloc>(context).add(NavigationEvents.NotificationClickedEvent);
                        },
                      ),
                      NavItem(
                        icon: Icons.shopping_basket,
                        title: "..",
                        onTap: () {
                          onIconPressed();
                          BlocProvider.of<NavigationBloc>(context).add(NavigationEvents.AddDeviceClickedEvent);
                        },
                      ),
                      NavItem(
                        icon: Icons.card_giftcard,
                        title: "..", onTap: () {  },
                      ),
                      Divider(
                        height: 64,
                        thickness: 0.5,
                        color: Colors.white.withOpacity(0.3),
                        indent: 32,
                        endIndent: 32,
                      ),
                      NavItem(
                        icon: Icons.settings,
                        title: "Settings", onTap: () {  },
                      ),
                      NavItem(
                        icon: Icons.exit_to_app,
                        title: "Logout", onTap: () {  },
                      ),
                    ],
                  ),
                ),
              ),
              Align(
                
                alignment: Alignment(0, -0.9),
                child: GestureDetector(
                  onTap: (){
                    onIconPressed();
                  },
                  child: ClipPath(
                    clipper: CustomNavClipper(),
                    child: Container(
                      width: 35,
                      height: 110,
                      color: Color.fromARGB(253, 59, 41, 100) ,
                      alignment: Alignment.centerLeft,
                      child : AnimatedIcon(
                        progress: _animationController.view,
                        icon: AnimatedIcons.menu_close,
                        color: Color.fromARGB(255, 242, 230, 230),
                        size:  25,
                      ),
                    ),
                  ),
                ),
              ),
          
            ],
          ),
        );
      }
    );
  }
  
}

class CustomNavClipper extends CustomClipper<Path>{
  @override
  Path getClip(Size size) {
    Paint paint = Paint();
    paint.color = Colors.white;

    final width = size.width;
    final height = size.height;
    
    Path path = Path();
    path.moveTo(0, 0);
    path.quadraticBezierTo(0, 8, 10, 16);
    path.quadraticBezierTo(width-1, height/2- 20, width, height/2);
    path.quadraticBezierTo(width+1, height/2+ 20, 10, height- 16);
    path.quadraticBezierTo(0, height -8, 0, height);
    path.close();

    return path; 
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    
    return true;
  }
}


