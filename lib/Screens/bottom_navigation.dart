import 'package:flutter/material.dart';
import 'package:flutter_snake_navigationbar/flutter_snake_navigationbar.dart';
import 'package:new_project/Screens/dashboardscreen.dart';
import 'package:new_project/Screens/historyscreen.dart';
import 'package:new_project/Screens/messagescreen.dart';
import 'package:new_project/Screens/notificationScreen.dart';
import 'package:new_project/Screens/profileScreen.dart';
import 'package:new_project/Utils/colors_utils.dart';

class BottomNavigation extends StatefulWidget {
  const BottomNavigation({super.key});

  @override
  State<BottomNavigation> createState() => _BottomNavigationState();
}

class _BottomNavigationState extends State<BottomNavigation> {
  ColorsUtils colorUtils = ColorsUtils();
  //int _selectedItemPosition = 0;
  int screenIndex = 0;
  List <Widget> screens = [
    Dashboardscreen(),
    Historyscreen(),
    Notificationscreen(),
    Messagescreen(),
    Profilescreen(),
  ];
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: screenIndex,
        children: screens,
        
      ),
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [colorUtils.primaryColor, colorUtils.secondaryColor, colorUtils.tertiaryColor],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter
            ),
          ),
        child: SnakeNavigationBar.color(
          backgroundColor: Colors.transparent,
          behaviour: SnakeBarBehaviour.floating,
          snakeShape: SnakeShape.circle,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(25)
          ),
          padding: EdgeInsets.all(12),
          unselectedLabelStyle: TextStyle(fontSize: 11),
        
          ///configuration for SnakeNavigationBar.color
          snakeViewColor: Colors.white,
          selectedItemColor: Colors.black,
          unselectedItemColor: Colors.white,
        
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
            BottomNavigationBarItem(icon: Icon(Icons.watch_later_outlined), label: 'History'),
            BottomNavigationBarItem(icon: Icon(Icons.notifications), label: 'Notification'),
            BottomNavigationBarItem(icon: Icon(Icons.chat), label: 'Message'),
            BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile'),
            
          ],
        ),
      ),
    );
  }
}