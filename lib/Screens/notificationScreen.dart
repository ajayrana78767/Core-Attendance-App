import 'package:flutter/material.dart';

class Notificationscreen extends StatefulWidget {
  const Notificationscreen({super.key});

  @override
  State<Notificationscreen> createState() => _NotificationscreenState();
}

class _NotificationscreenState extends State<Notificationscreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Notification"),
      ),
      body: ListView.builder(
        scrollDirection: Axis.vertical,
        itemBuilder: (context, index) {            
          return Container(
                margin: EdgeInsets.all(10),
                alignment: Alignment.center,
                height: 80,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10), // Rounded corners
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey, // Shadow color
                      blurRadius: 2, // How soft the shadow looks
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
                          child: Text("Notifications", style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),),
                        )
                        ),
                      Image.asset("assets/images/arrowIcon.png", height: 18,width: 10,),
                    ],
                  ),
                ),
          );
        },
        itemCount: 20,
      )
    );
  }
}