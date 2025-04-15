import 'package:flutter/material.dart';
import 'package:flutter_snake_navigationbar/flutter_snake_navigationbar.dart';
import 'package:new_project/Screens/dashboardscreen.dart';
import 'package:new_project/Screens/historyscreen.dart';
import 'package:new_project/Screens/notificationScreen.dart';
import 'package:new_project/Screens/profileScreen.dart';

class BottomNavigation extends StatefulWidget {
  const BottomNavigation({super.key});

  @override
  State<BottomNavigation> createState() => _BottomNavigationState();
}

class _BottomNavigationState extends State<BottomNavigation> {
  //int _selectedItemPosition = 0;
  int screenIndex = 0;
  List <Widget> screens = [
    Dashboardscreen(),
    Notificationscreen(),
    Historyscreen(),
    Profilescreen(),
  ];
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: screenIndex,
        children: screens,
        
      ),
      bottomNavigationBar: SnakeNavigationBar.color(
        behaviour: SnakeBarBehaviour.floating,
        snakeShape: SnakeShape.circle,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(25)
        ),
        padding: EdgeInsets.all(12),

        ///configuration for SnakeNavigationBar.color
        snakeViewColor: Colors.indigo,
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.grey,

        showUnselectedLabels: true,
        showSelectedLabels: true,

        currentIndex: screenIndex,
        onTap: (index){
          setState(() {
            screenIndex = index;
          });
          // _onTap(index);
        },
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.notifications), label: 'Noti'),
          BottomNavigationBarItem(icon: Icon(Icons.chat), label: 'History'),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile'),
          
        ],
      ),
    );
  }
}