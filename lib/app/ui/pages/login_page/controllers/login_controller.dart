import 'package:app_viajeros/app/data/models/api_responde.dart';
import 'package:app_viajeros/app/data/services/auth.service.dart';
import 'package:app_viajeros/app/ui/global_widgets/customed_alert_dialog.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nb_utils/nb_utils.dart';

import '../../../../routes/app_routes.dart';

class LoginController extends GetxController {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final emailCtrl = TextEditingController();
  final passCtrl = TextEditingController();

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
  }

  @override
  void onReady() {
    // TODO: implement onReady
    super.onReady();
  }

  @override
  void onClose() {
    // TODO: implement onClose
    super.onClose();
  }

  login() async {
    if (formKey.currentState?.validate() ?? false) {
      final AuthService service = Get.find();
      ApiResponse response = await service.login(
        email: emailCtrl.text,
        password: passCtrl.text,
      );
      if (response.success) {
        toast(
          response.message,
          bgColor: Colors.black,
          textColor: Colors.white,
        );
        Get.offAndToNamed(AppRoutes.BOTTOM);
        return;
      }
      customedAlertDialog(response.message);
    }
  }
}
