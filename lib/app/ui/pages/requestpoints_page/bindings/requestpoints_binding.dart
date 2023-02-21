
import 'package:get/get.dart';
import '../controllers/requestpoints_controller.dart';


class RequestPointsBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<RequestPointsController>(() => RequestPointsController());
  }
}
