
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:custom_check_box/custom_check_box.dart';
import 'package:get/route_manager.dart';
import 'package:get_storage/get_storage.dart';
import 'package:http/http.dart';
import 'package:sample_app/extras/constance.dart';
import 'package:sample_app/model/registration_model.dart';
import 'package:sample_app/services/login_service.dart';
import 'package:sample_app/widgets/startup_topbar.dart';
import 'package:sample_app/widgets/textfield.dart';
import 'loginpage.dart';

class singup extends StatefulWidget {

  @override
  _singupState createState() => _singupState();
}

class _singupState extends State<singup> {
  GlobalKey<FormState> _key = new GlobalKey();

   // String username,lastname,email,password,password1,registrationCode;
  Services service;
  var _username = TextEditingController();
  var _lastname = TextEditingController();
  var _email = TextEditingController();
  var _password = TextEditingController();
  var _password1 = TextEditingController();
  var _registraioncode = TextEditingController();
  Widget build(BuildContext context) {
    var _ischeck = false;
    return Scaffold(
      body: Stack(
        children: [
          Column(
              children: [
                StartUpTopBar(),
               SingleChildScrollView(
                 child : Expanded(
                   child: Container(
                     decoration: BoxDecoration(
                       borderRadius: BorderRadius.only(
                           topRight: Radius.circular(25), topLeft: Radius.circular(25)),
                       gradient: LinearGradient(
                         begin: Alignment(0.0, -1.0),
                         end: Alignment(0.0, 1.0),
                         colors: [const Color(0xff2f2f8e), const Color(0xff8e2f8e)],
                         stops: [0.0, 1.0],
                       ),
                     ),
                     height: 600,
                     child: Padding(
                       padding: const EdgeInsets.all(30),
                       child: Form(
                         key: _key,
                         child: Column(
                           children: [
                             SizedBox(
                               height: 25,
                             ),
                             Row(
                               children: [
                                 SizedBox(width: 20,),
                                 Container(
                                   child: Text(
                                     'Sign up',
                                     style: TextStyle(
                                       fontFamily: 'Nunito Sans',
                                       fontSize: 30,
                                       color: Colors.white,
                                       fontWeight: FontWeight.w900,
                                     ),
                                     textAlign: TextAlign.right,
                                   ),
                                 ),
                               ],
                             ),
                             (mediaQueryHeight(context) * 0.03).addHSpace(),
                             Row(

                               children: [

                                 Expanded(
                                   child: Container(
                                     child:  App_TextField(
                                       label: "user_name",
                                       type: TextInputType.emailAddress,
                                       cursorColour : Colors.white,
                                       controller: _username,
                                       validator: (value) {
                                         if (_username.text.isEmpty) {
                                           return "Please enter username.";
                                         }
                                         return null;
                                       },
                                     ),
                                   ),
                                 ),
                                 32.0.addWSpace(),
                                 Expanded(
                                   child: App_TextField(
                                     label: "last_name",
                                     type: TextInputType.emailAddress,
                                     cursorColour : Colors.white,
                                     controller: _lastname,
                                     validator: (value) {
                                       if (_lastname.text.isEmpty) {
                                         return "Please enter username.";
                                       }
                                       return null;
                                     },
                                   ),

                                 ),


                               ],
                             ),
                             Center(
                               child: App_TextField(
                                 label: "Email",
                                 type: TextInputType.emailAddress,
                                 cursorColour : Colors.white,
                                 controller: _email,
                                 validator: (value) {
                                   if (_email.text.isEmpty) {
                                     return "Please enter Email.";
                                   }
                                   return null;
                                 },
                               ),
                             ),

                             SizedBox(
                               height: 10,
                             ),
                             Center(
                               child: Container(
                                 width: 350,
                                 child: App_TextField(
                                   label: "RegistrationCode",
                                   type: TextInputType.emailAddress,
                                   cursorColour : Colors.white,
                                   controller: _registraioncode,
                                   validator: (value) {
                                     if (_registraioncode.text.isEmpty) {
                                       return "Please enter RegistrationCode.";
                                     }
                                     return null;
                                   },
                                 ),
                               ),
                             ),
                             SizedBox(
                               height: 10,
                             ),
                             Center(
                               child: Container(
                                 width: 350,
                                 child: App_TextField(
                                   label: "Password",
                                   type: TextInputType.emailAddress,
                                   cursorColour : Colors.white,
                                   controller: _password,
                                   validator: (value) {
                                     if (_password.text.isEmpty) {
                                       return "Please enter Password.";
                                     }
                                     return null;
                                   },
                                 ),
                               ),
                             ),
                             SizedBox(
                               height: 10,
                             ),
                             Center(
                               child: Container(
                                 width: 350,
                                 child: App_TextField(
                                   label: "Re-Enter Password",
                                   type: TextInputType.emailAddress,
                                   cursorColour : Colors.white,
                                   controller: _password1,
                                   validator: (value) {
                                     if (_password1.text.isEmpty) {
                                       return "Please enter username.";
                                     }else if (value != _password.text){
                                       return 'PassWord IS not match';
                                     }
                                     return null;
                                   },
                                 ),
                               ),
                             ),
                             Row(
                               children: [
                                 SizedBox(width: 10,),

                                 CustomCheckBox(
                                   value: _ischeck,
                                   shouldShowBorder: true,
                                   borderColor: Colors.white,
                                   checkedFillColor: Colors.red,

                                   borderWidth: 1,
                                   checkBoxSize: 22,
                                   onChanged: (val) {
                                     setState(() {
                                       _ischeck = val;
                                     });
                                   },
                                 ),
                                 Text("I Accept the End user aggrement", style: TextStyle(
                                   fontFamily: 'Nunito Sans',
                                   fontSize: 15,
                                   color: Colors.white,
                                   fontWeight: FontWeight.w400,
                                 ),),
                               ],
                             ),
                             SizedBox(
                               height: 25,
                             ),
                             InkWell(
                               child: Container(
                                 height: 50,
                                 width: 350,
                                 decoration: BoxDecoration(
                                   borderRadius: BorderRadius.circular(24.0),
                                   color: const Color(0xffffffff),
                                 ),
                                 child: Center(
                                   child: Text(
                                     'Sign up',
                                     style: TextStyle(
                                       fontFamily: 'Nunito Sans',
                                       fontSize: 16,
                                       color: const Color(0xff252525),
                                       fontWeight: FontWeight.w900,
                                     ),
                                     textAlign: TextAlign.center,
                                   ),
                                 ),
                               ),
                               onTap: () {
                                 if (_key.currentState.validate()) {
                                   _key.currentState.save();
                                   Createuser(_username.text,_email.text,_password.text,_registraioncode.text);

                                 }
                               },
                             ),
                             SizedBox(
                               height: 35,
                             ),
                             Row(
                               crossAxisAlignment: CrossAxisAlignment.end,
                               mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                               children: [
                                 Text("If You already have an account", style: TextStyle(
                                   fontFamily: 'Nunito Sans',
                                   fontSize: 15,
                                   color: Colors.white,
                                   fontWeight: FontWeight.w300,
                                 ),),
                                 SizedBox(
                                   width: 70,
                                 ),
                                 InkWell(
                                   onTap: () {
                                     Navigator.push(context, MaterialPageRoute(
                                         builder: (context) => Login()));
                                   },
                                   child: Text("Sign In", style: TextStyle(
                                     fontFamily: 'Nunito Sans',
                                     fontSize: 15,
                                     color: Colors.white,
                                     fontWeight: FontWeight.w700,
                                   ),
                                   ),
                                 ),
                               ],
                             ),
                           ],
                         ),
                       ),
                     ),
                   ),
                 ),
               ),
              ],
            ),
        ],
      ),
      );

  }
  Createuser(String _username, String _email,
      String _password, String _registrationCode) async{
    final userLogged = GetStorage();
    var res = await post(
      Uri.parse('http://codonnier.tech/jaydeep/container/dev/Service.php?Service=userRegistration'),
      headers: <String, String>{
        'Content-Type': 'application/json',
        'User-Agent': "container1102",
        "App-Secret": "container1102",
        "App-Track-Version":"v1",
        "App-Device-Type":"iOS",
        "App-Store-Version":"1.1",
        "App-Device-Model":"iPhone 8",
        "App-Os-Version":"iOS 11",
        "App-Store-Build-Number":"1.1",

      },
      body: jsonEncode(<String, dynamic>{"username": _username,
        "email": _email,
        "password": _password,
        "registration_code": _registrationCode,
        "user_type":"user",
        "social_id":"",



      }),
    );
    print(res.statusCode);
    if(res.statusCode == 200){
      var str = modelDataFromJson(res.body);
      if(str.status == 1){
        userLogged.write(Storages.IS_LOGGED_IN, true);
        userLogged.write(Storages.USER_NAME, str.data.username);

        userLogged.write(Storages.USER_EMAIL, str.data.email);
        Get.toNamed(Routes.HOME);
      }

      print(str.status);
      print(str.data.email);
      print(res.body);
    }
  }

}

