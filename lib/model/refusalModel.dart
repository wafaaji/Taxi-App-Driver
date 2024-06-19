import 'dart:convert';

class RefusalModel{

  String? msg;
  int? trip_status;
  String? trip_id;

  //contracture
  RefusalModel({
    this.msg,
    this.trip_status,
    this.trip_id,
  });

  //function to shift from json to object
  factory RefusalModel.fromJson(Map<dynamic , dynamic> userJson) =>
      RefusalModel(
        msg: userJson['msg'],
        trip_status: userJson['trip_status'],
      );

  //function to shift from object to json
  Map<dynamic , dynamic> toJson() {
    Map<dynamic , dynamic> refusalMap = {
      'trip_id': trip_id,
    };
    return refusalMap;
  }

}//end class RefusalModel

//for shift from string to json
RefusalModel userFromJsonRefusalModel(String str) => RefusalModel.fromJson(json.decode(str));

//for shift from json to string
String RefusalModelToJson(RefusalModel data) => json.encode(data.toJson());