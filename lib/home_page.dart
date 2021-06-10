import 'package:flutter/material.dart';

import 'loginpage.dart';

class Homep extends StatelessWidget {
  final email;
  final name;

  Homep(this.email,this.name);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(child: Text("Welcome ${name}",style: TextStyle(fontSize: 20,fontWeight: FontWeight.w500))),
          Center(child: Text("Email:- ${email}",style: TextStyle(fontSize: 20,fontWeight: FontWeight.w500))),
        ],
      ),
    );
  }
}
