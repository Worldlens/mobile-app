// import 'package:flutter/material.dart';

// class BottomNavigation extends StatefulWidget {
//   BottomNavigation({
//     required this.selectedIndex,
//     super.key,
//   });
//   var selectedIndex;
//   @override
//   State<BottomNavigation> createState() => _BottomNavigationState();
// }

// class _BottomNavigationState extends State<BottomNavigation> {
//   void _onItemTapped(int index) {
//     setState(() {
//       widget.selectedIndex = index;
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return BottomNavigationBar(
//       backgroundColor: Colors.black,
//       items: <BottomNavigationBarItem>[
//         const BottomNavigationBarItem(
//           icon: Icon(
//             Icons.home_outlined,
//             color: Colors.white,
//           ),
//           label: 'Home',
//         ),
//         BottomNavigationBarItem(
//           icon: Image.asset('./assets/images/explore/explore3.png'),
//           label: 'Business',
//         ),
//         const BottomNavigationBarItem(
//           icon: Icon(Icons.bookmark_outline_rounded, color: Colors.white),
//           label: 'School',
//         ),
//       ],
//       currentIndex: widget.selectedIndex,
//       selectedItemColor: Colors.amber[800],
//       onTap: _onItemTapped,
//     );
//   }
// }
