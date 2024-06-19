import 'dart:convert';

class PincodeModel {

  String? message;
  String? code;

  //Constructor
  PincodeModel({
    this.message,
    this.code,
  });

  //function to shift from json to object
  factory PincodeModel.fromJson(Map<String , dynamic> userJson) =>
      PincodeModel(
        message: userJson['message'],
      );

  //function to shift from object to json
  Map<String , dynamic> toJson() {
    Map<String , dynamic> pincodeMap = {
      'code' : code,
    };
    return pincodeMap;
  }

}//end class PincodeModel


//for shift from string to json
PincodeModel userFromJsonPincode(String str) => PincodeModel.fromJson(json.decode(str));

//for shift from json to string
String PincodeModeToJson(PincodeModel data) => json.encode(data.toJson());