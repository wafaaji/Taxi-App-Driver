import 'dart:ui';
import 'package:driver/controller/loginController.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/rendering.dart';
import 'package:get/get.dart';

class loginScreen extends GetView<loginController> {

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
              height: height * 0.12,
              width: width,
              color: Color(0xFFFDC80D),
            ),
            Container(
              height: height * 0.88,
              width: width,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(topRight: Radius.circular(25.0,),topLeft: Radius.circular(25.0,)),
                color: Colors.white,
              ),
              child:Form(
                  key: controller.loginFormKey,
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  child: Column(
                      children: [
                        SizedBox(
                          height: 20.0,
                        ),
                        Text(
                          'LOGIN',
                          style: TextStyle(
                            fontSize: 35.0,
                            fontWeight: FontWeight.bold,
                            color: Color(0xFFFDC80D),
                          ),
                        ),
                        SizedBox(
                          height: 20.0,),
                        Text(
                          'Lets login to your account',
                          style: TextStyle(
                            fontSize: 20.0,
                            fontWeight: FontWeight.bold,
                            color: Colors.black.withAlpha(40),
                          ),
                        ),
                        SizedBox(
                          height: 40.0,
                        ),
                        Container(
                          width: 250.0,
                          height: 50.0,
                          child: TextFormField(
                            cursorColor: Color(0xFFFDC80D),
                            controller: controller.emailController,
                            keyboardType: TextInputType.emailAddress,
                            textInputAction: TextInputAction.next,
                            onSaved: (value){
                              controller.email = value!;
                            },
                            validator: (value) {
                              return controller.validateEmail(value!);
                            },
                            decoration: InputDecoration(
                              hintText: 'Email Address',
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
                          height: 20.0,
                        ),
                        Container(
                          width: 250.0,
                          height: 50.0,
                          child: Obx(()=> TextFormField(
                            cursorColor: Color(0xFFFDC80D),
                            controller: controller.passwordController,
                            keyboardType: TextInputType.visiblePassword,
                            obscureText: controller.isPassword.value,
                            onSaved: (value){
                              controller.password = value!;
                            },
                            validator: (value) {
                              return controller.validatePassword(value!);
                            },
                            decoration: InputDecoration(
                              hintText: 'Password',
                              suffixIcon: IconButton(
                                icon: Icon(
                                  controller.isPassword.value
                                      ? Icons.visibility
                                      : Icons.visibility_off,
                                  color:Color(0xFFFDC80D),
                                ),
                                onPressed: () {
                                  controller.changePassword();
                                },
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(20.0),
                                borderSide: BorderSide(
                                  color:Color(0xFFFDC80D),
                                ),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(20.0),
                                borderSide: BorderSide(
                                  color:Color(0xFFFDC80D),
                                ),
                              ),
                            ),
                          ),
                          ),
                        ),
                        SizedBox(
                          height: 90.0,
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
                          height: 10.0,
                        ),
                        Container(
                          width: 150.0,
                          height: 50.0,
                          decoration: BoxDecoration(
                              color: Color(0xFFFDC80D),
                              borderRadius: BorderRadius.circular(40.0)
                          ),
                          child: MaterialButton(
                            onPressed: () {
                              controller.checkLogin();
                            },
                            child: Text(
                              'LOGIN',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 17.0,
                                fontWeight: FontWeight.bold,),
                            ),
                          ),
                        ),
                      ]
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}