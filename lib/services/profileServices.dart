import 'dart:convert';
import 'package:driver/api.dart';
import 'package:driver/model/profileModel.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:http/http.dart' as http;

class ProfileServices{

  //Use the capabilities of the http package
  static var client = http.Client();

  static final storage = const FlutterSecureStorage();

  static Future<ProfileModel> profile() async{

    var token = await storage.read(key: 'token');
    //var token = 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwOi8vMTkyLjE2OC40My45ODo4MDAwL2FwaS9kcml2ZXIvbG9naW4iLCJpYXQiOjE2NjAyMTQ3ODYsImV4cCI6MTY2MDIxODM4NiwibmJmIjoxNjYwMjE0Nzg2LCJqdGkiOiJiR1F4RnowVGhramJEclRoIiwic3ViIjoiMiIsInBydiI6IjkxOWMzMjZkNDNhYjE1MTlhOGJhM2I4NTg2YjY4NzUyZThjODM4MDcifQ.yfQP1lfnXnXWa65ImDsRwTz-Pignq2N_pgER-oDaldg';
      final response = await client.get(
        Uri.parse(Api.baseApi + ApiEndPoint.getProfile),
        headers: {
          "Authorization": 'Bearer ${token}',
        },
      );
      print(response.body.toString());
      if (response.statusCode == 200 || response.statusCode == 201) {
        return ProfileModel.fromJson(json.decode(response.body));
      }else{
        throw Exception('Something wrong,Please try again');
      }
  }

}//end class ProfileServices