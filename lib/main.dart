import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/route_manager.dart';
import 'package:sample_app/extras/constance.dart';
import 'package:get_storage/get_storage.dart';
import 'package:sample_app/screen/home_page.dart';


void main() async{
    await GetStorage.init();
  runApp(
      GetMaterialApp(

        debugShowCheckedModeBanner: false,
        home: SplaceScreen(),
        getPages: Routes.route,
      ),

  );
}

class SplaceScreen extends StatefulWidget {


  @override
  _SplaceScreenState createState() => _SplaceScreenState();
}

class _SplaceScreenState extends State<SplaceScreen> {
  @override
  final userdetail = GetStorage();
  Widget build(BuildContext context) {
    return Scaffold(
      body: (
      Center(
        child: CircularProgressIndicator(),
      )),
      );
  }

  @override
  void initState() {
    super.initState();
      print(userdetail.read(Storages.IS_LOGGED_IN));
      userdetail.writeIfNull(Storages.IS_LOGGED_IN, false);


    Future.delayed(Duration.zero,()async{;
      await userdetail.read(Storages.IS_LOGGED_IN) ? Get.toNamed(Routes.HOME) : Get.toNamed(Routes.Main);
    });
  }
}


class MyApp extends StatefulWidget {
  const MyApp({Key key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override


  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffffffff),
      body:Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(

            begin: Alignment(0.0, -1.0),
            end: Alignment(0.0, 1.0),
            colors: [const Color(0xff2f2f8e), const Color(0xff8e2f8e)],
            stops: [0.0, 1.0],
          ),
        ),
        child: ListView(
          children: [
            SizedBox(
              height: 40,
            ),
            Center(
              child: Image.asset('asset/Group 1.png',width: 300,),
            ),
            SizedBox(
              height: 20,
            ),
            Text(
              'Refer new tenants to receive\n rewards!',
              style: TextStyle(
                fontFamily: 'Nunito Sans',
                fontSize: 20,
                color: const Color(0xffffffff),
                fontWeight: FontWeight.w600,
              ),
              textAlign: TextAlign.center,
            ),
            SizedBox(
              height: 300,
            ),
            InkWell(
              child: Container(
                height: 50,
                width: 50,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(24.0),
                  color: const Color(0xffffffff),
                ),
                child:  Center(
                  child: Text(
                    'SIGN IN',
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
               Get.toNamed(Routes.SIGN_IN);
              },
            ),
            SizedBox(
              height: 30,
            ),
            InkWell(
              child: Container(
                height: 50,
                width: 50,
                decoration: BoxDecoration(
                  border: Border.all(width: 2,color: const Color(0xffffffff),),
                  borderRadius: BorderRadius.circular(24.0),
                  color: Colors.transparent,
                ),
                child:  Center(
                  child: Text(
                    'SING UP',
                    style: TextStyle(
                      fontFamily: 'Nunito Sans',
                      fontSize: 16,
                      color: const Color(0xffffffff),
                      fontWeight: FontWeight.w900,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
              onTap: (){
                Get.toNamed(Routes.SIGN_UP);
              },
            ),
          ],
        ),
      ),
    );

  }


}



