import 'package:flutter/material.dart';

class Bmicalculatorscreen extends StatefulWidget {
  const Bmicalculatorscreen({super.key});

  @override
  State<Bmicalculatorscreen> createState() => _BmicalculatorscreenState();
}

class _BmicalculatorscreenState extends State<Bmicalculatorscreen> {
  var wtController = TextEditingController();
  var ftController = TextEditingController();
  var inController = TextEditingController();
  var result = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("BMI Calculation"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("BMI Calculation", style: TextStyle(fontSize: 34, fontWeight: FontWeight.bold),),
            TextField(
              controller: wtController,
              decoration: InputDecoration(
                label: Text("Enter Weight")
              ),
            ),
            SizedBox(height: 20,),
            TextField(
              controller: ftController,
              decoration: InputDecoration(
                label: Text("Enter height (in Feet) ")
                
              ),
            ),
            SizedBox(height: 20,),
            TextField(
              controller: inController,
              decoration: InputDecoration(
                label: Text("Enter height (in Inch) ")
                
              ),
            ),
            SizedBox(height: 40,),
           ElevatedButton(onPressed: () {
            var wt = wtController.text.toString();
            var ft = ftController.text.toString();
            var inch = inController.text.toString();
            if(wt != "" && ft != "" && inch != "") {
              setState(() {
                var iWt = int.parse(wt);
                var iFt = int.parse(ft);
                var iInch = int.parse(inch);
                var tInch = (iFt*12) + iInch;
                var tCm = tInch*2.54;
                var tM = tCm/100;
                var bmi = iWt/(tM*tM);
                setState(() {
                  result = "Your BMI is : $bmi";
                });


              });
            } else {
              setState(() {
                result = "Please enter the field";
              });
            }

            }, 
            child: Text("Calculate BMI")),
            SizedBox(height: 40,),
            Text(result, style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),),
            
          ],
        ),
      ),
    );
  }
}