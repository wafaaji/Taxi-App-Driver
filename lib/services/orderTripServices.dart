import 'dart:convert';

import 'package:driver/api.dart';
import 'package:driver/model/acceptModel.dart';
import 'package:driver/model/refusalModel.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:http/http.dart' as http;

class OrderTripServices {

  //Use the capabilities of the http package
  static var client = http.Client();

  static final storage = const FlutterSecureStorage();

  static Future<AcceptModel> accept(AcceptModel accept) async {

    var token = await storage.read(key: 'token');
    //var token = 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwOi8vMTkyLjE2OC4xLjEwNDo4MDAwL2FwaS9kcml2ZXIvbG9naW4iLCJpYXQiOjE2NTk5MzYzMjQsImV4cCI6MTY1OTkzOTkyNCwibmJmIjoxNjU5OTM2MzI0LCJqdGkiOiJpMVM0WVViaGtIMVBHWjg0Iiwic3ViIjoiMSIsInBydiI6IjkxOWMzMjZkNDNhYjE1MTlhOGJhM2I4NTg2YjY4NzUyZThjODM4MDcifQ.8PtgTVDfqzGIl4usthW4QYEUHZ8JYoWWsaII3av5Yow';

      print('dddd');
      var response = await client.post(
        Uri.parse(Api.baseApi + ApiEndPoint.accept),

        headers: {
          "Authorization": 'Bearer ${token}',
        },

        body: accept.toJson(),
      );

      print(response.body.toString());

      if (response.statusCode == 200 || response.statusCode == 201) {
        print('aaaa');
        return AcceptModel.fromJson(jsonDecode(response.body));
      }else{
        throw Exception('Something wrong ,Please try again');
      }

  }//end accept

  static Future<RefusalModel> refusal(RefusalModel refusal) async {

    var token = await storage.read(key: 'token');
    //var token = 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwOi8vMTkyLjE2OC4xLjEwNDo4MDAwL2FwaS9kcml2ZXIvbG9naW4iLCJpYXQiOjE2NTk2MzQ1NTksImV4cCI6MTY1OTYzODE1OSwibmJmIjoxNjU5NjM0NTU5LCJqdGkiOiJSa1owQUhEMHc4MlpiaE9rIiwic3ViIjoiMSIsInBydiI6IjkxOWMzMjZkNDNhYjE1MTlhOGJhM2I4NTg2YjY4NzUyZThjODM4MDcifQ.nhirK6sd4-2mhBAZv01p9ZhsnUQZyOCG5qLgGrbDK_Y';

      final response = await client.post(
        Uri.parse(Api.baseApi + ApiEndPoint.refusal),

        headers: {
          "Authorization": 'Bearer ${token}',
        },

        body: refusal.toJson(),
      );

      print(response.body.toString());

      if (response.statusCode == 200 || response.statusCode == 201) {
        print('aaaa');
        return RefusalModel.fromJson(jsonDecode(response.body));
      }else{
        throw Exception('Something wrong ,Please try again');
      }

  }//end refusal

}//end class OrderTripServices