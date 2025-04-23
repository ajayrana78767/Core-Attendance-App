import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:new_project/Screens/bottom_navigation.dart';
import 'package:new_project/Screens/registrationscreen.dart';
import 'package:new_project/Utils/colors_utils.dart';
import 'package:new_project/Utils/constant_utils.dart';
import 'package:new_project/models/models.dart';
import 'package:new_project/widget/myapp_snake_bar.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Loginscreen extends StatefulWidget {
  const Loginscreen({super.key});

  @override
  State<Loginscreen> createState() => _LoginscreenState();
}

class _LoginscreenState extends State<Loginscreen> {
  ColorsUtils colorUtils = ColorsUtils();
  TextEditingController userName = TextEditingController();
  TextEditingController password = TextEditingController();
  bool isLoading = false;
  void initState () {
    userName.text = "9805727983";
    password.text = "ajay@1234";
  }
  

  // void initPrefs() async {
  //   _pref = await SharedPreferences.getInstance();
  //   _setPref(key, value)
  // }
  // void _setPref(String key, List<String> value) {
  //  if (_pref != null) _pref?.setStringList(key, value);
  // }

  // ignore: non_constant_identifier_names
  Future<void> loginApi() async {
    setState(() {
      isLoading = true;
    });
    try {
      final dio = Dio();
      final SharedPreferences pref = await SharedPreferences.getInstance();
    var body = {
      "is_email":"0",
      "phone" : userName.text,
      "password" : password.text,

    };
    print("Login api body $body");
    final response = await dio.post("https://synergysoftindia.com/pizza/api/login", data: body);
    print("Api Response ${response.data}");
    var message = response.data["message"];
    if (response.statusCode == 200) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => BottomNavigation()),
      );
      
      var loginModel = LoginResponse.fromJson(response.data);
      
      pref.setString(PREF_AUTH_TOKEN, loginModel.data.token);
      debugPrint(pref.getString(PREF_AUTH_TOKEN));
      pref.setBool(PREF_IS_LOGIN, true);
      print(pref.getBool(PREF_IS_LOGIN));
     
      

      print(message);
      showSnakeBar(context, message);
       setState(() {
      isLoading = false;
    });
      
      
    } else {
      print("Error message is $message");
       setState(() {
      isLoading = false;
    });

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
  
  final globalKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      body: Stack(
        children: [
            Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [colorUtils.primaryColor, colorUtils.secondaryColor, colorUtils.tertiaryColor],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter
                ),
            ),
            child: Form(
              key: globalKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
              
                Center(child: Image.asset("assets/images/cameraImage.png",
                  width: 80, // Set width
                  height: 80, // Set height
                  
                  )
                ),
                
                Text("Attendance App", 
                style: TextStyle(
                    fontSize: 20,
                    color: Colors.white,
                    fontWeight: FontWeight.bold
                    )
                  ),
                  Container(
                    padding: EdgeInsets.all(20),
                    margin: EdgeInsets.all(20),
                    height: 400,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.all(Radius.circular(12)),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text("Login",style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                            ),
                          ),
                          Spacer(),
                          Row(
                            children: [
                                Container(
                                  margin: EdgeInsets.only(right: 10),
                                  height: 55,
                                  width: 100,
                                 
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(3), // Rounded corners
                                    border: Border.all(color: Colors.grey), 
                                  ),
                                
                                  child: Row(
                                    children: [
                                      Spacer(),
                                      Image.asset("assets/images/ic_down_arrow.png",
                                        width: 10, // Set width
                                        height: 5, // Set height
                                  
                                        ),
                                      Spacer(),
                                      
                                      Image.asset("assets/images/indiaFlag.png",
                                        width: 25, // Set width
                                        height: 25, // Set height
                                  
                                        ),
                                      Spacer(),
                                      Text("+91"),
                                      Spacer(),
                                    ],
                                  ),
                                ),
                              Expanded(
                                child: TextFormField(
                                  validator: (String? value) {
                                    if (value!.isEmpty) {
                                      return "Mobile field is empty";
                                    }
                                  },
                                  controller: userName,
                                  decoration: InputDecoration(
                                    labelText: "Mobile Number",
                                    border: OutlineInputBorder(),
                                  ),  
                                ),
                              ),
                            ],
                          ),
                            Container(
                              padding: EdgeInsets.only(top: 10),
                              child: TextFormField(
                                validator: (String? value) {
                                  if (value!.isEmpty) {
                                    return "Password field is empty";
                                  }
                                },
                                controller: password,
                                decoration: InputDecoration(
                                  labelText: "Password",
                                  border: OutlineInputBorder(),
                                  ),
                                ),
                            ),
                          
                          Container(
                            alignment: Alignment.topRight,
                            child: TextButton(
                              onPressed: () {
                            
                            },
                            
                            child: Text("Forgot Password?", style: TextStyle(fontSize: 14, color: colorUtils.tertiaryColor),),
                            ),
                          ),
                          Spacer(),
                          SizedBox(
                            height: 50,
                            width: double.infinity,
                            child: ElevatedButton(
                              onPressed: () {
                              //  if(userName.text.isEmpty) {
                              //   ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("User text field is empty")));
              
                              //  } else {
                              //   loginApi();  
                              //  }
                              if (globalKey.currentState!.validate()) {
                                loginApi();
                              }
                               
                              },
                              style: ElevatedButton.styleFrom(
                                  backgroundColor: colorUtils.tertiaryColor, // Button color
                                  foregroundColor: Colors.white, // Text color
                                  padding: EdgeInsets.symmetric(horizontal: 20, vertical: 12), // Button padding
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10), // Rounded corners
                                  ),
                                ),
                              child: Text("Login",style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),),
                            ),
                          ),
                          Spacer(),
                          Text("----------or----------"),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center, 
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Text("Don't have an account?"),
                              TextButton(onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(builder: (context) => Registrationscreen()),
                                );
                              }, child: Text("Registration",style: TextStyle(color: colorUtils.tertiaryColor),))
                            ],
                          ),
                        ]
                    ),
                  ),
              ],
                      ),
            ),
          
        ),
        if (isLoading) 
        Positioned.fill(
          child: Container(
            decoration: BoxDecoration(
              color: Colors.black

            ),
            
            child: Center(
              child: CircularProgressIndicator(),
            ),
          ),
        )

        ],
      
      )
  
    );
    
  }
}


