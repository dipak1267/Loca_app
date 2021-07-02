import 'dart:convert';

import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:sample_app/extras/constance.dart';
import 'package:sample_app/model/login_model_Data.dart';
import 'package:http/http.dart';
import 'package:sample_app/model/registration_model.dart';
  class Services{

    static Future<loginModel> loginuser(var _email,var _password, ) async{
     final userLogged = GetStorage();
      var res = await post(
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
      print(res.body);
      try{
        if(res.statusCode == 200) {
          var str = loginModelFromJson(res.body);

          if (str.status == 1) {
            print('sucsess');
              userLogged.write(Storages.IS_LOGGED_IN, true);
              userLogged.write(Storages.USER_NAME, str.data.username);
            userLogged.write(Storages.USER_EMAIL, str.data.email);
            Get.toNamed(Routes.HOME);
          }
          return str;
        }
      }catch(e){
        print(e);
      }
    }





  }