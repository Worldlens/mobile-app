import 'package:flutter/material.dart';
import 'package:flutter_application_1/module/history/presentation/history.dart';
import 'package:flutter_application_1/module/home/presentation/home.dart';

class MyFirstPage extends StatefulWidget {
  const MyFirstPage({super.key});

  @override
  State<MyFirstPage> createState() => _MyFirstPageState();
}

class _MyFirstPageState extends State<MyFirstPage> {
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  int _selectedIndex = 0;
  static const List<Widget> _widgetOptions = <Widget>[
    Home(),
    Text(""),
    History()
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: _widgetOptions.elementAt(_selectedIndex),
        bottomNavigationBar: BottomNavigationBar(
          // selectedIconTheme:
          //     IconThemeData(color: Color.fromRGBO(0, 255, 155, 1)),
          backgroundColor: Colors.black,
          items: <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Image.asset(
                  './assets/images/bottom_navigation/bottom_navigation_home.png'),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Image.asset('./assets/images/explore/explore3.png'),
              label: '',
            ),
            BottomNavigationBarItem(
              icon: Image.asset(
                  './assets/images/bottom_navigation/bottom_navigation_history.png'),
              label: 'History',
            ),
          ],
          currentIndex: _selectedIndex,
          selectedItemColor: Colors.green,
          onTap: _onItemTapped,
        ));
  }
}
