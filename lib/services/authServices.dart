import 'dart:convert';
import 'package:driver/api.dart';
import 'package:driver/model/loginModel.dart';
import 'package:driver/model/logoutModel.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:http/http.dart' as http;

class AuthServices {

  static final storage = const FlutterSecureStorage();

  //Use the capabilities of the http package
  static var client = http.Client();

  static Future<LoginModel> login(LoginModel login) async{

      final response = await client.post(
        Uri.parse(Api.baseApi + ApiEndPoint.login),

        body: login.toJson(),
        headers: {},
      );

      print(response.body.toString());
      if (response.statusCode == 200 || response.statusCode == 201){
        print('aaaaa');
        return LoginModel.fromJson(jsonDecode(response.body));
      }else{
        throw Exception('Failed ,Please try again');
      }
  }//end login

  static Future<LogoutModel> logout() async {

    var token = await storage.read(key: 'token');
    //var token = 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwOi8vMTkyLjE2OC4xLjEwNDo4MDAwL2FwaS9kcml2ZXIvbG9naW4iLCJpYXQiOjE2NjAyNDEzMjMsImV4cCI6MTY2MDI0NDkyMywibmJmIjoxNjYwMjQxMzIzLCJqdGkiOiJXQ1RxaTJ2MURtV3hzT2oyIiwic3ViIjoiMiIsInBydiI6IjkxOWMzMjZkNDNhYjE1MTlhOGJhM2I4NTg2YjY4NzUyZThjODM4MDcifQ.mFRou1cOLWsGEKBs9HTb2jSAd_DAUiirNTu5Qc5wyMY';

    try {
      final response = await client.post(
        Uri.parse(Api.baseApi+ApiEndPoint.logout),
        headers: {
          "Authorization": 'Bearer ${token}',
        },
      );
      print(response.body.toString());
      if (response.statusCode == 200 || response.statusCode == 201) {
        return LogoutModel.fromJson(jsonDecode(response.body));
      }

      throw 'wrong request try again please';
    }  catch(e){
      throw 'Error';
    }

  }//end logout

}// end class AuthServices