// ignore: file_names
import 'package:flutter/material.dart';
import 'package:new_project/Utils/colors_utils.dart';


class Notificationscreen extends StatefulWidget {
  const Notificationscreen({super.key});

  @override
  State<Notificationscreen> createState() => _NotificationscreenState();
}

class _NotificationscreenState extends State<Notificationscreen> {
  var arrMonth = ['Monady','Tuesday','Wednesday','Thrsday','Friday','Saturday','Sunday'];
  ColorsUtils colorUtils = ColorsUtils();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Notification", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),),
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
      body: ListView.builder(itemBuilder: (context, index) {
        return Card(
          margin: EdgeInsets.all(10),
          child: ListTile(
            leading: Image.asset("assets/images/profileImg.png", height: 50, width: 50, fit: BoxFit.fill,),
            title: Text(arrMonth[index]),
            subtitle: Text('Number'),
            trailing: Icon(Icons.add),
          ),
        );
        },
        itemCount: arrMonth.length,
      ),
    );
  }
}