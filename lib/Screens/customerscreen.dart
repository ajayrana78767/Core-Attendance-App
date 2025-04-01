import 'package:flutter/material.dart';
import 'package:new_project/Utils/colors_utils.dart';

class Customerscreen extends StatefulWidget {
  const Customerscreen({super.key});

  @override
  State<Customerscreen> createState() => _CustomerscreenState();
}

class _CustomerscreenState extends State<Customerscreen> {
  ColorsUtils colorUtils = ColorsUtils();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
       title: Text("Customers", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),),
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
            title: Text("Customer Name"),
            subtitle: Text('Number'),
            trailing: Image.asset("assets/images/arrowIcon.png", height: 18, width: 10, fit: BoxFit.fill,),
          ),
        );
        },
        itemCount: 20,
      ),
    );
  }
}