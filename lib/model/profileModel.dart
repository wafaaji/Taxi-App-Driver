import 'dart:convert';

class ProfileModel {
  int? id;
  String? name;
  String? gender;
  String? typeofcar;
  String? image;
  String? address;
  int? number;
  int? rating;

  //contracture
  ProfileModel({
    this.id,
    this.name,
    this.gender,
    this.typeofcar,
    this.image,
    this.address,
    this.number,
    this.rating,
});

  //function to shift from json to object
  factory ProfileModel.fromJson(Map<String , dynamic> userJson) =>
      ProfileModel(
        name: userJson['name'],
        gender: userJson['gender'],
        typeofcar: userJson['typeofcar'],
        image: userJson['image'],
        address: userJson['address'],
        number: userJson['number'],
        rating: userJson['rating'],
      );

}//end class ProfileModel

//for shift from string to json
ProfileModel userFromJsonProfile(String str) => ProfileModel.fromJson(json.decode(str));
