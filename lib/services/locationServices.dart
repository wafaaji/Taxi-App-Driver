import 'dart:convert';

import 'package:driver/api.dart';
import 'package:driver/model/locationModel.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:http/http.dart' as http;

class LocationServices {

  static final storage = const FlutterSecureStorage();

  //Use the capabilities of the http package
  static var client = http.Client();

  //static var token = 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwOi8vMTkyLjE2OC40My45ODo4MDAwL2FwaS9kcml2ZXIvbG9naW4iLCJpYXQiOjE2NjAyMTE5NzEsImV4cCI6MTY2MDIxNTU3MSwibmJmIjoxNjYwMjExOTcxLCJqdGkiOiJsSHpucXF1YzZBUTFOc21lIiwic3ViIjoiMiIsInBydiI6IjkxOWMzMjZkNDNhYjE1MTlhOGJhM2I4NTg2YjY4NzUyZThjODM4MDcifQ.mo4QDyJyfTZERUNPfP73zEB8PiLWZuKzzvktlBDqYKk';

  static var token = storage.read(key: 'token');

  //API with backend
  static Future<LocationModel> locationDriver( LocationModel locationDriver) async{

    final response = await client.post(
      Uri.parse(Api.baseApi + ApiEndPoint.location),

      body: locationDriver.toJson(),
      headers: {
        "Authorization": 'Bearer ${token}',
      },
    );

    print(response.body.toString());
    if (response.statusCode == 200 || response.statusCode == 201){
      print('aaaaa');
      print('=========================${locationDriver.toString()}===========================');
      return LocationModel.fromJson(jsonDecode(response.body));
    }else{
      throw Exception('Failed ,Please try again');
    }
  }//end locationDriver

}//end class LocationServices