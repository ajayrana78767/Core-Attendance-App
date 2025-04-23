import 'package:flutter/material.dart';
import 'package:new_project/Screens/customerscreen.dart';
import 'package:new_project/Screens/historyscreen.dart';
import 'package:new_project/Screens/loginscreen.dart';
import 'package:new_project/Utils/colors_utils.dart';
import 'package:dio/dio.dart';
import 'package:new_project/Utils/constant_utils.dart';
import 'package:shared_preferences/shared_preferences.dart';


class Dashboardscreen extends StatefulWidget {
  const Dashboardscreen({super.key});

  @override
 
  State<Dashboardscreen> createState() => _DashboardscreenState();
}
ColorsUtils colorUtils = ColorsUtils();

class _DashboardscreenState extends State<Dashboardscreen> {
  
  bool isCheckedIn = false;
  bool isOnBreak = false;
  bool isLoading = false;


Future<void> logoutApi() async {
    setState(() {
      isLoading = true;
    });
    try {
    final SharedPreferences pref = await SharedPreferences.getInstance();
    final dio = Dio();
    String authToken = pref.getString(PREF_AUTH_TOKEN) ?? "";
    print("Token: $authToken");
    dio.options.headers['Authorization'] = 'Bearer $authToken';
  
    final response = await dio.post("https://synergysoftindia.com/pizza/api/logout");
    var message = response.data["message"];
    if (response.statusCode == 200) {
        pref.clear();
        debugPrint(message);
       Navigator.pushAndRemoveUntil(
        context,
           MaterialPageRoute(builder: (context) => const Loginscreen()),
          (Route<dynamic> route) => false,
          );
        return;
      } else {
        debugPrint("Logout failed with status code: ${response.statusCode}");
        return;
      }
      
    } on DioException catch (dioerror) {
      print("DioError $dioerror");
    }
    catch(e) {
      print("Error $e");
       setState(() {
      isLoading = false;
    });
    }
}
  @override
  Widget build(BuildContext context) {
  
    return Scaffold(
      
       body: SingleChildScrollView(
         child: Container(
          color: Colors.white,
           child: Column(
             children: [
               Stack(
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
                          Spacer(),
                          ElevatedButton(onPressed: () {
                            showDialog(
                              context: context,
                              builder: (BuildContext context) {
                                return AlertDialog(
                                  backgroundColor: Colors.white,
                                  title: Text('Confirm Logout'),
                                  content: Text('Are you sure you want to log out?'),
                                  actions: [
                                    TextButton(
                                      child: Text(
                                        'Cancel', 
                                        style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.w700,
                                        color: colorUtils.secondaryColor,
                                      ),),
                                      onPressed: () {
                                        Navigator.of(context).pop(); // Dismiss the dialog
                                      },
                                    ),
                                    TextButton(
                                      child: Text('Logout',style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.w700,
                                        color: colorUtils.primaryColor,
                                        ),
                                      ),
                                      onPressed: () {
                                        // Handle OK action
                                        logoutApi();
                                        print("Logout");
                                        Navigator.of(context).pop();
                                      },
                                    ),
                                  ],
                                );
                              },
                            );

                                                        
                          }, 
                          style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.transparent, // Transparent background
                              shadowColor: Colors.transparent,     // Remove shadow
                              elevation: 0,                        // Remove elevation
                            ),
                          child: Icon(Icons.logout, color: Colors.white, size: 24,),)
                          
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
                        Text("00:00:00", style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold, fontFamily: 'Roboto'),),
                        Text("HH:MM:SS",style: TextStyle(fontSize: 16, color: Colors.grey, fontFamily: 'Roboto'),),
                        Text("Sunday, 15 Aug 2024",style: TextStyle(fontSize: 16, color: Colors.grey, fontFamily: 'Roboto'),),
                        
                 
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          
                          if (!isCheckedIn)
                          buildButton(
                            label: "Check In",
                            onPressed: () {
                              setState(() {
                                isCheckedIn = true;
                              });
                            },
                          ),
                        if (isCheckedIn && !isOnBreak) ...[
                          buildButton(
                          label: "Take a break",
                          onPressed: () {
                            setState(() {
                              isOnBreak = true;
                            });
                          },
                        ),
                          buildButton(
                          label: "Check Out",
                          onPressed: () {
                            setState(() {
                              isCheckedIn = false;
                            });
                          },
                        ),
                          
                      ],
                        if (isCheckedIn && isOnBreak)
                            buildButton(
                              label: "End Break",
                              onPressed: () {
                                setState(() {
                                  isOnBreak = false;
                                });
                              },
                            ),
                        ],
                      ),
                        Spacer(),
                        SizedBox(height: 20,)
                      ],
                    ),
               
                  ),
                  Container(
                    alignment: Alignment.center,
                    height: 150,
                    width: double.infinity,
                    margin: EdgeInsets.only(top: 400, left: 20, right: 20),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(25),
                      boxShadow: [
                        BoxShadow(
                          // ignore: deprecated_member_use
                          color: Colors.black.withOpacity(0.2),
                          spreadRadius: 2,
                          blurRadius: 5,
                          offset: Offset(0, 3), // changes position of shadow
                        ),
                      ],
                      
                    ),
                    child: Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                             Column(
                                  children: [
                                    Text("Check In", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, fontFamily: 'Roboto'),),
                                    Text("09:15 AM",style: TextStyle(fontSize: 16, color: Colors.grey, fontFamily: 'Roboto'),),
                                  ],
                                ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Container(
                                  width: 1,
                                  height: 50,
                                  color: Colors.grey, // set background color
                                ),
                              ),
                              Column(
                                  children: [
                                    Text("Check Out", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, fontFamily: 'Roboto'),),
                                    Text("09:15 AM",style: TextStyle(fontSize: 16, color: Colors.grey, fontFamily: 'Roboto'),),
                                  ],
                                ),
                              
                            ],
                          ),
                          Padding(
                                padding: const EdgeInsets.only(right: 20, left: 20),
                                child: Container(
                                  width: double.infinity,
                                  height: 1,
                                  color: Colors.grey, // set background color
                                ),
                              ),
                         
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                             Column(
                                  children: [
                                    Text("Break Time", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, fontFamily: 'Roboto'),),
                                    Text("09:15 AM",style: TextStyle(fontSize: 16, color: Colors.grey, fontFamily: 'Roboto'),),
                                  ],
                                ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Container(
                                  width: 1,
                                  height: 50,
                                  color: Colors.grey, // set background color
                                ),
                              ),
                               Column(
                                  children: [
                                    Text("Total Time", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, fontFamily: 'Roboto'),),
                                    Text("09:15 AM",style: TextStyle(fontSize: 16, color: Colors.grey, fontFamily: 'Roboto'),),
                                  ],
                                ),
                              
                            ],
                          )
                        ],  
                      ),
                    ),
                                        
                  ),
                  
                 
                  ],
                ),
                Container(
                  margin: EdgeInsets.only(top: 20),
                  height: 10,
                  decoration: BoxDecoration(
                    color: Colors.grey,
                  ),
                    
                ),
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Container(
                          height: 110,
                          width: double.infinity,
                          decoration: BoxDecoration(
                            color: colorUtils.lightGreenClr, 
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text("0", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.black),),
                              Text("Present", style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.black),)
                            ],
                          ),
                          
                        ),
                ),
                HistoryContainer(),
                
                InkWell(
                  child: Container(
                    margin: EdgeInsets.all(20),
                    alignment: Alignment.center,
                    height: 80,
                    width: double.infinity,
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
                     child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        children: [
                          Image.asset("assets/images/customerIcon.png", height: 60,  width: 60,),
                          Expanded(
                            flex: 1,
                            child: Padding(
                              padding: const EdgeInsets.all(10.0),
                              child: Text("Customer", style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),),
                            )
                            ),
                          Image.asset("assets/images/arrowIcon.png", height: 18,width: 10,),
                        ],
                      ),
                    ),
                  ),
                  onTap: () {
                    Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => Customerscreen()),
                    );
                  },
                ),
             ],
           ),
         ),
       ),
      
      );

  }
}


class HistoryContainer extends StatelessWidget {
  const HistoryContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return InkWell(
                child: Container(
                  margin: EdgeInsets.only(left: 20,right: 20),
                  alignment: Alignment.center,
                  
                  width: double.infinity,
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
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      children: [
                        Image.asset("assets/images/historyIcon.png", height: 60,  width: 60,),
                        Expanded(
                          flex: 1,
                          child: Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: Text("History", style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),),
                          )
                          ),
                        Image.asset("assets/images/arrowIcon.png", height: 18,width: 10,),
                      ],
                    ),
                  ),
                ),
                onTap: () {
                  Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Historyscreen()),
                  );
            },
            
      );
      
  } 

}
Widget buildButton({required String label, required VoidCallback onPressed}) {
  return Container(
    margin: EdgeInsets.all(20),
    decoration: BoxDecoration(
      gradient: LinearGradient(
        colors: [colorUtils.primaryColor, colorUtils.secondaryColor, colorUtils.tertiaryColor],
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
      ),
      borderRadius: BorderRadius.circular(10),
    ),
    child: ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.transparent,
        shadowColor: Colors.transparent,
        foregroundColor: Colors.white,
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 12),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
      ),
      child: Text(label, style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
    ),
  );
}

