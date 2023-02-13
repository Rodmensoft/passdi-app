import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import './controllers/splash_controller.dart';
import '../../global_widgets/logo.dart';

export './bindings/splash_binding.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final SplashController controller = Get.find<SplashController>();
    controller.init();
    return Scaffold(
      backgroundColor: Theme.of(context).copyWith().primaryColor,
      body: Center(
          child: Logo(
        border: false,
        blur: false,
        shadow: false,
        size: 102.sp,
      )),
    );
  }
}
