import 'package:get/get.dart';

class BottomNavbarController extends GetxController {
  RxInt tabIndex = 0.obs;

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

  onTapIndex(int index) {
    tabIndex.value = index;
  }
}
