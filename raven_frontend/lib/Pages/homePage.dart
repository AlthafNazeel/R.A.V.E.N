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
  List<String> listitem = ["home","workspace","villa"];
  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 255, 255, 255),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios),
          onPressed: () {
            Navigator.pushNamed(context, '/signIn');
          },
        ),
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
        // resizeToAvoidBottomInset: false,
      backgroundColor: const Color.fromARGB(255, 0, 0, 0),
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
                  color: Color.fromARGB(255, 196, 196, 196),
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
                    const SizedBox(height: 30),

                    // Text Containers with Vertical Dividers
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Container(
                          width: 80, 
                          height: 80, 
                          margin: const EdgeInsets.only(left: 25),
                          decoration: BoxDecoration(
                            color: Color.fromARGB(255, 0, 0, 0),
                            borderRadius: BorderRadius.circular(10),
                            border: Border.all(color: Color.fromRGBO(255, 76, 76, 1) , width: 5.0)
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
                            border: Border.all(color: Color.fromRGBO(240, 240, 65, 1) , width: 5.0)
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
                          margin: const EdgeInsets.only(right: 25),
                          decoration: BoxDecoration(
                            color: Color.fromARGB(255, 255, 255, 255),
                            borderRadius: BorderRadius.circular(10),
                            border: Border.all(color: Color.fromARGB(255, 95, 167, 108), width: 5.0)
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
              const SizedBox(height: 30),

              ElevatedButton(
                onPressed: () {
                  // Navigate to the next page
                  Navigator.pushNamed(context, '/add_device');
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor:const Color.fromARGB(255, 101, 36, 120), // Set the button color
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10), // Set the border radius
                  ),
                ),
                child: Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 70,
                    vertical: 8,
                  ),
                  child: Text(
                    'Add Device',
                    style: AppFonts.ButtonFont(),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
