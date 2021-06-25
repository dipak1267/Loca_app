// import 'dart:convert';
// import 'package:async/async.dart';
// import 'package:flutter/material.dart';
// import 'dart:io';
// import 'package:http/http.dart' as http;
// class update{
//   update({@required File file});
//   upload(File imageFile)async{
//     var stream = new http.ByteStream(DelegatingStream.typed(imageFile.openRead()));
//     var length = await imageFile.length();
//
//     var uri = Uri.parse("http://codonnier.tech/jaydeep/container/dev/Service.php?Service=updateUserDetails&show_error=true");
//
//     var request = new http.MultipartRequest("POST", uri);
//     var multipartFile = new http.MultipartFile('file', stream, length,
//         filename: basename(imageFile.path));
//     //contentType: new MediaType('image', 'png'));
//
//     request.files.add(multipartFile);
//     var response = await request.send();
//     print(response.statusCode);
//     response.stream.transform(utf8.decoder).listen((value) {
//       print(value);
//     });
//   }
//
//
// }