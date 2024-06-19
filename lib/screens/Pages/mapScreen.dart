import 'dart:async';
import 'package:driver/controller/map1Controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:geolocator/geolocator.dart';

class mapScreen extends GetView<map1Controller> {

  Completer<GoogleMapController> _controller = Completer();

  static final CameraPosition _kGooglePlex = CameraPosition(
    target: LatLng(33.510414, 36.278336),
    zoom: 14.4746,
  );

  // instance of GetStorage, to store data in key value pair.
  final locationController = GetStorage();

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
      body: Stack(
        children: [
          Container(
        width: width,
        height:height,
        child: GoogleMap(
          mapType: MapType.normal,
          initialCameraPosition: _kGooglePlex,
          onMapCreated: (GoogleMapController controller) {
            _controller.complete(controller);
          },
        ),
      ),
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                height: height*0.18,
                width: width,
                color: Colors.white,
                child: Padding(
                  padding: EdgeInsets.only(top: 30.0 , left: 10.0),
                  child:Obx( ()=> Text(
                    '${controller.latitude.value}, ${controller.longitude.value}\n ${controller.address.value}',
                  style: TextStyle(
                    fontSize: 18.0,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFFFDC80D),
                  ),
                ),
                  ),
                ),
                ),
            ],
          ),
        ]
      ),
    );
  }
}
