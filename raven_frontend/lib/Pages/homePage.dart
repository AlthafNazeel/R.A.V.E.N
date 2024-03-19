import 'package:flutter/material.dart';
import 'package:pie_chart/pie_chart.dart';
import 'package:raven_frontend/components/AppFonts.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  HomePage({Key? key}) : super(key: key);

  Map<String, double> dataMap = {
    "yello alert":33.33  ,
    "red alert": 45.83,
    "green alert": 20.83,
  };

  List<Color> colorlist = [
    Color.fromRGBO(240, 240, 65, 1),
    Color.fromRGBO(255, 76, 76, 1),
    Color.fromARGB(255, 95, 167, 108),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 255, 255, 255),
        title: DropdownButton<String>(
          
          items: <String>['Home', 'Work place', 'Somewhere']
              .map((String value) {
            return DropdownMenuItem<String>(

              value: value,
              child: Text(value),
            );
          }).toList(),
          onChanged: (String? newValue) {
            // Handle dropdown item selection here
          },
        ),
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
      backgroundColor: Color.fromARGB(255, 0, 0, 0),
      body: Center(
        child: Container(
          color: Color.fromARGB(255, 16, 16, 16),
          padding: EdgeInsets.all(20),
          child: Column(
            children: [
              // Pie Chart Container
              Container(
                 decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Color.fromARGB(255, 219, 217, 217),
                ),
                padding: EdgeInsets.all(20), 
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
                      chartValuesOptions: ChartValuesOptions(
                        showChartValuesInPercentage: true,
                        showChartValues: false,
                        
                      ),
                      legendOptions: LegendOptions(showLegends: false),
                    ),
                    SizedBox(height: 30),

                    // Text Containers with Vertical Dividers
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Container(
                          width: 80, 
                          height: 80, 
                          margin: EdgeInsets.only(left: 25),
                          decoration: BoxDecoration(
                            color: Color.fromRGBO(255, 76, 76, 1),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Center(
                            child: Text("11", style: AppFonts.piechart()),
                          ),
                        ),
                        VerticalDivider(
                          color: Color.fromARGB(255, 123, 18, 18),
                          thickness: 10,
                          indent: 10,
                          endIndent: 20,
                        ),
                        Container(
                          width: 80, 
                          height: 80, 
                          decoration: BoxDecoration(
                            color: Color.fromRGBO(240, 240, 65, 1),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Center(
                            child: Text("8", style: AppFonts.piechart()),
                          ),
                        ),
                        VerticalDivider(
                          color: Color.fromARGB(255, 0, 0, 0),
                          thickness: 5,
                        ),
                        Container(
                          width: 80, 
                          height: 80,  
                          margin: EdgeInsets.only(right: 25),
                          decoration: BoxDecoration(
                            color: Color.fromARGB(255, 95, 167, 108),
                            borderRadius: BorderRadius.circular(10),
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
              SizedBox(height: 30),

              ElevatedButton(
                onPressed: () {
                  // Navigate to the next page
                  Navigator.pushNamed(context, '/add_device');
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor:Color.fromARGB(255, 101, 36, 120), // Set the button color
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10), // Set the border radius
                  ),
                ),
                child: Container(
                  padding: EdgeInsets.symmetric(
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
