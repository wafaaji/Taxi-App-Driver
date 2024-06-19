import 'package:driver/controller/editProfileController.dart';
import 'package:driver/controller/loginController.dart';
import 'package:driver/controller/map1Controller.dart';
import 'package:driver/controller/notificationsController.dart';
import 'package:driver/controller/orderTripController.dart';
import 'package:driver/controller/pincodeController.dart';
import 'package:driver/controller/profileController.dart';
import 'package:driver/controller/settingController.dart';
import 'package:get/get.dart';

class allBindigs extends Bindings {

  @override
  void dependencies() {

    Get.lazyPut(() => loginController());
    Get.lazyPut(() => pincodeController());
    Get.lazyPut(() => editProfileController());
    Get.lazyPut(() => ProfileController());
    Get.lazyPut(() => settingController());
    Get.lazyPut(() => notificationsController());
    Get.lazyPut(() => OrderTripController());
    Get.lazyPut(() => map1Controller());
  }
}