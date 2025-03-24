import 'package:flutter/material.dart';
import 'package:new_project/Utils/colors_utils.dart';

class Registrationscreen extends StatefulWidget {
  const Registrationscreen({super.key});

  @override
  State<Registrationscreen> createState() => _RegistrationscreenState();
}

class _RegistrationscreenState extends State<Registrationscreen> {
  ColorsUtils colorUtils = ColorsUtils();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Registration"),
        backgroundColor: Colors.green,
        foregroundColor: Colors.white,
        
      ),
      body: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [colorUtils.primaryColor, colorUtils.secondaryColor, colorUtils.tertiaryColor],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter
              ),
          ),
      ),

    );
  }
}