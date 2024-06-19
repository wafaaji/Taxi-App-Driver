import 'package:driver/model/editProfileModel.dart';
import 'package:driver/screens/Pages/profileScreen.dart';
import 'package:driver/screens/homeScreen.dart';
import 'package:driver/services/editProfileServices.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class editProfileController extends GetxController {

  late TextEditingController nameController ,numberController ,typeCarController;
  //var name ;
  //var number;
  //var typeofcar;
  var isLoading = false.obs;
  final editProfileFormKey = GlobalKey<FormState>();

  // It is mandatory initialize with one value from listType
  final selectGender = "male".obs;

  List items= ['male' , 'female'];

  void setSelectedGender(String value){
    selectGender.value = value;
  }

  var isProfilePicPathSet = false.obs;
  var profilePicPath = ''.obs;


  @override
  void onInit(){
    nameController = TextEditingController();
    numberController = TextEditingController();
    typeCarController = TextEditingController();

    super.onInit() ;
  }

  @override
  void onReady(){
    super.onReady();
  }

  @override
  void onClose(){
    super.onClose();

    nameController.dispose();
    numberController.dispose();
    typeCarController.dispose();
  }


  void setProfileImagePath(String path) {
    profilePicPath.value = path ;
    isProfilePicPathSet.value = true ;
  }


  void doEdit() async {
    if (!isLoading.value) {

        isLoading(true);
        EditProfileModel editProfile = EditProfileModel(
          name: nameController.text,
          number: numberController.text,
          gender: selectGender.toString(),
          typeofcar: typeCarController.text,
          image: profilePicPath.toString(),
        );
        try {
          print('bbbbb');
          await EditProfileServices.editProfile(editProfile);
            Get.snackbar(
              'Edit Profile',
              'Edit Profile successfully',
              snackPosition: SnackPosition.BOTTOM,
            );
          Get.to(() => homeScreen());
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
    }

}//end class editProfileController