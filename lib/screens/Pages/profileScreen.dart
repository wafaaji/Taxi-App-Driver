import 'dart:ui';
import 'package:driver/controller/editProfileController.dart';
import 'package:driver/controller/editProfileController.dart';
import 'package:driver/controller/editProfileController.dart';
import 'package:driver/controller/profileController.dart';
import 'package:driver/model/profileModel.dart';
import 'package:driver/screens/editProfileScreen.dart';
import 'package:driver/services/profileServices.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get/get.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class profileScreen extends GetView<ProfileController> {

  //editProfileController editProfileController = Get.put(editProfileController());

  final  storage = const FlutterSecureStorage();

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: FutureBuilder<ProfileModel>(
        future: ProfileServices.profile(),
        builder: (context , snapshot){
          if(snapshot.hasData){
            return SingleChildScrollView(
              child:  Column(
                  children: [
                    SizedBox(
                      height: 10.0,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        IconButton(
                          onPressed: () {
                            Get.to(editProfileScreen());
                          },
                          icon: Icon(
                            Icons.edit,
                            size: 30.0,
                            color: Color(0xFFFDC80D),
                          ),
                        ),
                      ],
                    ),
                    Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Stack(
                            children: [
                              CircleAvatar(
                                backgroundImage:AssetImage('assets/logo.jpg'),
                                radius: 60.0,
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 10.0,
                          ),
                          Text(
                            //data['name'],
                            '${snapshot.data!.name}',
                            style: TextStyle(
                              fontSize: 20.0,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(
                            height: 10.0,
                          ),
                          RatingBarIndicator(
                              rating: snapshot.data!.rating!.toDouble(),
                              itemCount: 5,
                              itemSize: 30,
                              itemBuilder: (context , index){
                                return Icon(
                                  Icons.star,
                                  color: Colors.amber,
                                );
                              }),
                        ]
                    ),
                    SizedBox(
                      height: 30.0,
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 20.0),
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Icon(
                                Icons.phone,
                                size: 30.0,
                              ),
                              SizedBox(
                                width: 20.0,
                              ),
                              Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    //data['number'],
                                    '${snapshot.data!.number}',
                                    style: TextStyle(
                                        fontSize: 15.0,
                                        fontWeight: FontWeight.bold
                                    ),
                                  ),
                                  SizedBox(
                                    height: 5.0,
                                  ),
                                  Text(
                                    'Phone number',
                                    style: TextStyle(
                                      fontSize: 15.0,
                                      fontWeight: FontWeight.normal,
                                      color: Colors.grey,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                          Divider(
                            color: Colors.grey,
                          ),
                          SizedBox(
                            height: 15.0,
                          ),
                          Row(
                            children: [
                              Icon(
                                Icons.person,
                                size: 30.0,
                              ),
                              SizedBox(
                                width: 20.0,
                              ),
                              Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    // data['gender'],
                                    '${snapshot.data!.gender}',
                                    style: TextStyle(
                                        fontSize: 15.0,
                                        fontWeight: FontWeight.bold
                                    ),
                                  ),
                                  SizedBox(
                                    height: 5.0,
                                  ),
                                  Text(
                                    'Gender',
                                    style: TextStyle(
                                      fontSize: 15.0,
                                      fontWeight: FontWeight.normal,
                                      color: Colors.grey,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                          Divider(
                            color: Colors.grey,
                          ),
                          SizedBox(
                            height: 15.0,
                          ),
                          Row(
                            children: [
                              Icon(
                                Icons.car_repair,
                                size: 30.0,
                              ),
                              SizedBox(
                                width: 20.0,
                              ),
                              Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    //data['typeofcar'],
                                    '${snapshot.data!.typeofcar}',
                                    style: TextStyle(
                                        fontSize: 15.0,
                                        fontWeight: FontWeight.bold
                                    ),
                                  ),
                                  SizedBox(
                                    height: 5.0,
                                  ),
                                  Text(
                                    'Vehicle type',
                                    style: TextStyle(
                                      fontSize: 15.0,
                                      fontWeight: FontWeight.normal,
                                      color: Colors.grey,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                          Divider(
                            color: Colors.grey,
                          ),
                        ],
                      ),
                    ),
                  ]
              ),
            );
          }else if(snapshot.hasError){
            return Center(
                child:Text('${snapshot.error}'),
            );
          }
          return Center(
              child: CircularProgressIndicator(
                color: Color(0xFFFDC80D),
              ),
          );
        },
      ),
    );
  }


}

