import 'package:flutter/material.dart';
import 'package:raven_frontend/components/color.dart';
import 'package:raven_frontend/components/onboarding_data.dart';


//import 'package:get/get.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: OnboardingScreen(),
    );
  }
}

class OnboardingPage extends StatefulWidget {
  //const OnboardingPage({Key? key, key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          body(),
          buildDots(),
          button(),
        ],
      ),
    );
  }

  //Body
  Widget body(){
    return Expanded(
      child: Center(
        child: PageView.builder(
            onPageChanged: (value){
              setState(() {
                currentIndex = value;
              });
            },
            itemCount: controller.items.length,
            itemBuilder: (context,index){
             return Padding(
               padding: const EdgeInsets.symmetric(horizontal: 20),
               child: Column(
                 mainAxisAlignment: MainAxisAlignment.center,
                 children: [
                   //Images
                   Image.asset(controller.items[currentIndex].image),

                   const SizedBox(height: 15),
                   //Titles
                   Text(controller.items[currentIndex].title,
                     style: const TextStyle(
                      fontSize: 25,
                      //color: primaryColor,
                      fontWeight: FontWeight.bold),


                     textAlign: TextAlign.center,),

                   //Description
                   Padding(
                     padding: const EdgeInsets.symmetric(horizontal: 25),
                     child: Text(controller.items[currentIndex].description,
                       style: const TextStyle(color: Color.fromARGB(255, 68, 67, 71),fontSize: 16),textAlign: TextAlign.center,),
                   ),

                 ],
               ),
             );
        }),
      ),
    );
  }

  //Dots
  Widget buildDots(){
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(controller.items.length, (index) => AnimatedContainer(
          margin: const EdgeInsets.symmetric(horizontal: 2),
          decoration:   BoxDecoration(
            borderRadius: BorderRadius.circular(50),
            color: currentIndex == index? primaryColor : Colors.grey,
          ),
          height: 7,
          width: currentIndex == index? 30 : 7,
          duration: const Duration(milliseconds: 700))),
    );
  }

  //Button
  Widget button(){
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 20),
      width: MediaQuery.of(context).size.width *.9,
      height: 55,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        color: primaryColor,
      ),

      child: TextButton(
        onPressed: (){
          setState(() {
            currentIndex != controller.items.length -1? currentIndex++ : null;
          });
        },
        child: Text(currentIndex == controller.items.length -1? "Get started" : "Continue",
          style: const TextStyle(color: Color.fromARGB(255, 218, 202, 225)),),
        ],
      ),
    );
  }
}
