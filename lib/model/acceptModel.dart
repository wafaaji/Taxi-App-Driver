import 'dart:convert';

class AcceptModel{

  String? msg;
  int? trip_status;
  String? trip_id;

  //contracture
  AcceptModel({
    this.msg,
    this.trip_status,
    this.trip_id,
  });

  //function to shift from json to object
  factory AcceptModel.fromJson(Map<dynamic , dynamic> userJson) =>
      AcceptModel(
        msg: userJson['msg'],
        trip_status:userJson['trip_status'],
      );

  //function to shift from object to json
  Map<dynamic , dynamic> toJson() {
    Map<dynamic , dynamic> acceptMap = {
      'trip_id': trip_id,
    };
    return acceptMap;
  }

}//end class AcceptModel

//for shift from string to json
AcceptModel userFromJsonAcceptModel(String str) => AcceptModel.fromJson(json.decode(str));

//for shift from json to string
String AcceptModelToJson(AcceptModel data) => json.encode(data.toJson());