
import 'package:get/get.dart';
import '../controllers/score_controller.dart';


class ScoreBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ScoreController>(() => ScoreController());
  }
}
