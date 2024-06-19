import 'package:driver/controller/splashController.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class splashScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery
        .of(context)
        .size
        .height;
    var width = MediaQuery
        .of(context)
        .size
        .height;

    return Scaffold(
      body: Center(
        child: GetBuilder <splashController>(
          init: splashController(),
          builder: (controller) =>Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                child: Column(
                  children: [
                    Text(
                      ' W A S I L N I ',
                      style: TextStyle(
                        fontSize: 30.0,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFFFDC80D),
                      ),
                    ),
                    SizedBox(
                      height: 5.0,
                    ),
                    Text(
                      'Taxi Application',
                      style: TextStyle(
                        fontSize: 20.0,
                        fontWeight: FontWeight.normal,
                        color: Colors.grey,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 20.0,
              ),
              Container(
                  child:CircularProgressIndicator(
                    color: Color(0xFFFDC80D),
                  ),
              ),
            ],
        ),
          ),
        ),
    );
  }
}
