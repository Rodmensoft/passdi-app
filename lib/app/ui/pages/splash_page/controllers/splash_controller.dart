import 'package:app_viajeros/app/data/services/shared_preferences.service.dart';
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
        SharedPreferencesService prefs = Get.find();
        prefs.clear();

        String authDataString = prefs.authDataString;
        if (authDataString.isEmpty) {
          Get.offAllNamed(AppRoutes.ONBOARDING);
          return;
        }

        Get.offAllNamed(AppRoutes.BOTTOM);
      },
    );
  }
}
