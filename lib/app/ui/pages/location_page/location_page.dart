
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import './controllers/location_controller.dart';

export './bindings/location_binding.dart';


class LocationPage extends StatelessWidget {
  const LocationPage ({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final LocationController controller =  Get.find<LocationController>();
    
    return Scaffold(
        body: SafeArea(
        child:  Column(
          children: const <Widget>[
            Text('Location Page'),
          ],
        ),
      ),
    );
  }
}
  