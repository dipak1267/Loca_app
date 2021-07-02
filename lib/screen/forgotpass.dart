import 'dart:convert';

import 'package:flutter/material.dart';

import 'package:http/http.dart' as http;
import 'package:sample_app/widgets/textfield.dart';
import '../main.dart';

class Forgotp extends StatefulWidget {
  const Forgotp({Key key}) : super(key: key);

  @override
  _ForgotpState createState() => _ForgotpState();
}

class _ForgotpState extends State<Forgotp> {
  GlobalKey<FormState> _key = new GlobalKey();
  var _email = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ui(),
    );
  }
  ui(){
    return ListView(

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
                    'Reset Password',
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
                          child:  App_TextField(
                            label: "Password",
                            type: TextInputType.emailAddress,
                            cursorColour : Colors.white,
                            controller: _email,
                            validator: (value) {
                              if (_email.text.isEmpty) {
                                return "Please enter Password.";
                              }else if (_email.text.isEmpty){
                                return "Please Enter Email";
                              }
                              return null;
                            },
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 30,
                      ),

                      SizedBox(height: 21,),

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
                              'Reset Password',
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
                            try{
                                forgetpassword(_email.text);
                            }catch(e){
                              print(e);
                            }
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
                  Text("If you still remember the password",style: TextStyle(
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
                      Navigator.push(context, MaterialPageRoute(builder: (context)=> MyApp()));
                    },
                    child: Text("Sign In",style: TextStyle(
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
    );
  }
  forgetpassword(String _email)async{
    var res = await http.post(
      Uri.parse('http://codonnier.tech/jaydeep/container/dev/Service.php?Service=userRegistration'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        'User-Agent': "container1102",
        "App-Secret": "container1102",
        "App-Track-Version":"v1",
        "App-Device-Type":"iOS",
        "App-Store-Version":"1.1",
        "App-Device-Model":"iPhone 8",
        "App-Os-Version":"iOS 11",
        "App-Store-Build-Number":"1.1",

      },
        body: jsonEncode(<String, String>{

        "email": _email,
     })
    );
    if(res.statusCode == 200){
      var str = jsonDecode(res.body);
      Navigator.pop(context);
    }
    
  }
}




