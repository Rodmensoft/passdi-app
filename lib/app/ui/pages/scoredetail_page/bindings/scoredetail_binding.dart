
import 'package:get/get.dart';
import '../controllers/scoredetail_controller.dart';


class ScoreDetailBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ScoreDetailController>(() => ScoreDetailController());
  }
}
