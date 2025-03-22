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
                padding: EdgeInsets.all(10),
                margin: EdgeInsets.all(10),
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
                     Row(
                        children: [
                          Expanded(
                            child: Container(
                              margin: EdgeInsets.all(10),
                              height: 55,
                              width: 100,
                             
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(3), // Rounded corners
                                border: Border.all(color: Colors.grey), 
                              ),
                              padding: EdgeInsets.all(10),
                              child: Row(
                                children: [
                                  Expanded(
                                    child: Image.asset("assets/images/ic_down_arrow.png",
                                    width: 10, // Set width
                                    height: 5, // Set height
                              
                                    ),
                                  ),
                                  Expanded(
                                    child: Image.asset("assets/images/indiaFlag.png",
                                    width: 25, // Set width
                                    height: 25, // Set height
                              
                                    ),
                                  ),
                                  Expanded(
                                    child: Text("+91")
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Expanded(
                            child: Container(
                              padding: EdgeInsets.all(10),
                              child: TextField(
                                decoration: InputDecoration(
                                  labelText: "Mobile Number",
                                  border: OutlineInputBorder(),
                                ),
                                
                              ),
                            ),
                          ),
                        ],
                      ),
                      Container(
                        padding: EdgeInsets.all(10),
                              child: TextField(
                                decoration: InputDecoration(
                                  labelText: "Password",
                                  border: OutlineInputBorder(),
                                ),
                              ),

                      ),
                      
                      Container(
                        alignment: Alignment.topRight,
                        child: TextButton(
                          onPressed: () {
                        
                        },
                        child: Text("Forgot Password", style: TextStyle(fontSize: 16, color: colorUtils.tertiaryColor),),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.all(10),
                        child: SizedBox(
                          height: 55,
                          width: double.infinity,
                          child: ElevatedButton(
                            onPressed: () {
                              
                            },
                            style: ElevatedButton.styleFrom(
                                backgroundColor: colorUtils.tertiaryColor, // Button color
                                foregroundColor: Colors.white, // Text color
                                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 12), // Button padding
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10), // Rounded corners
                                ),
                              ),
                            child: Text("Login",style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),),
                          ),
                        ),
                      ), 
                    ]
                ),
              ),
          ],
        ),
        
      )
  
    );
    
  }
}

