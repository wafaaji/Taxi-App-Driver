import 'dart:convert';
import 'package:driver/api.dart';
import 'package:driver/model/pincodeModel.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:http/http.dart' as http;

class PincodeServices {


  //Use the capabilities of the http package
  static var client = http.Client();

  static final storage = const FlutterSecureStorage();

  static Future<PincodeModel> pincode(PincodeModel pincode) async {

    var token = await storage.read(key: 'token');
    //var token = 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwOi8vMTkyLjE2OC4xLjEwNDo4MDAwL2FwaS9kcml2ZXIvbG9naW4iLCJpYXQiOjE2NjAwMzIyMTUsImV4cCI6MTY2MDAzNTgxNSwibmJmIjoxNjYwMDMyMjE1LCJqdGkiOiJtQkREaWIxWGlVa1BZYVhsIiwic3ViIjoiMSIsInBydiI6IjkxOWMzMjZkNDNhYjE1MTlhOGJhM2I4NTg2YjY4NzUyZThjODM4MDcifQ.2Cf03ckZzE4WibAEskvrGZyEuh44vwfBHkwITDTfCMY';
      var response = await client.post(
        Uri.parse(Api.baseApi + ApiEndPoint.pin),

        headers: {
          "Authorization": 'Bearer ${token}',
        },

        body: pincode.toJson(),
      );

      print(response.body.toString());
      if (response.statusCode == 200 || response.statusCode == 201) {
        print('bbbbb');
        return PincodeModel.fromJson(jsonDecode(response.body));
      }else{
        throw Exception('Wrong PIN ,Please try again');
      }

  }//end pincode

}// end class PincodeServices