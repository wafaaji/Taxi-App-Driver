import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:awesome_notifications/awesome_notifications.dart';

class notificationsController extends GetxController {

  static void initializeNotificationService(){

    AwesomeNotifications().initialize(
    null, [
      NotificationChannel(
          channelKey: 'basic_channel_key',
          channelName: 'Basic Channel',
          channelDescription: 'used to send main notifications to our users',
          channelShowBadge: true,
          defaultColor: Colors.black,
          enableLights: true,
          enableVibration: true,
          importance: NotificationImportance.Max,
       )
     ]
    );
  }

  //method for create notifications
  Future<void> createBasicNotification() async{
    
    AwesomeNotifications().createNotification(
        content: NotificationContent(
            id: 0,
            channelKey: 'basic_channel_key',
            title: 'simple notificationd',
            body: 'simple bode',
        )
    );
  }


  @override
  void onInit() {
    super.onInit();

    //Request pirmission to show notifications
    AwesomeNotifications().isNotificationAllowed().then ( (isAllowed) {
      if (!isAllowed) {
        AwesomeNotifications().requestPermissionToSendNotifications();
      }
    }
    );

    //Listen to different actions
    AwesomeNotifications()
        .actionStream
        .listen((ReceivedNotification receivedNotification) {
      //we can do stuff like route to a different screen
    });

    AwesomeNotifications()
        .createdStream
        .listen((ReceivedNotification receivedNotification) {
          //we will display a snackbar
      Get.snackbar(
        'notifications',
        'you ger order ${receivedNotification.channelKey}'
       );
    });

  }

  @override
  void onClose() {
    super.onClose();

    //Close stream
    AwesomeNotifications().actionSink.close();
    AwesomeNotifications().createdSink.close();
  }

}