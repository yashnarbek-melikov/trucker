import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:trucker/screen/HomeScreen.dart';
import 'package:trucker/screen/InspectionScreen.dart';
import 'package:trucker/screen/LogBookScreen.dart';
import 'package:trucker/screen/MoreScreen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {

  @override
  State<MyHomePage> createState() => BottomState();
}

class BottomState extends State<MyHomePage> {

  int _selectedIndex = 0;
  final List<Widget> _widgetOptions = <Widget>[
    HomeScreen(),
    LogBookScreen(),
    InspectionScreen(),
    MoreScreen(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  BottomNavigationBarItem bottomNavigationBarItem(
      String assetImage, String label) {
    return BottomNavigationBarItem(
      icon: Padding(
        padding: EdgeInsets.only(bottom: 8),
        child: SvgPicture.asset(
          assetImage,
          width: 21,
          height: 21,
          color: Color(0xFF8D949E),
        ),
      ),
      activeIcon: Padding(
        padding: EdgeInsets.only(bottom: 8),
        child: SvgPicture.asset(
          assetImage,
          color: Colors.white,
          width: 21,
          height: 21,
        ),
      ),
      label: label,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: Padding(
        padding: EdgeInsets.only(left: 16, right: 16, bottom: 16),
        child: Container(
          clipBehavior: Clip.hardEdge,
          decoration: const BoxDecoration(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(50),
                topRight: Radius.circular(50),
                bottomLeft: Radius.circular(50),
                bottomRight: Radius.circular(50)
              ),
          ),
          child: SizedBox(
            height: 76,
            child: BottomNavigationBar(
              backgroundColor: Color(0xFF1C293E),
              items: <BottomNavigationBarItem>[
                bottomNavigationBarItem('assets/images/home.svg', 'Home'),
                bottomNavigationBarItem('assets/images/logbook.svg', 'Logbook'),
                bottomNavigationBarItem('assets/images/inspection.svg', 'Inspection'),
                bottomNavigationBarItem('assets/images/more.svg', 'More'),
              ],
              selectedLabelStyle: TextStyle(fontSize: 12),
              unselectedLabelStyle: TextStyle(fontSize: 12),
              currentIndex: _selectedIndex,
              selectedItemColor: Colors.white,
              type: BottomNavigationBarType.fixed,
              onTap: _onItemTapped,
              unselectedItemColor: Color(0xFF8D949E),
            ),
          ),
        ),
      ),
    );
  }
}
