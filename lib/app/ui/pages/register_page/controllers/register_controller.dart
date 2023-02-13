import 'package:get/get.dart';

class RegisterController extends GetxController {
  RxInt currentStep = 1.obs;
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

  setIndexTrue(int key) {
    changeCurrentStep(key);
  }

  changeCurrentStep(int key) {
    currentStep.value = key + 1;
    if (currentStep.value == 4) {
      Get.back();
    }
  }
}
