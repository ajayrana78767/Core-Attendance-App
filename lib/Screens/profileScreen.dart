//
import 'package:flutter/material.dart';
import 'package:new_project/Utils/colors_utils.dart';

class Profilescreen extends StatefulWidget {
  const Profilescreen({super.key});

  @override
  State<Profilescreen> createState() => _ProfilescreenState();
}

class _ProfilescreenState extends State<Profilescreen> {
  ColorsUtils colorUtils = ColorsUtils();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
     appBar: AppBar(
        title: Text("Profile", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),),
        foregroundColor: Colors.white,
        flexibleSpace: Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [colorUtils.primaryColor, colorUtils.secondaryColor, colorUtils.tertiaryColor],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
              ),
            ),
          ),
          elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Container(
              margin: EdgeInsets.all(20),
              height: 168,
              width: double.infinity,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                gradient: LinearGradient(
                  colors: [colorUtils.primaryColor, colorUtils.secondaryColor, colorUtils.tertiaryColor],
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  
                ),
              ),
              child: Column(
                children: [
                  Image.asset("assets/images/profileImg.png", height: 55, width: 55,),
                  SizedBox(width: 10), 
                  Column(  
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Hi! Jack", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.white,)),
                      Text("Attendance, Please!", style: TextStyle(fontSize: 16, color: Colors.white,)),
                    ],
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20.0, right: 20.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    height: 110,
                    width: (MediaQuery.of(context).size.width - 60) / 2,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10), // Rounded corners
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey, // Shadow color
                          blurRadius: 4,
                          spreadRadius: 1,
                        ),
                      ],
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        ],
                    ),
                        
                   ),
                     
                  Container(
                    height: 110,
                    width: (MediaQuery.of(context).size.width - 60) / 2,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10), // Rounded corners
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey, // Shadow color
                          blurRadius: 4,
                          spreadRadius: 1,
                        ),
                      ],
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        
                      ],
                    ), 
                  ),   
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 20,),
              height: 10,
              decoration: BoxDecoration(
                color: Colors.grey,
              ),
                
            ),
          ],
        ),
      ),
    );
  }
}