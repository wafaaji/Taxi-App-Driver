import 'dart:io';
import 'package:driver/controller/editProfileController.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

import 'Pages/profileScreen.dart';

class editProfileScreen extends GetView<editProfileController> {



  File? picketFile ;
  ImagePicker imagePicker = ImagePicker();

  @override
  Widget build(BuildContext context) {

    var height = MediaQuery
        .of(context)
        .size
        .height;
    var width = MediaQuery
        .of(context)
        .size
        .height;

    return Scaffold(
      backgroundColor: Color(0xFFFDC80D),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              width: width,
              height: height*0.10,
              color: Color(0xFFFDC80D),
            ),
            Container(
              height: height*1 ,
              width: width,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(topRight: Radius.circular(25.0,),topLeft: Radius.circular(25.0,)),
                color: Colors.white,
              ),
              child:SingleChildScrollView(
                 child:  Form(
                   key: controller.editProfileFormKey,
                   child:Column(
                   children: [
                     Row(
                       mainAxisAlignment: MainAxisAlignment.center,
                       children: [
                         Stack(
                             children : [
                               Row(
                                   mainAxisAlignment: MainAxisAlignment.center,
                                   children: [
                                     Stack(
                                       children: [
                                         Obx(() => CircleAvatar(
                                           backgroundImage: controller.isProfilePicPathSet.value == true
                                               ? FileImage(File(controller.profilePicPath.value)) as ImageProvider
                                               : AssetImage('assets/logo.jpg'),
                                           radius: 60.0,
                                         ),
                                         ),
                                         Positioned(
                                           bottom: 0,
                                           left: 80,
                                           child: InkWell(
                                             child: Container(
                                               width: 40.0,
                                               height: 40.0,
                                               decoration: BoxDecoration(
                                                 borderRadius: BorderRadius.circular(100.0),
                                                 color: Colors.white,
                                               ),
                                               child:Icon(Icons.local_see,
                                                 color: Colors.grey,
                                               ),
                                             ),
                                             onTap: (){
                                               // showModalBottomSheet(
                                               //     context: context,
                                               //     builder: (context) => bottomSheet(context));
                                             },
                                           ),
                                         ),
                                       ],
                                     ),
                                   ]
                               ),
                             ]
                         ),
                       ],
                     ),
                     SizedBox(
                    height: 20.0,
                  ),
                     Container(
                    width: width*0.50,
                    height: 50.0,
                    child: TextFormField(
                      cursorColor: Color(0xFFFDC80D),
                      controller: controller.nameController,
                      //onSaved: (value){
                        //controller.name = value!;
                      //},
                      decoration: InputDecoration(
                        hintText: 'Name',
                        prefixIcon: Icon(
                          Icons.person,
                          color: Color(0xFFFDC80D),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20.0),
                          borderSide: BorderSide(
                            color: Color(0xFFFDC80D),
                          ),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20.0),
                          borderSide: BorderSide(
                            color: Color(0xFFFDC80D),
                          ),
                        ),
                      ),
                    ),
                  ),
                     SizedBox(
                    height: 10.0,
                  ),
                     Container(
                    width: width*0.50,
                    height: 50.0,
                    child: TextFormField(
                      cursorColor: Color(0xFFFDC80D),
                      controller: controller.numberController,
                      //onSaved: (value){
                        //controller.number = value!;
                      //},
                      decoration: InputDecoration(
                        hintText: 'Phone number',
                        prefixIcon: Icon(
                          Icons.phone,
                          color: Color(0xFFFDC80D),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20.0),
                          borderSide: BorderSide(
                            color: Color(0xFFFDC80D),
                          ),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20.0),
                          borderSide: BorderSide(
                            color: Color(0xFFFDC80D),
                          ),
                        ),
                      ),
                    ),
                  ),
                     SizedBox(
                       height: 10.0,
                     ),
                     Container(
                       width: width*0.50,
                       height: 50.0,
                       child: TextFormField(
                         cursorColor: Color(0xFFFDC80D),
                         controller: controller.typeCarController,
                         //onSaved: (value){
                           //controller.typeofcar = value!;
                         //},
                         decoration: InputDecoration(
                           hintText: 'Type of Car',
                           prefixIcon: Icon(
                             Icons.car_repair,
                             color: Color(0xFFFDC80D),
                           ),
                           enabledBorder: OutlineInputBorder(
                             borderRadius: BorderRadius.circular(20.0),
                             borderSide: BorderSide(
                               color: Color(0xFFFDC80D),
                             ),
                           ),
                           focusedBorder: OutlineInputBorder(
                             borderRadius: BorderRadius.circular(20.0),
                             borderSide: BorderSide(
                               color: Color(0xFFFDC80D),
                             ),
                           ),
                         ),
                       ),
                     ),
                     SizedBox(
                    height: 10.0,
                  ),
                     Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Obx( ()=> DropdownButton(
                          hint: Text(
                            'Gender',
                          ),
                          onChanged: (newValue) {
                            controller.setSelectedGender(newValue as String);
                          },
                          value: controller.selectGender.value,
                          items: controller.items.map((selectedType) {
                            return DropdownMenuItem(
                              child: new Text(
                                selectedType,
                              ),
                              value: selectedType,
                            );
                          }).toList(),
                        ),
                      ),
                    ],
                  ),
                     SizedBox(
                    height: 5.0,
                  ),
                     Obx(() => controller.isLoading.value ==true?
                  Center(
                    child: CircularProgressIndicator(
                      color: Color(0xFFFDC80D),
                    ),
                  ):
                  Text(''),
                  ),
                     SizedBox(
                    height: 5.0,
                  ),
                     Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        width: 150.0,
                        height: 50.0,
                        decoration: BoxDecoration(
                            color: Color(0xFFFDC80D),
                            borderRadius: BorderRadius.circular(40.0)
                        ),
                        child: MaterialButton(
                          onPressed: () {
                            controller.doEdit();
                          },
                          child: Text(
                            'Save Change',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 17.0,
                              fontWeight: FontWeight.bold,),
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 10.0,
                      ),
                      Container(
                        width: 150.0,
                        height: 50.0,
                        decoration: BoxDecoration(
                          color: Colors.white,
                            borderRadius: BorderRadius.circular(40.0)
                        ),
                        child: TextButton(
                          onPressed: () {
                            Get.to(()=>profileScreen());
                          },
                          child: Text(
                            'Cancle',
                            style: TextStyle(
                              fontSize: 18.0,
                              color: Color(0xFFFDC80D),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                     SizedBox(
                       height: 70.0,
                     ),
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

  Widget bottomSheet(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      width: double.infinity,
      height:size.height * 0.2,
      margin: EdgeInsets.symmetric(
        vertical: 20.0,
        horizontal: 10.0,
      ),
      child: Column(
        children: [
          Text(
            'Choose Profile Picture',
            style: TextStyle(
              fontSize: 20.0,
              fontWeight: FontWeight.bold,
              color: Colors.grey,
            ),
          ),
          SizedBox(
            height: 20.0,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              InkWell(
                child:Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.image ,
                      color:  Color(0xFFFDC80D),
                    ),
                    SizedBox(
                      height: 5.0,
                    ),
                    Text(
                      'Gallery',
                      style: TextStyle(
                        fontSize: 15.0,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFFFDC80D),
                      ),
                    ),
                  ],
                ),
                onTap: (){
                  GetImage(ImageSource.gallery);
                },
              ),
              SizedBox(
                width: 70.0,
              ),
              InkWell(
                  child:Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.camera ,
                        color:  Color(0xFFFDC80D),
                      ),
                      SizedBox(
                        height: 5.0,
                      ),
                      Text(
                        'Camera',
                        style: TextStyle(
                          fontSize: 15.0,
                          fontWeight: FontWeight.bold,
                          color: Color(0xFFFDC80D),
                        ),
                      ),
                    ],
                  ),
                  onTap:(){
                    GetImage(ImageSource.camera);
                  }
              ),
            ],
          ),
        ],
      ),
    );
  }

  Future<void> GetImage (ImageSource imageSource) async {
    final pickedImage =
    await imagePicker.pickImage (source:imageSource , imageQuality:100);

    picketFile = File(pickedImage!.path);

    controller.setProfileImagePath(picketFile!.path);

    Get.back();
  }

}
