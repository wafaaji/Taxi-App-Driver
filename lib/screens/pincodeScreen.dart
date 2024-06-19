import 'package:driver/controller/pincodeController.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:get/get.dart';

class pincodeScreen extends GetView<pincodeController> {


  List<String> currentPin = ['','','',''];

  var outLineInputBorder = OutlineInputBorder(
    borderRadius: BorderRadius.circular(10.0),
    borderSide:  BorderSide(color: Colors.transparent),
  );

  int pinIndex = 0;


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
                height: height*0.15,
                width: width,
                color: Color(0xFFFDC80D),
              ),
              Container(
                height: height * 0.85,
                width: width,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                      topRight: Radius.circular(25.0,),
                      topLeft: Radius.circular(25.0,)),
                  color: Colors.white,
                ),
                child: SingleChildScrollView(
                  child: Form(
                    key: controller.pincodeFormKey,
                    child: Column(
                        children: [
                          SizedBox(
                            height: 20.0,
                          ),
                          Text(
                            'PIN CODE',
                            style: TextStyle(
                              fontSize: 35.0,
                              fontWeight: FontWeight.bold,
                              color:  Color(0xFFFDC80D),
                            ),
                          ),
                          SizedBox(
                            height: 20.0,),
                          Text(
                            'Enter 4 digits verification code \n send to your email',
                            style: TextStyle(
                              fontSize: 20.0,
                              fontWeight: FontWeight.bold,
                              color: Colors.black.withAlpha(40),
                            ),
                          ),
                          SizedBox(
                            height: 5.0,
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 30.0),
                            child: Container(
                              padding: EdgeInsets.symmetric(horizontal: 60.0,),
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  buildPinRow(),
                                ],
                              ),
                            ),
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
                            height: 10.0,
                          ),
                          Container(
                            width: 280.0,
                            decoration: BoxDecoration(
                              color: Colors.white54,
                              borderRadius: BorderRadius.circular(30.0),
                            ),
                            child: buildNumberPad(),
                          ),
                        ]
                    ),
                  ),
                ),
              ),
            ]
        ),
      ),
    );
  }

  buildNumberPad(){
    return GetBuilder <pincodeController>(
        builder: (controller) =>Column(
        children : [
          Container(
        alignment: Alignment.center,
        child: Padding(
          padding: EdgeInsets.only(bottom: 32.0,top: 5.0,),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  keybordNumber(
                    n:1,
                    onPressed : (){
                      pinIndexSetup ('1');
                    },
                  ),
                  keybordNumber(
                    n:2,
                    onPressed : (){
                      pinIndexSetup ('2');
                    },
                  ),
                  keybordNumber(
                    n:3,
                    onPressed : (){
                      pinIndexSetup ('3');
                    },
                  ),
                ],
              ),
              SizedBox(
                height: 5.0,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  keybordNumber(
                    n:4,
                    onPressed : (){
                      pinIndexSetup ('4');
                    },
                  ),
                  keybordNumber(
                    n:5,
                    onPressed : (){
                      pinIndexSetup ('5');
                    },
                  ),
                  keybordNumber(
                    n:6,
                    onPressed : (){
                      pinIndexSetup ('6');
                    },
                  ),
                ],
              ),
              SizedBox(
                height: 5.0,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  keybordNumber(
                    n:7,
                    onPressed : (){
                      pinIndexSetup ('7');
                    },
                  ),
                  keybordNumber(
                    n:8,
                    onPressed : (){
                      pinIndexSetup ('8');
                    },
                  ),
                  keybordNumber(
                    n:9,
                    onPressed : (){
                      pinIndexSetup ('9');
                    },
                  ),
                ],
              ),
              SizedBox(
                height: 5.0,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Container(
                    width: 50.0,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                    ),
                    child: MaterialButton(
                      height: 50.0,
                      onPressed: (){
                        clearPin();
                      } ,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(60.0)
                      ),
                      child:Icon(Icons.backspace_outlined , size: 25, color: Colors.grey,),
                    ),
                  ),
                  keybordNumber(
                    n:0,
                    onPressed : (){
                      pinIndexSetup ('0');
                    },
                  ),
                  Container(
                    width: 50.0,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                    ),
                    child: MaterialButton(
                      height: 50.0,
                      onPressed: (){
                        controller.checkPincode();
                        },
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(60.0)
                      ),
                      child: Icon(Icons.check , size: 25, color: Colors.grey,),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
      ]
      ),
    );
  }

  clearPin(){
    if (pinIndex == 0)
      pinIndex = 0;
    else if (pinIndex == 4){
      setpin(pinIndex, '');
      currentPin[pinIndex -1] = '';
      pinIndex --;
    }
    else{
      setpin(pinIndex, '');
      currentPin[pinIndex - 1] = '';
      pinIndex --;
    }
  }

  pinIndexSetup (String text){
    if (pinIndex ==0){
      pinIndex = 1;
    }
    else if (pinIndex < 4)
      pinIndex ++;
    setpin (pinIndex ,text);
    currentPin [pinIndex - 1] = text;
    String strpin = '' ;
    currentPin.forEach ((e){
      strpin += e;
    });
    if (pinIndex == 4){
      print (strpin);
    }
  }

  setpin (int n , String text) {
    switch (n){
      case 1:
        controller.pinOneController.text = text ;
        break;
      case 2:
        controller.pinTwoController.text = text ;
        break;
      case 3:
        controller.pinThreeController.text = text ;
        break;
      case 4:
        controller.pinFourController.text = text ;
        break;
    }
  }

  buildPinRow(){
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        pinNumber(
          outLineInputBerder : outLineInputBorder,
          textEditingController : controller.pinOneController,

        ),
        SizedBox(width: 10.0,),
        pinNumber(
          outLineInputBerder : outLineInputBorder,
          textEditingController : controller.pinTwoController,
        ),
        SizedBox(width: 10.0,),
        pinNumber(
          outLineInputBerder : outLineInputBorder,
          textEditingController : controller.pinThreeController,
        ),
        SizedBox(width: 10.0,),
        pinNumber(
          outLineInputBerder : outLineInputBorder,
          textEditingController : controller.pinFourController,
        ),
      ],
    );
  }

}

