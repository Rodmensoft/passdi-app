// ignore_for_file: unnecessary_cast

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:passdi_app/app/data/models/requested_point/requested_point.dart';
import 'package:passdi_app/app/ui/global_widgets/customed_alert_dialog.dart';
import 'package:passdi_app/utils/dependency_export.dart';

class RequestPointsController extends GetxController {
  final formKey = GlobalKey<FormState>();

  final reservationCtrl = TextEditingController();
  final travelDateCtrl = TextEditingController();

  Rx<String?> origin = (null as String?).obs;
  Rx<String?> destination = (null as String?).obs;
  Rx<String?> airline = (null as String?).obs;

  RxBool loading = false.obs;

  RequestedPointsModel get model => RequestedPointsModel(
        reservationCode: reservationCtrl.text,
        travelDate: travelDateCtrl.text,
        airportOriginId: int.parse(origin.value!),
        airportDestinationId: int.parse(destination.value!),
        airlineId: int.parse(airline.value!),
      );

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

  Future<void> requestPoints() async {
    if (formKey.currentState?.validate() ?? false) {
      final SaveRequestedPointService service = Get.find();
      loading.value = true;
      final response = await service.saveRequestedPoint(model);
      loading.value = false;
      if (response.success && (Get.isDialogOpen ?? false)) {
        Get.back();
      }
      customedAlertDialog(response.message);
    }
  }
}
