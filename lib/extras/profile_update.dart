import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart';
import 'package:http_parser/http_parser.dart';
import 'package:mime/mime.dart';

uploadImage(String file) async {
  if (file != null) {
    var headers = <String, String>{
      "Content-Type": "application/json",
      "User-Agent": "container1102",
      "App-Secret": "container1102",
      "App-Track-Version": "v1",
      "App-Device-Type": "iOS",
      "App-Store-Version": "1.1",
      "App-Device-Model": "iPhone 8",
      "App-Os-Version": "iOS 11",
      "App-Store-Build-Number": "1.1",
      "Auth-Token":
          "14437a391c370fd10441db24085320437ad40451f4745e49c83174c9969102135214"
    };

    var params = <String, String> {
      "username":"dipak",
      "email":"dipak@codonier.com",
      "address":"Simada",
      "latitude":"21.2206242",
      "longitude":"72.8885936",
    };
    var mimeType = lookupMimeType(file).split("/");
    var multipartFile = MultipartFile(
      'profile_image',
      File(file).readAsBytes().asStream(),
      File(file).lengthSync(),
      filename: file.split("/").last,
      contentType: MediaType(mimeType[0], mimeType[1]),
    );

    var queryParameters = {"Service": "updateUserDetails"};
    String queryString = Uri(queryParameters: queryParameters).query;
    String requestUrl = "http://codonnier.tech/jaydeep/container/dev/Service.php?" + queryString;

    var request = MultipartRequest('POST', Uri.parse(requestUrl));
    request.headers.addAll(headers);
    request.fields.addAll(params);
    request.files.add(multipartFile);
    var res = await request.send();
    res.stream.transform(utf8.decoder).listen((value) {
      if (res.statusCode == 200) {
        var val = jsonDecode(value);
        print(val);
      } else {
        print("error in submit");
      }
    });

    print(request.toString());
    print("================================${res.statusCode}");
  }
}
