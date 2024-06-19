import 'package:driver/model/pincodeModel.dart';
import 'package:driver/screens/homeScreen.dart';
import 'package:driver/screens/loginScreen.dart';
import 'package:driver/services/pincodeServices.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class pincodeController extends GetxController {

  var isLoading = false.obs;

  var pincodeFormKey = GlobalKey<FormState>();
  late  TextEditingController pinOneController ;
  late TextEditingController pinTwoController;
  late TextEditingController pinThreeController;
  late TextEditingController pinFourController ;
  late int pinOne , pinTwo, pinThree ,pinFour;


  @override
  void onInit(){
    pinOneController = TextEditingController();
    pinTwoController = TextEditingController();
    pinThreeController = TextEditingController();
    pinFourController = TextEditingController();

    super.onInit() ;
  }

  @override
  void onReady(){
    super.onReady();
  }

  @override
  void onClose(){
    super.onClose();

    pinOneController.dispose();
    pinTwoController.dispose();
    pinThreeController.dispose();
    pinFourController.dispose();
  }

  String? validateNumber (String value)
  {
    if (!GetUtils.isNum(value))
    {
      return 'Please enter Your PIN Code';
    }
    return null;
  }

  void checkPincode() async {
    bool isValid = pincodeFormKey.currentState!.validate();

    if (!isLoading.value) {
      //isValid = true
      if (isValid) {
        isLoading(true);
        PincodeModel pincode =  PincodeModel(
          code: pinOneController.text+pinTwoController.text+pinThreeController.text+pinFourController.text,
        );
        try{
          print('bbbb');
          await PincodeServices.pincode(pincode);
            Get.snackbar(
              'PIN',
              'PIN successfully',
              snackPosition: SnackPosition.BOTTOM,
            );
          pincodeFormKey.currentState!.save();
          Get.off(()=> homeScreen());
        } catch(e){
          print('ccccc');
          Get.snackbar(
              'Warning',
              e.toString(),
              snackPosition: SnackPosition.BOTTOM
          );
        }finally{
          isLoading(false);
        }
      }
    }
  }
}