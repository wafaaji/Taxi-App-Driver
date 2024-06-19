import 'dart:convert';

class EditProfileModel {

  Driver? driver;
  String? msg;
  String? name;
  String? gender;
  String? typeofcar;
  String? number;
  String? image;

  //Constructor
  EditProfileModel({
    this.driver,
    this.msg,
    this.typeofcar,
    this.number,
    this.image,
    this.gender,
    this.name,
  });

  //function to shift from json to object
  factory EditProfileModel.fromJson(Map<dynamic? , dynamic?> userJson) =>
      EditProfileModel(
        driver: Driver.fromJson(userJson['driver']),
        msg: userJson['msg'],
      );

  //function to shift from object to json
  Map<dynamic? , dynamic?> toJson() {
    Map<dynamic? , dynamic?> editProfileMap = {
      'name' : name,
      'gender' : gender,
      'image' : image,
      'number' : number,
      'typeofcar' : typeofcar,
    };
    return editProfileMap;
  }

}//end class UserLoginModel

//for shift from string to json
EditProfileModel userFromJsonEditProfile(String str) => EditProfileModel.fromJson(json.decode(str));

//for shift from json to string
String EditProfileModelToJson(EditProfileModel data) => json.encode(data.toJson());

class Driver {
  int? id;
  String? name;
  String? gender;
  String? typeofcar;
  String? number;
  String? image;
  String? address;
  String? status;

  //Constructor
  Driver({
    this.id ,
    this.name ,
    this.gender,
    this.typeofcar,
    this.number,
    this.image,
    this.address,
    this.status,
  });

  //function to shift from json to object
  factory Driver.fromJson(Map<dynamic? , dynamic?> userJson) =>
      Driver(
        id: userJson['id'],
        name: userJson['name'],
        gender: userJson['gender'],
        typeofcar: userJson['typeofcar'],
        number: userJson['number'],
        image: userJson['image'],
        address: userJson['address'],
        status: userJson['status'],
      );

}//end class Driver