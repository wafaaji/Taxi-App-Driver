import 'package:driver/model/loginModel.dart';
import 'package:driver/screens/pincodeScreen.dart';
import 'package:driver/services/authServices.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get/get.dart';

class loginController extends GetxController {

  var isLoading = false.obs;

  final  storage = const FlutterSecureStorage();

  final loginFormKey = GlobalKey<FormState>();
  late TextEditingController emailController , passwordController;
  var email = '';
  var password = '';
  RxBool isPassword = true.obs;

  @override
  void onInit(){
    emailController = TextEditingController();
    passwordController = TextEditingController();

    super.onInit() ;
  }

  @override
  void onReady(){
    super.onReady();
  }

  @override
  void onClose(){
    super.onClose();

    emailController.dispose();
    passwordController.dispose();
  }

  String? validateEmail (String value)
  {
    if (!GetUtils.isEmail(value))
    {
      return 'Please provide valid Email';
    }
    return null;
  }

  String? validatePassword (String value)
  {
    if (value.length < 8)
    {
      return 'Password must be of 8 characters';
    }
    return null;
  }

  void checkLogin() async {
    bool isValid = loginFormKey.currentState!.validate();

    if (!isLoading.value) {
      //isValid = true
      if (isValid) {
        isLoading(true);
        LoginModel login =  LoginModel(
          email: emailController.text,
          password: passwordController.text,
        );
        try{
          print('bbbbb');
          await AuthServices.login(login).then((value) async {
            Get.snackbar(
              'Login',
              'Login successfully',
              snackPosition: SnackPosition.BOTTOM,
            );
            print(value.token);
            print(value.user!.id);
            await storage.write(key: 'token', value: value.token);
            await storage.write(key: 'id', value: value.user!.id.toString());
            loginFormKey.currentState!.save();
          });
          Get.off(()=> pincodeScreen());
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


  void changePassword (){
    isPassword.value = !isPassword.value;
    update();
  }

}//end class loginController