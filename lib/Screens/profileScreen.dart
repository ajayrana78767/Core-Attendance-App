//
import 'package:flutter/material.dart';
import 'package:new_project/Utils/colors_utils.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class Profilescreen extends StatefulWidget {
  const Profilescreen({super.key});

  @override
  State<Profilescreen> createState() => _ProfilescreenState();
}

class _ProfilescreenState extends State<Profilescreen> {
  
  ColorsUtils colorUtils = ColorsUtils();
  static const CameraPosition kGooglePlex = CameraPosition(
    target: LatLng(37.42796133580664, -122.085749655962),
    zoom: 14.4746,
  );
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
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Image.asset("assets/images/profileImg.png", height: 80, width: 80,),
                    Text("Jack Doe", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.white,)),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20.0, right: 20.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container( 
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
                    child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Align(
                            alignment: Alignment.topLeft,
                            child: Image.asset("assets/images/phoneIcon.png", height: 40, width: 40,)
                            ),
                          Align(
                            alignment: Alignment.topLeft,
                            child: Text("Phone", style: TextStyle(fontSize: 14, color: Colors.grey),)
                            ),
                          Align(
                            alignment: Alignment.topLeft,
                            child: Text("+91 9876543210", style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),)
                            ),

                          ],
                      ),
                    ),
                   ),
                     
                  Container(
                    
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
                    child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Align(
                            alignment: Alignment.topLeft,
                            child: Image.asset("assets/images/mailIcon.png", height: 40, width: 40,)),
                          Align(
                            alignment: Alignment.topLeft,
                            child: Text("Email", style: TextStyle(fontSize: 14, color: Colors.grey),)
                            ),
                          Align(
                            alignment: Alignment.topLeft,
                            child: Text("jack@gmail.com", style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),)
                            ),
                        ],
                      ),
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
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                children: [
                  Align(
                    alignment: Alignment.topLeft,
                    child: Image.asset("assets/images/locationIcon.png", height: 40, width: 40,)
                  ),
                   Align(
                    alignment: Alignment.topLeft,
                    child: Text("Address", style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),),
                  ),
                   Align(
                    alignment: Alignment.topLeft,
                    child: Text("123 Maple Street, Springfield, IL 62704", style: TextStyle(fontSize: 14, color: Colors.grey),),
                  ),
                ],
              ),
            ),
            Container(
              height: 430,
              width: double.infinity,
              child: GoogleMap(
                mapType: MapType.hybrid,
                initialCameraPosition: kGooglePlex,
                onMapCreated: (GoogleMapController controller) {
                  
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}