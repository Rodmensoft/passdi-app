import 'package:app_viajeros/app/routes/app_routes.dart';
import 'package:get/get.dart';

class SplashController extends GetxController {
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

  Future<void> init() async {
    await 1500.milliseconds.delay.call(
      () {
        Get.offAllNamed(AppRoutes.ONBOARDING);
      },
    );
  }
}
