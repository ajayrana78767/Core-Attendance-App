import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import 'package:new_project/Utils/colors_utils.dart';
import 'package:new_project/models/get_employee.dart';

class Customerscreen extends StatefulWidget {
  const Customerscreen({super.key});
  @override
  State<Customerscreen> createState() => _CustomerscreenState();
  
}

class _CustomerscreenState extends State<Customerscreen> {
  ColorsUtils colorUtils = ColorsUtils();
  List<Employee>? employees = [];
  bool isLoading = false;
  Future<void> employeeApi() async {
    setState(() {
      isLoading = true;
    });
    final dio = Dio();
  
    final response = await dio.get("https://synergysoftindia.com/attcore/api/get-employees-list");
   // print(response.data);
   if (response.statusCode == 200) {
     setState(() {
      isLoading = false;
    });
    var model = GetEmployee.fromJson(response.data);
    employees = model.data;
    print("This is employee list: $employees");
   } else {
     setState(() {
      isLoading = false;
    });
   
    debugPrint("Error");
   }
   
    
  }
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    employeeApi();
  }
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
      body: isLoading?Center(child: CircularProgressIndicator()): ListView.builder(itemBuilder: (context, index) {
        print(employees!.length);
        var employee = employees![index];
        
        return Card(
          margin: EdgeInsets.all(10),
          child: ListTile(
            leading: Image.asset("assets/images/profileImg.png", height: 50, width: 50, fit: BoxFit.fill,),
            title: Text(employee.name!),
            subtitle: Text(employee.mobile!.toString()),
            trailing: Image.asset("assets/images/arrowIcon.png", height: 18, width: 10, fit: BoxFit.fill,),
          ),
        );
        },
        itemCount: employees!.length,
      ),
    );
  }
}