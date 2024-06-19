import 'dart:convert';

class LoginModel {

  String? token;
  User? user;
  String? email;
  String? password;

  //Constructor
  LoginModel({
    this.token ,
    this.user,
    this.email,
    this.password,
  });

  //function to shift from json to object
  factory LoginModel.fromJson(Map<dynamic , dynamic> userJson) =>
      LoginModel(
        token: userJson['access_token'],
        user: User.fromJson(userJson['user']),
      );

  //function to shift from object to json
  Map<String , dynamic> toJson() {
    Map<String , dynamic> loginMap = {
      'email': email,
      'password' : password,
    };
    return loginMap;
  }

}//end class UserLoginModel

//for shift from string to json
LoginModel userFromJsonLogin(String str) => LoginModel.fromJson(json.decode(str));

//for shift from json to string
String UserLoginModeToJson(LoginModel data) => json.encode(data.toJson());

class User {
  int? id;
  String? name;
  String? email;
  String? password;
  String? gender;
  String? typeofcar;
  int? number;
  String? image;
  String? address;

  //Constructor
  User({
    this.id ,
    this.name ,
    this.email,
    this.password,
    this.gender,
    this.typeofcar,
    this.number,
    this.image,
    this.address,
  });

  //function to shift from json to object
  factory User.fromJson(Map<dynamic , dynamic> userJson) =>
      User(
          id: userJson['id'],
          name: userJson['name'],
          email: userJson['email'],
          password: userJson['password'],
          gender: userJson['gender'],
          typeofcar: userJson['typeofcar'],
          number: userJson['number'],
          image: userJson['image'],
          address: userJson['address'],
      );
}//end class User