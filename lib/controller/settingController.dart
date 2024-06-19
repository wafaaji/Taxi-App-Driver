import 'package:driver/screens/loginScreen.dart';
import 'package:driver/screens/splashScreen.dart';
import 'package:driver/services/activateServices.dart';
import 'package:driver/services/authServices.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get_storage/get_storage.dart';
import 'package:get/get.dart';

class settingController extends GetxController {

  var isLoading = false.obs;

  final  storage = const FlutterSecureStorage();


  // a variable to On Off Switch in flutter
  var isSwitcheded = false;
  var themeModeSwitched = false;

  // instance of GetStorage, to store data in key value pair.
  final switchdatacontroller = GetStorage();

  settingController() {
    print("Constructor called");
    // when user re-visit app, we check previous state of app weather it was on or off.
    if (switchdatacontroller.read('getXIsSwitched') != null ) {
      isSwitcheded = switchdatacontroller.read('getXIsSwitched');
      update();}

     if (switchdatacontroller.read('getXThemeIsSwitched') != null) {
        themeModeSwitched = switchdatacontroller.read('getXThemeIsSwitched');
        update();
      }
  }

  // called when user click on switch to on/off it
    changeSwitchState(bool value) async {
      try {
        isSwitcheded = value;

        print('bbbbb');
        await ActivateServices.activate();

        // store data in getstorage true or false
        //here in key 'getXIsSwitched' we store bool type either true or else
        // if true then switch is ON else OFF
        switchdatacontroller.write('getXIsSwitched', isSwitcheded);
        update();
      }catch(e){
          print('ccccc');
          Get.snackbar(
              'Warning',
              e.toString(),
              snackPosition: SnackPosition.BOTTOM
          );
     }
    }

  // called when user click on switch to on/off it
  changeSwitchThemeState(bool value) async {
    themeModeSwitched = value;

    // store data in getstorage true or false
    //here in key 'getXIsSwitched' we store bool type either true or else
    // if true then switch is ON else OFF
    switchdatacontroller.write('getXThemeIsSwitched', themeModeSwitched);
    update();
  }

  doLogout() async{
    if (!isLoading.value) {
      isLoading(true);
      try {
        print('bbbbb');
        await AuthServices.logout();
          Get.snackbar(
            'Logout',
            'Logout successfully',
            snackPosition: SnackPosition.BOTTOM,
          );

          await storage.deleteAll();
        Get.off(() => loginScreen());
      } catch (e) {
        print('ccccc');
        Get.snackbar(
            'Warning',
            e.toString(),
            snackPosition: SnackPosition.BOTTOM
        );
      } finally {
        isLoading(false);
      }
    }
  }//end doLogout

}//end class settingController