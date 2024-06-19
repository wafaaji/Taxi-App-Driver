import 'dart:convert';

class ActivateModel{

  String? msg;

  //contracture
  ActivateModel({
    this.msg,
});

  //function to shift from json to object
  factory ActivateModel.fromJson(Map<String , dynamic> userJson) =>
      ActivateModel(
        msg: userJson['msg'],
      );

}//end class ActivateModel

//for shift from string to json
ActivateModel userFromJsonActivateModel(String str) => ActivateModel.fromJson(json.decode(str));