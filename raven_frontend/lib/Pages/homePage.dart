import 'package:flutter/material.dart';
import 'package:pie_chart/pie_chart.dart';
import 'package:raven_frontend/components/AppFonts.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Map<String, double> dataMap = {
    "yellow alert": 33.33,
    "red alert": 45.83,
    "green alert": 20.83,
  };

  List<Color> colorlist = [
    const Color.fromRGBO(240, 240, 65, 1),
    const Color.fromRGBO(255, 76, 76, 1),
    const Color.fromARGB(255, 95, 167, 108),
  ];

  String valueChoose = "";
  List<String> listitem = ["home", "workspace", "villa"];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 209, 204, 204),
        actions: [
          IconButton(
            icon: const Icon(Icons.settings),
            onPressed: () {
              Navigator.pushNamed(context, '/SettingsPage');
            },
          ),
          IconButton(
            icon: const Icon(Icons.notifications),
            onPressed: () {
              Navigator.pushNamed(context, '/Notifications');
            },
          ),
        ],
        centerTitle: true,
      ),
      resizeToAvoidBottomInset: false,
      // backgroundColor: Color.fromARGB(255, 130, 48, 48),
      body: Center(
        child: Container(
          color: Color.fromARGB(255, 255, 255, 255),
          padding: const EdgeInsets.all(20),
          child: Column(
            children: [
              // Pie Chart Container
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Color.fromRGBO(65, 65, 65, 1),
                ),
                padding: const EdgeInsets.all(20),
                child: Column(
                  children: [
                    // PieChart widget
                    PieChart(
                      dataMap: dataMap,
                      colorList: colorlist,
                      chartRadius: MediaQuery.of(context).size.width / 3,
                      centerText: "Alerts",
                      chartType: ChartType.ring,
                      ringStrokeWidth: 20,
                      chartValuesOptions: const ChartValuesOptions(
                        showChartValuesInPercentage: true,
                        showChartValues: false,
                      ),
                      legendOptions: const LegendOptions(showLegends: false),
                    ),
                    const SizedBox(height: 60),

                    
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Container(
                          width: 80, 
                          height: 80, 
                          decoration: BoxDecoration(
                            color: Color.fromARGB(255, 0, 0, 0),
                            borderRadius: BorderRadius.circular(10),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black.withOpacity(0.2),
                                spreadRadius: 2,
                                blurRadius: 3,
                                offset: Offset(6,8), 
                              ),
                            ],
                          ),
                          child: Center(
                            child: Text("11", style: AppFonts.piechart()),
                          ),
                        ),
                        const VerticalDivider(
                          color: Color.fromARGB(255, 0, 0, 0),
                          thickness: 10,
                          indent: 10,
                          endIndent: 20,
                        ),
                        Container(
                          width: 80, 
                          height: 80,
                          decoration: BoxDecoration(
                            color: Color.fromARGB(255, 255, 255, 255),
                            borderRadius: BorderRadius.circular(10),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black.withOpacity(0.2),
                                spreadRadius: 2,
                                blurRadius: 3,
                                offset: Offset(6,8), 
                              ),
                            ],
                          ),
                          child: Center(
                            child: Text("8", style: AppFonts.piechart()),
                          ),
                        ),
                        const VerticalDivider(
                          color: Color.fromARGB(255, 0, 0, 0),
                          thickness: 15,
                        ),
                        Container(
                          width: 80, 
                          height: 80,  
                          decoration: BoxDecoration(
                            color: Color.fromARGB(255, 255, 255, 255),
                            borderRadius: BorderRadius.circular(10),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black.withOpacity(0.2),
                                spreadRadius: 2,
                                blurRadius: 3,
                                offset: Offset(6,8), 
                              ),
                            ],
                          ),
                          child: Center(
                            child: Text("5", style: AppFonts.piechart()),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 150),

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Container(
                    width: 100, 
                    height: 100, 
                    margin: const EdgeInsets.only(right: 90),
                    decoration: BoxDecoration(
                      color: const Color.fromRGBO(127, 17, 224, 1),
                      borderRadius: BorderRadius.circular(10),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.2),
                          spreadRadius: 2,
                          blurRadius: 3,
                          offset: Offset(6,8), 
                        ),
                      ],
                    ),
                    child: Center(
                      child: IconButton(
                        icon: Icon(
                          Icons.add,
                          size: 70, 
                          color: Colors.white, 
                        ),
                        onPressed: () {
                          Navigator.pushNamed(context, '/add_device');
                        },
                      ),
                    ),
                  ),
                                    
                  Container(
                    width: 100, 
                    height: 100, 
                    decoration: BoxDecoration(
                      color: const Color.fromRGBO(127, 17, 224, 1),
                      borderRadius: BorderRadius.circular(10),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.2),
                          spreadRadius: 2,
                          blurRadius: 3,
                          offset: Offset(6,8), 
                        ),
                      ],
                    ),
                    child: Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          IconButton(
                            icon: Icon(
                              Icons.notifications,
                              size: 50, 
                              color: Colors.white, 
                            ),
                            onPressed: () {
                              Navigator.pushNamed(context, '/Notifications');
                            },
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    margin: const EdgeInsets.only(right: 90,top: 20),
                    
                    child: Text(
                      ' Add Device',
                      style: TextStyle(fontSize: 20,fontWeight: FontWeight.w700, color: Colors.black),
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.only(top: 20),
                    padding: EdgeInsets.only(left: 30),
                    child: Text(
                      'Notification',
                      style: TextStyle(fontSize: 20,fontWeight: FontWeight.w700, color: Colors.black),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ), 
    );

  } 
}