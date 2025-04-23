

import 'package:flutter/material.dart';
import 'package:new_project/Screens/bottom_navigation.dart';
import 'package:new_project/Screens/loginscreen.dart';
import 'package:new_project/Utils/constant_utils.dart';
import 'dart:async';

import 'package:shared_preferences/shared_preferences.dart';


class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
 
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _isLogin();
  }
  void _isLogin() async {
     final SharedPreferences pref = await SharedPreferences.getInstance();
     bool _isLogin = pref.getBool(PREF_IS_LOGIN) ?? false;
     Timer(Duration(seconds: 3), () {
      if(_isLogin) {
        Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => BottomNavigation()),
      );
      } else {
        Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => Loginscreen()),
      );
      }
     });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          color: Colors.amber,
          child: Text("Welcome"),
        ),
      )
    );
  }
}