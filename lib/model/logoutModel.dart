import 'dart:convert';

class LogoutModel {

  String? message;

  //constructor
  LogoutModel({ this.message });

  //function for shift from json to object
  factory LogoutModel.fromJson ( Map<String , dynamic> userJson) =>
      LogoutModel(
        message: userJson['message'],
      );


}//end class LogoutModel

//for shift from string to json
LogoutModel LogoutModelFromJson(String str) => LogoutModel.fromJson(json.decode(str));

