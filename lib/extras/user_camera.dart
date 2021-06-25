import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:http/http.dart';

class pickedimage extends StatefulWidget {
  const pickedimage({Key key}) : super(key: key);

  @override
  _pickedimageState createState() => _pickedimageState();
}

class _pickedimageState extends State<pickedimage> {
  @override
  File imagefile;
  final _picker = ImagePicker();
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("IMAGE"),),
      body: ListView(
        children: [
          Column(
            children: [
              imagefile == null ? Placeholder() : Image.file(imagefile),
              SizedBox(
                height: 10,
              ),
              imagefile == null ? RaisedButton(
                child: Text("Add Image"),
                onPressed: () {
                  selection();
                },
              ) :
              RaisedButton(
                child: Text("Update"),
                onPressed: () {
                  // Update();
                },
              ),

            ],
          ),
        ],
      ),
    );;
  }
  selection() {
    showDialog(
        context: context,
        builder: (BuildContext context) => SimpleDialog(
          title: Text("Select source of image"),
          children: [
            RaisedButton(
              onPressed: () async{
                await _opencamera();
              },
              child: Text("From camera"),
            ),
            RaisedButton(
              onPressed: () async{
                await _opengallary();
              },
              child: Text("From Gallary"),
            ),
          ],
        ));
  }

  _opencamera() async{
    PickedFile _filed = await _picker.getImage(source: ImageSource.camera);
    setState(() {
      imagefile = File(_filed.path);
    });
  }
  _opengallary() async{
    PickedFile _filed = await _picker.getImage(source: ImageSource.gallery);
    setState(() {
      imagefile = File(_filed.path);
    });
  }
   //
   // Update() async{
   //
   //  var uri = Uri.parse('http://codonnier.tech/jaydeep/container/dev/Service.php?Service=updateUserDetails&show_error=true');
   //  var request = MultipartRequest('Post', uri);
   //  request.fields['user'] = 'bash';
   //  request.files.add(MultipartFile.fromBytes('file',await File.fromUri('Service.php?Service=updateUserDetails&show_error=true/profile_image').readAsBytes() , contentType: MediaType('image', 'jpeg') ));
   //   Text('Done for the day and like to anounce the next page for route and its kind of difficulty faced over thae');
   // }
}
