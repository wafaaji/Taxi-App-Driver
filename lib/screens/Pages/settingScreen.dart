import 'dart:ui';
import 'package:driver/controller/settingController.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../orderTripScreen.dart';

class settingScreen extends StatelessWidget {

  final settingController controller = Get.put(settingController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          SizedBox(
            height: 50.0,
          ),
          Padding(
            padding : (
              EdgeInsets.only(left: 10.0)
            ),
            child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Activate',
                style: TextStyle(
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFFFDC80D),
                ),
              ),
              GetBuilder<settingController>(
                builder: (_) => Switch(
                activeColor: Color(0xFFFDC80D),
                  value: controller.isSwitcheded,
                  onChanged: (value){
                    controller.changeSwitchState(value);
                  }
                  ),
              ),
            ],
          ),
          ),
          Divider(),
          SizedBox(
            height: 20.0,
          ),
          MaterialButton(
            onPressed: () {
              Get.to(()=> orderTripScreen());
            },
            child: Row(
              children: [
                Text(
                  'Notification',
                  style: TextStyle(
                    fontSize: 20.0,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFFFDC80D),
                  ),
                ),
                SizedBox(
                  width: 100.0,
                ),
              ],
            ),
          ),
          Divider(),
          SizedBox(
            height: 20.0,
          ),
          MaterialButton(
            onPressed: () {
              controller.doLogout();
            },
            child: Row(
              children: [
                Icon(
                  Icons.logout,
                  size: 25.0,
                  color: Color(0xFFFDC80D),
                ),
                SizedBox(
                  width: 10.0,
                ),
                Text(
                  'Logout',
                  style: TextStyle(
                    fontSize: 20.0,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFFFDC80D),
                  ),
                ),
                SizedBox(
                  width: 100.0,
                ),
                Obx(() => controller.isLoading.value ==true?
                Center(
                  child: CircularProgressIndicator(
                    color: Color(0xFFFDC80D),
                  ),
                ):
                Text(''),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}


