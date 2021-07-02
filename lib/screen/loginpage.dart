import 'dart:convert';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sample_app/controller/loogin_controller.dart';
import 'package:sample_app/screen/singup.dart';
import 'package:sample_app/services/login_service.dart';
import 'package:sample_app/widgets/textfield.dart';
import 'forgotpass.dart';

class Login extends StatefulWidget {
  const Login({Key key}) : super(key: key);

  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  @override


  GlobalKey<FormState> _key = new GlobalKey();
  var _email = TextEditingController();
  var _password = TextEditingController();
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
                        child: App_TextField(
                          label: "Email",
                          isPassword: false,
                          type: TextInputType.emailAddress,
                          cursorColour : Colors.white,
                          controller: _email,
                          validator: (value) {
                            if (_email.text.isEmpty) {
                              return "Please enter email.";
                            }
                            return null;
                          },
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    Center(
                      child: Container(
                        width: 350,
                        child: App_TextField(
                          label: "Password",
                          type: TextInputType.emailAddress,
                          isPassword: true,
                          cursorColour : Colors.white,
                          controller: _password,
                          validator: (value) {
                            if (_email.text.isEmpty) {
                              return "Please enter Password.";
                            }else if (_password.text.length < 6){
                              return "Password must have 6 characters";
                            }
                            return null;
                          },
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
                         Services.loginuser(_email.text,_password.text);
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
}