buildExitButton (){
  return Row(
    mainAxisAlignment: MainAxisAlignment.end,
    children: [
      Padding(
        padding: const EdgeInsets.all(8.0),
        child: MaterialButton(
          onPressed: (){},
          height: 50.0,
          minWidth: 50.0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(50.0),
          ),
          child: Icon(
            Icons.clear,
            color: Color(0xFFFDC80D),
          ),
        ),
      ),
    ],
  );
}

class pinNumber extends StatelessWidget {

  final TextEditingController textEditingController;
  final OutlineInputBorder outLineInputBerder;
  pinNumber({required this.textEditingController , required this.outLineInputBerder});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 50.0,
      child: TextFormField(
        onFieldSubmitted: (value){
          print(value);
        },
        validator: (value) {
          if (value!.isEmpty) {
            return 'PIN Code can\'t be empyt';
          }
          return null;
        },
        controller: textEditingController,
        enabled: false,
        obscureText: true,
        textAlign: TextAlign.center,
        decoration: InputDecoration(
          contentPadding: EdgeInsets.all(20.0),
          border: outLineInputBerder,
          filled: true,
          fillColor: Colors.white54,
        ),
        style: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 15.0,
          color: Color(0xFFFDC80D),
        ),
      ),
    );
  }
}


class keybordNumber extends StatelessWidget {

  final int n;
  final Function() onPressed;

  keybordNumber({required this.n , required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 50.0,
      height: 50.0,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: Colors.grey,
      ),
      alignment: Alignment.center,
      child: MaterialButton(
        padding: EdgeInsets.all(8.0),
        onPressed: onPressed,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(60.0),
        ),
        height: 90.0,
        child: Text(
          '$n',
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 24*MediaQuery.of(context).textScaleFactor,
            color: Colors.black54,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties.add(DiagnosticsProperty('onPressed', onPressed));
    properties.add(DiagnosticsProperty('onPressed', onPressed));
  }
}