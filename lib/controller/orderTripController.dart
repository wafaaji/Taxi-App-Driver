import 'package:driver/model/acceptModel.dart';
import 'package:driver/model/refusalModel.dart';
import 'package:driver/screens/Pages/settingScreen.dart';
import 'package:driver/screens/homeScreen.dart';
import 'package:driver/services/orderTripServices.dart';
import 'package:get/get.dart';

class OrderTripController extends GetxController{

  var isLoading = false.obs;

  var trip_id = 10;

  void doAccept() async{
    if (!isLoading.value){

      isLoading(true);
      AcceptModel accept = AcceptModel(
        trip_id: trip_id.toString(),
      );
      try{
        print('bbbb');
        await OrderTripServices.accept(accept);
        Get.snackbar(
        'Accept',
        'Your accept the order',
        snackPosition: SnackPosition.BOTTOM,);
        Get.off( ()=> settingScreen());
      }catch(e) {
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
  }//end doAccept

  doRefusal() async{
    if (!isLoading.value){
      isLoading(true);
      RefusalModel refusal = RefusalModel(
        trip_id: trip_id.toString(),
      );
      try{
        print('aaaa');
        await OrderTripServices.refusal(refusal);
          Get.snackbar(
            'Refusal',
            'Your refusal the order',
            snackPosition: SnackPosition.BOTTOM,
          );
        Get.off( ()=> settingScreen());
      }catch(e) {
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
  }//end doRefusal

}//end class OrderTripController