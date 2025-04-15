import 'package:flutter/material.dart';
import 'package:new_project/Screens/customerscreen.dart';
import 'package:new_project/Screens/historyscreen.dart';
import 'package:new_project/Utils/colors_utils.dart';

class Dashboardscreen extends StatefulWidget {
  const Dashboardscreen({super.key});

  @override
 
  State<Dashboardscreen> createState() => _DashboardscreenState();
}
ColorsUtils colorUtils = ColorsUtils();

class _DashboardscreenState extends State<Dashboardscreen> {
  
  bool isCheckedIn = false;
  bool isOnBreak = false;
  @override
  Widget build(BuildContext context) {
    
    var arrMonth = ['Monady','Tuesday','Wednesday','Thrsday','Friday','Saturday','Sunday'];
  
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
                          label: "Check Out",
                          onPressed: () {
                            setState(() {
                              isCheckedIn = false;
                            });
                          },
                        ),
                          buildButton(
                          label: "Take a break",
                          onPressed: () {
                            setState(() {
                              isOnBreak = true;
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
                                
                                blurRadius: 2, // How soft the shadow looks
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
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          height: 110,
                          width: (MediaQuery.of(context).size.width - 60) / 2,
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
                       
                        Container(
                          height: 110,
                          width: (MediaQuery.of(context).size.width - 60) / 2,
                          decoration: BoxDecoration(
                            color: colorUtils.lightBlueClr, 
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text("0", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.black),),
                              Text("Absent", style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.black),)
                            ],
                          ), 
                        ),
                      ],
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

