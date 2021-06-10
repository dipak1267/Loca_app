
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:custom_check_box/custom_check_box.dart';
import 'package:http/http.dart' as http;
import 'home_page.dart';
import 'loginpage.dart';
import 'model/registration_model.dart';

class singup extends StatefulWidget {
  const singup({Key key}) : super(key: key);

  @override
  _singupState createState() => _singupState();
}

class _singupState extends State<singup> {
  @override
  @override
  void initState() {
    super.initState();
    }
  GlobalKey<FormState> _key = new GlobalKey();

   String username,lastname,email,password,password1,registrationCode;
  // var _username = TextEditingController();
  // var _lastname = TextEditingController();
  // var _email = TextEditingController();
  // var _password = TextEditingController();
  // var _password1 = TextEditingController();
  // var _registraioncode = TextEditingController();
  Widget build(BuildContext context) {
    var _ischeck = false;
    return Scaffold(
      body: ListView(

        children: [
          SizedBox(
            height: 40,
          ),
          Center(
            child: Image.asset('asset/logo.png', width: 150,),
          ),
          SizedBox(
            height: 40,
          ),
          Center(
            child: Image.asset('asset/buid.png', width: 300,),
          ),
          Container(

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
                  SizedBox(height: 15,),
                  Row(

                    children: [
                      SizedBox(width: 20,),
                      Expanded(
                        child: Container(
                          child: TextFormField(
                            // controller: _email,
                            decoration: InputDecoration(
                              hintText: 'user name',
                              hintStyle: TextStyle(
                                color: Colors.white,
                              ),

                              enabledBorder: UnderlineInputBorder(
                                borderSide: BorderSide(color: Colors.white),
                              ),
                              focusedBorder: UnderlineInputBorder(
                                borderSide: BorderSide(color: Colors.white),
                              ),
                            ),
                            validator: (val) {
                              if (val.isEmpty) {

                                return "Please enter mail";
                              }
                              else
                                null;
                            },
                            onSaved: (val) => username = val,
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 30,
                      ),
                      Expanded(
                        child: Container(
                          child: TextField(
                            // controller: _lastname,
                            decoration: InputDecoration(
                              hintText: 'Last name',
                              hintStyle: TextStyle(
                                color: Colors.white,
                              ),

                              enabledBorder: UnderlineInputBorder(
                                borderSide: BorderSide(color: Colors.white),
                              ),
                              focusedBorder: UnderlineInputBorder(
                                borderSide: BorderSide(color: Colors.white),
                              ),

                            ),
                            onSubmitted: (val) {
                              setState(() {
                                lastname = val;
                              });
                            },
                          ),

                        ),
                      ),
                      SizedBox(
                        width: 20,
                      ),
                    ],
                  ),
                  Center(
                    child: Container(
                      width: 350,
                      child: TextFormField(
                        // controller: _email,
                        decoration: InputDecoration(
                          hintText: 'Mail',

                          hintStyle: TextStyle(
                            color: Colors.white,
                          ),

                          enabledBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.white),
                          ),
                          focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.white),
                          ),
                        ),
                        validator: (val) {
                          if (val.isEmpty) {

                            return "Please enter mail";
                          }
                          else
                            null;
                        },
                        onSaved: (val) => email = val,
                      ),
                    ),
                  ),

                  SizedBox(
                    height: 10,
                  ),
                  Center(
                    child: Container(
                      width: 350,
                      child: TextFormField(
                        // controller: registrationCode,
                        decoration: InputDecoration(
                          hintText: 'Registration code',

                          hintStyle: TextStyle(
                            color: Colors.white,
                          ),

                          enabledBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.white),
                          ),
                          focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.white),
                          ),
                        ),
                        validator: (val) {
                          if (val.isEmpty) {
                            return "Please code";
                          }
                          else
                            null;
                        },
                        onSaved: (val)=> registrationCode =val,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Center(
                    child: Container(
                      width: 350,
                      child: TextFormField(
                        // controller: password,
                        decoration: InputDecoration(
                          hintText: 'Password',

                          hintStyle: TextStyle(
                            color: Colors.white,
                          ),

                          enabledBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.white),
                          ),
                          focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.white),
                          ),
                        ),
                        validator: (val) {
                          if (val.length < 6) {

                            return "Please enter 6 or more digit";
                          }
                          else
                            null;
                        },
                        onSaved: (val)=> password1= val,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Center(
                    child: Container(
                      width: 350,
                      child: TextFormField(
                        // controller: password,
                        decoration: InputDecoration(
                          hintText: 'Re-enter Password',

                          hintStyle: TextStyle(
                            color: Colors.white,
                          ),

                          enabledBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.white),
                          ),
                          focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.white),
                          ),
                        ),
                        validator: (val) {
                          if (val.length < 6) {
                            return "Password dont match";
                          }
                          else
                            null;
                        },
                        onSaved: (val)=>password = val ,
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


                          Createuser(username,email,password,registrationCode);


                         // Navigator.push(context, MaterialPageRoute(builder: (context)=>Homep()));
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
        ],
      ),
    );
  }

 Createuser(String _username, String _email,
      String _password, String _registrationCode) async{

    var res = await http.post(
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
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => Homep(str.data.email,str.data.username)));
      }

    print(str.status);
      print(str.data.email);
      print(res.body);
    }
  }


}
