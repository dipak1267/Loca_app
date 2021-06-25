import 'package:flutter/material.dart';
import 'package:sample_app/screen/singup.dart';


import 'screen/loginpage.dart';

void main() {
  runApp(

      MaterialApp(
        debugShowCheckedModeBanner: false,
        home: MyApp(),
      )
  );
}

class MyApp extends StatefulWidget {
  const MyApp({Key key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  // AssetImage logo =
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
                Navigator.push(context, MaterialPageRoute(builder: (context)=>Login()));
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
                Navigator.push(context, MaterialPageRoute(builder: (context)=>singup()));
              },
            ),
          ],
        ),
      ),
    );

  }
}



