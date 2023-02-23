import 'package:get/instance_manager.dart';
import 'package:passdi_app/app/data/models/api_responde.dart';
import 'package:passdi_app/app/data/provider/points.provider.dart';

class PointsService {
  PointsProvider api = Get.find();

  Future<ApiResponse> getPoints() => api.getPoints();
}
