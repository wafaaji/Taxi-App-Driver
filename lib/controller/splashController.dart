import 'package:driver/screens/homeScreen.dart';
import 'package:driver/screens/loginScreen.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get/get.dart';

class splashController extends GetxController {

  static final  storage = FlutterSecureStorage();

  String token = '';

  @override
  void onInit() {
    authData();
    Future.delayed(Duration(seconds: 5),(){
      if (isAuth()) {
        Get.off(() => homeScreen());
      } else {
        Get.off(() => loginScreen());
      }
    });
    super.onInit();
  }

  authData() async{
    token = (await storage.read(key: 'token'))!;
  }

  bool isAuth() {
    return token.isNotEmpty;
  }

}//end class splashController