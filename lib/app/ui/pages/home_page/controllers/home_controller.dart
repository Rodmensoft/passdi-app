import 'package:get/get.dart';

import '../../../../data/services/points.service.dart';

class HomeController extends GetxController {
  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
  }

  @override
  void onReady() {
    // TODO: implement onReady
    super.onReady();
    getUserInitSettings();
  }

  @override
  void onClose() {
    // TODO: implement onClose
    super.onClose();
  }

  getUserInitSettings() async {
    PointsService service = Get.find();
    await service.getPoints();
  }
}
