import 'package:driver/screens/Pages/mapScreen.dart';
import 'package:driver/screens/Pages/profileScreen.dart';
import 'package:driver/screens/Pages/settingScreen.dart';
import 'package:driver/screens/editProfileScreen.dart';
import 'package:driver/screens/homeScreen.dart';
import 'package:driver/screens/loginScreen.dart';
import 'package:driver/screens/orderTripScreen.dart';
import 'package:driver/screens/pincodeScreen.dart';
import 'package:driver/screens/splashScreen.dart';
import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'bindings/allBindings.dart';
import 'package:get_storage/get_storage.dart';

void main() async{
  //WidgetsFlutterBinding.ensureInitialized();
  //notificationsController.initializeNotificationService();

  await GetStorage.init();
  runApp( MyApp());
}

class MyApp extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      initialBinding: allBindigs(),
      debugShowCheckedModeBanner: false,
      home: splashScreen(),
    );
  }


}
