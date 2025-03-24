import 'package:flutter/material.dart';
import 'package:new_project/Utils/colors_utils.dart';

class Dashboardscreen extends StatefulWidget {
  const Dashboardscreen({super.key});

  @override
  State<Dashboardscreen> createState() => _DashboardscreenState();
}

class _DashboardscreenState extends State<Dashboardscreen> {
  ColorsUtils colorUtils = ColorsUtils();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
       body: Container(
        height: 280,
        width: double.infinity,
        decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [colorUtils.primaryColor, colorUtils.secondaryColor, colorUtils.tertiaryColor],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter
              ),
          ),
          
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children:[
              Image.asset("assets/images/profileImg.png", height: 55, width: 55,),
              Column(
                
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Hi! Jack", style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.white,),textAlign: TextAlign.right,)
                ],
              ),
            ],
          ),
       ),
    );
  }
}