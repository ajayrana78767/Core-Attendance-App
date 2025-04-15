import 'package:flutter/material.dart';
import 'package:new_project/Utils/colors_utils.dart';

class Differentexamplesscreen extends StatefulWidget {
  const Differentexamplesscreen({super.key});

  @override
  State<Differentexamplesscreen> createState() => _DifferentexamplesscreenState();
}

class _DifferentexamplesscreenState extends State<Differentexamplesscreen> {
  ColorsUtils colorUtils = ColorsUtils();
  
  @override
  Widget build(BuildContext context) {
    const items = 4;
    return Scaffold(
      appBar: AppBar(
       title: Text("List Style", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),),
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
      body: LayoutBuilder(builder: (context, constraints) {
        return SingleChildScrollView (
          child: ConstrainedBox(constraints: BoxConstraints(minHeight: constraints.maxHeight),
          child: Column(
            //mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: List.generate(items, (index) => Card(child: SizedBox(height:100, child: Center(child: Text('Item $index'))))),
            ),
          ),
        );
      }),
    );
  }
}
