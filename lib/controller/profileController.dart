import 'package:driver/services/profileServices.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get/get.dart';

class ProfileController extends GetxController with StateMixin<dynamic>{

  final  storage = const FlutterSecureStorage();


  @override
  void onInit() {
    super.onInit();
    ProfileServices.profile().then((value) async{
      change(value, status: RxStatus.success());
      await storage.write(key: 'image', value: value.image);

    },onError: (error){
      change(null,status: RxStatus.error(error.toString()));
    });
  }


}