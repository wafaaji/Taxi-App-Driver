import 'dart:convert';

class LocationModel{

  String? address;
  String? msg;

  //contracture
  LocationModel({
    this.address,
    this.msg,
});

  //function to shift from json to object
  factory LocationModel.fromJson(Map<dynamic , dynamic> userJson) =>
      LocationModel(
        msg: userJson['msg'],
      );

  //function to shift from object to json
  Map<String , dynamic> toJson() {
    Map<String , dynamic> locationMap = {
      'address' : address,
    };
    return locationMap;
  }


}//end class LocationModel

//for shift from string to json
LocationModel userFromJsonLocation(String str) => LocationModel.fromJson(json.decode(str));

//for shift from json to string
String LocationModelToJson(LocationModel data) => json.encode(data.toJson());