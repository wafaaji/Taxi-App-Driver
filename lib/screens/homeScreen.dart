import 'package:driver/controller/homeController.dart';
import 'package:driver/controller/profileController.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'Pages/mapScreen.dart';
import 'Pages/profileScreen.dart';
import 'Pages/settingScreen.dart';
import 'package:get/get.dart';


class homeScreen extends StatelessWidget{

 // ProfileController profileController = Get.put(ProfileController());



  //ProfileController profileController = Get.put(ProfileController());


  List<Widget>pages =[
    mapScreen(),
    profileScreen(),
    settingScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return GetBuilder <homeController>(
        init: homeController(),
    builder: (controller) =>Scaffold(
      body: Stack(
        children: [
          pages.elementAt(controller.tabIndex),
          Padding(
            padding: EdgeInsets.all (30.0),
                child: Align(
                alignment: Alignment(0.0 , 1.0),
                child: ClipRRect(
                  borderRadius: BorderRadius.all(
                    Radius.circular(30.0),
                  ),
                  child: BottomNavigationBar(
                    selectedItemColor: Colors.grey,
                    unselectedItemColor: Colors.white,
                    showSelectedLabels: true,
                    showUnselectedLabels: false,
                    backgroundColor: Color(0xFFFDC80D),
                    currentIndex: controller.tabIndex,
                    onTap: (index) {
                      controller.changeTabIndex(index);
                    },
                    items: [
                      BottomNavigationBarItem(label: 'map' ,icon: Icon(Icons.add_location_sharp),),
                      BottomNavigationBarItem(label: 'profile',icon: Icon(Icons.person),),
                      BottomNavigationBarItem(label: 'settings',icon: Icon(Icons.settings),),
                    ],
                  ),
                ),
            ),
          ),
        ],
      ),
    ),
    );
  }
}
