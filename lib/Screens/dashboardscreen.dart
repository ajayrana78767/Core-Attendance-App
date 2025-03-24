import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
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
    var arrMonth = ['Monady','Tuesday','Wednesday','Thrsday','Friday','Saturday','Sunday'];
    return Scaffold(
      
       body: Stack(
          children: [
            Container(
            padding: EdgeInsets.only(left: 20, top: 80, right: 20,),
            height: 280,
            width: double.infinity,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [colorUtils.primaryColor, colorUtils.secondaryColor, colorUtils.tertiaryColor],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter
              ),
            ),
          
          child: Column(
            children: [
              
             Row(
              children:[
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
              
              ],
            ),
            
          ),
          Container(
            alignment: Alignment.center,
            padding: EdgeInsets.only(top: 50),
            height: 290,
            width: double.infinity,
            margin: EdgeInsets.only(left: 20, top: 180, right: 20,),
            
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.all(Radius.circular(12)),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("00:00:00", style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),),
                Text("Sunday, 15 Aug 2024",style: TextStyle(fontSize: 16, color: Colors.grey),),
                
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                     Container(
                        margin: EdgeInsets.all(20),
                       
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            colors: [colorUtils.primaryColor, colorUtils.secondaryColor, colorUtils.tertiaryColor], 
                            begin: Alignment.topLeft,
                            end: Alignment.bottomRight,
                          ),
                          borderRadius: BorderRadius.circular(10), // Match button's border radius
                        ),
                       
                        child: ElevatedButton(
                          onPressed: () {
                           print("Check Out");
                          },
                          style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.transparent, // Make the button transparent
                              shadowColor: Colors.transparent, 
                              foregroundColor: Colors.white, // Text color
                              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 12), // Button padding
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10), // Rounded corners
                              ),
                            ),
                          child: Text("Check Out",style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.all(20),
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            colors: [colorUtils.primaryColor, colorUtils.secondaryColor, colorUtils.tertiaryColor], 
                            begin: Alignment.topLeft,
                            end: Alignment.bottomRight,
                          ),
                          borderRadius: BorderRadius.circular(10), // Match button's border radius
                        ),
                       
                        child: ElevatedButton(
                          onPressed: () {
                           print("Take a break");
                          },
                          style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.transparent, // Make the button transparent
                              shadowColor: Colors.transparent, 
                              foregroundColor: Colors.white, // Text color
                              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 12), // Button padding
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10), // Rounded corners
                              ),
                            ),
                          child: Text("Take a break",style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),),
                        ),
                        
                      ),
                      
                  ],

                ),
                Spacer(),
              ],
            ),

          ),
          Container(
            alignment: Alignment.center,
            height: 150,
            width: double.infinity,
            margin: EdgeInsets.only(top: 400,),
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                
                return Container(
                  margin: EdgeInsets.all(10),
                  padding: EdgeInsets.all(10),
                  width: 100,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10), // Rounded corners
                    boxShadow: [
                      BoxShadow(
                       
                        color: Colors.black, // Shadow color
                        spreadRadius: 1, // How much the shadow spreads
                        blurRadius: 5, // How soft the shadow looks
                        offset: Offset(2, 2), // X and Y offset
                      ),
                    ],
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset("assets/images/timeImg.png", height: 30, width: 30,),
                      Text(arrMonth[index], style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold),),
                      Text("data", style: TextStyle(fontSize: 14, color: Colors.grey),)
                    ],
                  ),
                );
              },
              itemCount: arrMonth.length,
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: 570,),
            height: 10,
            decoration: BoxDecoration(
              color: Colors.grey,
            ),
          ),
 
        ],
      ),
    );
  }
}