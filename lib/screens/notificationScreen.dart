import 'package:driver/controller/notificationsController.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';


class notificationScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:  Center(
        child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          MaterialButton(
            onPressed: () {
              Get.find<notificationsController>().createBasicNotification();
            },
            child: Text(
                'simple Notificatioj'
            ),
          ),
          SizedBox(
            height: 10.0,
          ),
          MaterialButton(
            onPressed: () {  },
            child: Text(
                'sushuled Notificatioj'
            ),
          ),
          SizedBox(
            height: 10.0,
          ),
          MaterialButton(
            onPressed: () {  },
            child: Text(
                'remove Notificatioj'
            ),
          ),
          SizedBox(
            height: 10.0,
          ),
        ],
      ),
      ),
    );
  }
}
