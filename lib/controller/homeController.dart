import 'package:get/get.dart';

class homeController extends GetxController {

  var tabIndex = 0;

  void changeTabIndex (index) {
    tabIndex = index ;
    update();
  }

}