
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import './controllers/profile_controller.dart';

export './bindings/profile_binding.dart';


class ProfilePage extends StatelessWidget {
  const ProfilePage ({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ProfileController controller =  Get.find<ProfileController>();
    
    return Scaffold(
        body: SafeArea(
        child:  Column(
          children: const <Widget>[
            Text('Profile Page'),
          ],
        ),
      ),
    );
  }
}
  