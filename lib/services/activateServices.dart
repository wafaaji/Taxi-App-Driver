import 'dart:convert';
import 'package:driver/api.dart';
import 'package:driver/model/activateModel.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:http/http.dart' as http;

class ActivateServices {


  //Use the capabilities of the http package
  static var client = http.Client();

  static final storage = const FlutterSecureStorage();

  static Future<ActivateModel> activate() async {

    var token = await storage.read(key: 'token');
    //var token = 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwOi8vMTkyLjE2OC4xLjEwNDo4MDAwL2FwaS9kcml2ZXIvbG9naW4iLCJpYXQiOjE2NTk4MDg1MDcsImV4cCI6MTY1OTgxMjEwNywibmJmIjoxNjU5ODA4NTA3LCJqdGkiOiJJTlRhTzJmY3ZYZUFSQ0VvIiwic3ViIjoiMSIsInBydiI6IjkxOWMzMjZkNDNhYjE1MTlhOGJhM2I4NTg2YjY4NzUyZThjODM4MDcifQ.oNhZj8hR__D5KLGeTvl3z3LW1wANPFQJz1Q-3lTBuLg';
    try {
      var response = await client.post(
        Uri.parse(Api.baseApi + ApiEndPoint.activate),

        headers: {
          "Authorization": 'Bearer ${token}',
        },
      );

      print(response.body.toString());
      if (response.statusCode == 200 || response.statusCode == 201) {
        return userFromJsonActivateModel(response.body);
      }

      throw 'wrong request try again please';
    } catch(e){
      throw "Wrong Activate ,Please try again";
    }

  }//end activate

}// end class ActivateServices