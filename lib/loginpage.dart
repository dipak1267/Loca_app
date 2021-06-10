import 'dart:convert';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:sample_app/singup.dart';
import 'package:http/http.dart' as http;
import 'forgotpass.dart';
import 'home_page.dart';
import 'model/model_Data.dart';

class Login extends StatefulWidget {
  const Login({Key key}) : super(key: key);

  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  @override
  GlobalKey<FormState> _key = new GlobalKey();
  String mail,password;

  Widget build(BuildContext context) {
    return Scaffold(
      body:ListView(

        children: [
          SizedBox(
            height: 40,
          ),
          Center(
            child: Image.asset('asset/logo.png',width: 150,),
          ),
          SizedBox(
            height: 70,
          ),
          Center(
            child: Image.asset('asset/buid.png',width: 300,),
          ),
          Container(

            decoration: BoxDecoration(
              borderRadius: BorderRadius.only(topRight: Radius.circular(25),topLeft: Radius.circular(25)),
              gradient: LinearGradient(
                begin: Alignment(0.0, -1.0),
                end: Alignment(0.0, 1.0),
                colors: [const Color(0xff2f2f8e), const Color(0xff8e2f8e)],
                stops: [0.0, 1.0],
              ),
            ),
            height: 600,
            child: Column(
              children: [
                SizedBox(
                  height: 25,
                ),
                
                Row(
                  children: [
                    SizedBox(width: 20,),
                    Text(
                      'Sign In',
                      style: TextStyle(
                        fontFamily: 'Nunito Sans',
                        fontSize: 30,
                        color: Colors.white,
                        fontWeight: FontWeight.w900,
                      ),
                      textAlign: TextAlign.right,
                    ),
                  ],
                ),
                Form(
                    key: _key,
                    child: Column(
                  children: [
                    SizedBox(height: 40,),
                    Center(
                      child: Container(
                        width: 350,
                        child: TextFormField(
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
                          validator: (val){
                            if(val.isEmpty){

                              return "Please enter mail";
                            }
                            else null;
                          },
                          onSaved: (val)=> mail = val,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    Center(
                      child: Container(
                        width: 350,
                        child: TextFormField(
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
                          validator: (val1){
                            if(val1.length<6){

                              return "Enter valid password";
                            }
                            else null;
                          },
                          onSaved: (val)=> password = val,
                        ),
                      ),
                    ),
                    SizedBox(height: 21,),
                    Row(

                      crossAxisAlignment: CrossAxisAlignment.end,
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [

                        InkWell(
                          child: Container(
                            child: Text("Forget Password ?",style: TextStyle(
                              fontFamily: 'Nunito Sans',
                              fontSize: 15,
                              color: Colors.white,
                              fontWeight: FontWeight.w400,
                            ),
                            ),
                          ),
                          onTap: (){
                            Navigator.push(context, MaterialPageRoute(builder: (context)=>Forgotp()));
                          },
                        ),
                        SizedBox(width: 28,),
                      ],
                    ),
                    SizedBox(
                        height: 40
                    ),
                    InkWell(
                      child: Container(
                        height: 50,
                        width: 350,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(24.0),
                          color: const Color(0xffffffff),
                        ),
                        child:  Center(
                          child: Text(
                            'Sign In',
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
                      onTap: (){
                        if(_key.currentState.validate()){
                         _key.currentState.save();
                         loginuser(mail, password);
                        }
                      },
                    ),
                  ],
                )
                ),


                SizedBox(
                  height: 68,
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Text("If You dont have an account",style: TextStyle(
                      fontFamily: 'Nunito Sans',
                      fontSize: 15,
                      color: Colors.white,
                      fontWeight: FontWeight.w300,
                    ),),
                    SizedBox(
                      width: 70,
                    ),
                    InkWell(
                      onTap: (){
                        Navigator.push(context, MaterialPageRoute(builder: (context)=> singup()));
                      },
                      child: Text("Sign Up",style: TextStyle(
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
        ],
      ),
    );
  }
 loginuser(String _email,String _password, ) async{

    var res =await http.post(
      Uri.parse('http://codonnier.tech/jaydeep/container/dev/Service.php?Service=userlogin'),
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
      body: jsonEncode(<String, dynamic> {
        "email": _email,
        "password": _password,
      }),

    );
    print(res.statusCode);
   if(res.statusCode == 200){
     var str = modelDataFromJson(res.body);
     if(str.status == 1){
       Navigator.push(context, MaterialPageRoute(builder: (context)=> Homep(str.data.email,str.data.username)));
     }
     print(str.data.email);
   }
     // print(res);
    return res;
  }
}



