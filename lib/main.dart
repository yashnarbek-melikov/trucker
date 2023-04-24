import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'package:trucker/screen/HomeScreen.dart';
import 'package:trucker/screen/InspectionScreen.dart';
import 'package:trucker/screen/LogBookScreen.dart';
import 'package:trucker/screen/MoreScreen.dart';

void main() {
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.dark);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});


  @override
  State<MyHomePage> createState() => BottomState();
}

class BottomState extends State<MyHomePage> {

  int _selectedIndex = 0;
  late List<Widget> _widgetOptions;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }


  @override
  void initState() {
  _widgetOptions  = <Widget>[
    HomeScreen(),
    LogBookScreen(),
    InspectionScreen(),
    MoreScreen(),
    ];
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: _widgetOptions[_selectedIndex],
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: Container(
        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
        width: MediaQuery.of(context).size.width-32,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(48),
          color: const Color(0xFF1C293E),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            bottomNavigationBarItem('assets/images/home.svg', 'Home'),
            bottomNavigationBarItem('assets/images/logbook.svg', 'Logbook'),
            bottomNavigationBarItem('assets/images/inspection.svg', 'Inspection'),
            bottomNavigationBarItem('assets/images/more.svg', 'More'),
          ],
        ),
      )

      // BottomNavigationBar(
      //     landscapeLayout: BottomNavigationBarLandscapeLayout.centered,
      //   backgroundColor: const Color(0xFF1C293E),
      //   items: <BottomNavigationBarItem>[
      //     bottomNavigationBarItem('assets/images/home.svg', 'Home'),
      //     bottomNavigationBarItem('assets/images/logbook.svg', 'Logbook'),
      //     bottomNavigationBarItem('assets/images/inspection.svg', 'Inspection'),
      //     bottomNavigationBarItem('assets/images/more.svg', 'More'),
      //   ],
      //   selectedLabelStyle: const TextStyle(fontSize: 12),
      //   unselectedLabelStyle: const TextStyle(fontSize: 12),
      //   currentIndex: _selectedIndex,
      //   selectedItemColor: Colors.white,
      //   type: BottomNavigationBarType.fixed,
      //   onTap: _onItemTapped,
      //   unselectedItemColor: const Color(0xFF8D949E),
      //   elevation: 0,
      // ),
    );
  }


  Widget bottomNavigationBarItem(
      String assetImage, String label) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Padding(
          padding: const EdgeInsets.only(bottom: 8),
          child: SvgPicture.asset(
            assetImage,
            width: 21,
            height: 21,
            colorFilter: const ColorFilter.mode(Color(0xFF8D949E), BlendMode.srcIn),
          ),
        ),
        Text(label,style: const TextStyle(fontSize: 12, color: Colors.white),)
      ],
    );
    // return BottomNavigationBarItem(
    //   icon: Padding(
    //     padding: const EdgeInsets.only(bottom: 8),
    //     child: SvgPicture.asset(
    //       assetImage,
    //       width: 21,
    //       height: 21,
    //       colorFilter: const ColorFilter.mode(Color(0xFF8D949E), BlendMode.srcIn),
    //     ),
    //   ),
    //   activeIcon: Padding(
    //     padding: const EdgeInsets.only(bottom: 8),
    //     child: SvgPicture.asset(
    //       assetImage,
    //       colorFilter: const ColorFilter.mode(Colors.white, BlendMode.srcIn),
    //       width: 21,
    //       height: 21,
    //     ),
    //   ),
    //   label: label,
    // );
  }
}

