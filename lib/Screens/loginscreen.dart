import 'package:flutter/material.dart';
import 'package:new_project/Utils/colors_utils.dart';

class Loginscreen extends StatefulWidget {
  const Loginscreen({super.key});

  @override
  State<Loginscreen> createState() => _LoginscreenState();
}

class _LoginscreenState extends State<Loginscreen> {
  ColorsUtils colorUtils = ColorsUtils();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   leading: Icon(
      //     Icons.menu,
      //     color: Colors.white,
      //     ),

      //   title: const Text("Hello dear user"),
      //   backgroundColor: Colors.green,
      //   foregroundColor: Colors.white,
        
      // ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [colorUtils.primaryColor, colorUtils.secondaryColor, colorUtils.tertiaryColor],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter
            ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
          
            Center(child: Image.asset("assets/images/cameraImage.png",
              width: 80, // Set width
              height: 80, // Set height
              fit: BoxFit.cover,
              )
            ),
            
            Text("Attendance App", 
            style: TextStyle(
                fontSize: 20,
                color: Colors.white,
                fontWeight: FontWeight.bold
                )
              ),
              Container(
                
                margin: EdgeInsets.all(20),
                height: 400,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.all(Radius.circular(12)),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("Login",style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                        ),
                      ),
                      
                      Container(
                        margin: EdgeInsets.all(10),
                        height: 55,
                        width: double.infinity,
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.grey, width: 1),
                          borderRadius: BorderRadius.all(Radius.circular(8)),
                            
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.all(10),
                        height: 55,
                        width: double.infinity,
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.grey, width: 1),
                          borderRadius: BorderRadius.all(Radius.circular(8)),
                          color: Colors.white,
                        ),
                      ),

                    ]
                ),
              )
          ],
        ),
        
      )
  
    );
    
  }
}

