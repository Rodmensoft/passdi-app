import 'package:get/get.dart';
import 'package:passdi_app/app/data/services/points.service.dart';
import 'package:passdi_app/app/data/services/shared_preferences.service.dart';
import 'package:passdi_app/app/routes/app_routes.dart';

import '../../../../data/models/api_responde.dart';
import '../../../../data/models/several_data/several_data.model.dart';
import '../../../../data/services/several_data.service.dart';

class SplashController extends GetxController {
  final prefs = Get.find<Prefs>();
  SeveralData? get severalData => prefs.severalData;
  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
  }

  @override
  void onReady() {
    // TODO: implement onReady
    super.onReady();
    init();
  }

  @override
  void onClose() {
    // TODO: implement onClose
    super.onClose();
  }

  Future<void> init() async {
    // prefs.clear();
    await getSeveralData();

    String authDataString = prefs.authDataString;
    if (authDataString.isEmpty) {
      Get.offAllNamed(AppRoutes.ONBOARDING);
      return;
    }
    await getUserInitSettings();

    await Get.offAllNamed(AppRoutes.BOTTOM);
  }

  Future<void> getSeveralData() async {
    final SeveralDataService service = Get.find();
    ApiResponse response = await service.getSeveralData();
  }

  getUserInitSettings() async {
    PointsService service = Get.find();
    await service.getPoints();
  }
}
