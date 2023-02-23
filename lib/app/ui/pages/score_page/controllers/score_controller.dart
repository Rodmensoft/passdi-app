import 'package:get/get.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:passdi_app/app/data/models/api_responde.dart';
import 'package:passdi_app/app/data/models/requested_point/requested_points.received.dart';
import 'package:passdi_app/app/data/services/save_requested_point.service.dart';

class ScoreController extends GetxController {
  RxList<RequestedPointsReceived> allRequestedPoints =
      <RequestedPointsReceived>[].obs;
  RxBool loading = true.obs;

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
  }

  @override
  void onReady() {
    // TODO: implement onReady
    super.onReady();
    getAllRequestedPoints();
  }

  @override
  void onClose() {
    // TODO: implement onClose
    super.onClose();
  }

  getAllRequestedPoints() async {
    loading.value = true;
    final SaveRequestedPointService service = Get.find();
    ApiResponse response = await service.getAllRequestedPoints();
    loading.value = false;
    if (response.success) {
      allRequestedPoints.value = response.data as List<RequestedPointsReceived>;
      return;
    }
    toast(response.message);
  }
}
