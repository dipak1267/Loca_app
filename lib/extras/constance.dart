import 'package:flutter/material.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:sample_app/main.dart';
import 'package:sample_app/screen/forgotpass.dart';
import 'package:sample_app/screen/home_page.dart';
import 'package:sample_app/screen/loginpage.dart';
import 'package:sample_app/screen/singup.dart';

class Routes {
 static List<GetPage> route = [
   GetPage(name: Main, page: ()=>MyApp(),transition: Transition.rightToLeft),
    GetPage(name: SIGN_UP, page: ()=>singup(),transition: Transition.rightToLeft),
    GetPage(name: SIGN_IN, page: ()=>Login()),
    GetPage(name: FORGOT_PASSWORD, page: ()=>Forgotp()),
    GetPage(name: HOME, page: ()=> Homep()),
  ];
 static const String Main = '/main';
 static const String SIGN_IN = '/sign_in';
 static const String SIGN_UP = '/sign_up';
 static const String HOME = '/home';
 static const String FORGOT_PASSWORD = '/forgot_password';
}


class Storages{
 static const String IS_LOGGED_IN = "isLoggedIn";
 static const String USER_NAME = "userName";
 static const String USER_EMAIL = "userEmail";
}



extension space on double {
 addHSpace() {
  return SizedBox(
   height: this,
  );
 }

 addWSpace() {
  return SizedBox(
   width: this,
  );
 }
}

double mediaQueryWidth(BuildContext context) {
 return MediaQuery.of(context).size.width;
}

double mediaQueryHeight(BuildContext context) {
 return MediaQuery.of(context).size.height;
}