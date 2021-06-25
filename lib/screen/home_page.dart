import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart' as http;
import 'package:image_picker/image_picker.dart';
import 'package:mime/mime.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:sample_app/extras/user_camera.dart';
import 'package:sample_app/main.dart';
import 'package:sample_app/model/profile_update_model.dart';


class Homep extends StatefulWidget {
  final email;
  final name;

  Homep(this.email, this.name);

  @override
  _HomepState createState() => _HomepState();
}

class _HomepState extends State<Homep> {
  File imagefile;
  var path;
  final _picker = ImagePicker();
  Profileupload profile;
  var multipartFile;
  File file;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ListView(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  child: Column(
                    children: [
                      SizedBox(
                        height: 70,
                      ),
                      Text(
                        'Profile',
                        style: TextStyle(
                            fontSize: 30, fontWeight: FontWeight.w800),
                      ),
                      SizedBox(
                        height: 30,
                      ),
                      ClipRRect(
                        borderRadius: BorderRadius.circular(80),
                        child: Stack(
                          children: [
                            imagefile == null
                                ? Image.asset(
                                    "asset/logo.png",
                                    height: 100,
                                    width: 100,
                                    fit: BoxFit.contain,
                                  )
                                : Image.file(
                                    imagefile,
                                    height: 100,
                                    width: 100,
                                    fit: BoxFit.fill,
                                  ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 14,
                      ),
                      Text(
                        widget.name,
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.w600),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        widget.email,
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.w600),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Card(
                        elevation: 4,
                        child: ListTile(
                          onTap: () {
                            selection();
                          },
                          leading: Icon(
                            Icons.camera_alt_outlined,
                            color: Colors.black,
                          ),
                          title: Text(
                            'Set Photo',
                            style: TextStyle(
                                fontWeight: FontWeight.w600,
                                color: Colors.black),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
                SizedBox(
                  height: 70,
                ),
                OutlinedButton(
                  onPressed: () async{
                    var res = await uploadImage(imagefile.path);
                    setState(() {
                      state = res;
                      print('============================${res.toString()}=============================');
                    });
                  },
                  child: Text('Submmite'),
                ),
                SizedBox(
                  height: 100,
                ),
                OutlinedButton(
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => MyApp()));
                  },
                  child: Text('Log Out'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  _Camerapop() async {
    var camerastatus = await Permission.camera.status;
    print('Status = ${camerastatus}');
    if (!camerastatus.isGranted) {
      Permission.camera.request();
      Fluttertoast.showToast(
          msg:
              "You cant add image if you want to add image allow camera permision");
    } else if (camerastatus.isGranted) {
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => pickedimage()));
    } else {
      return null;
    }
  }

  selection() {
    showDialog(
        context: context,
        builder: (BuildContext context) => SimpleDialog(
              title: Text("Select source of image"),
              children: [
                RaisedButton(
                  onPressed: () async {
                    await _opencamera();
                  },
                  child: Text("From camera"),
                ),
                RaisedButton(
                  onPressed: () async {
                    await _opengallary();
                  },
                  child: Text("From Gallary"),
                ),
              ],
            ));
  }

  _opencamera() async {
    PickedFile _filed = await _picker.getImage(source: ImageSource.camera);
    setState(() {
      imagefile = File(_filed.path);
      Navigator.of(context).pop();
    });
  }

  _opengallary() async {
    File _filed = (await _picker.getImage(source: ImageSource.gallery)) as File;
    setState(() {
      imagefile = File(_filed.path);
      Navigator.of(context).pop();
    });
  }


  Future<String> uploadImage(filename) async {
    var url = Uri.parse("http://codonnier.tech/jaydeep/container/devService.php?Service=updateUserDetails&show_error=true");
    var request = http.MultipartRequest('POST', url);
    request.files.add(await http.MultipartFile.fromPath('picture', filename));
    var res = await request.send();
    print("===========================================${res.statusCode}================================================");
    return res.reasonPhrase;
  }
  String state = "";


   }

