import 'package:get/instance_manager.dart';
import 'package:passdi_app/app/data/models/api_responde.dart';
import 'package:passdi_app/app/data/models/requested_point/requested_point.sent.dart';
import 'package:passdi_app/app/data/provider/save_requested_point.provider.dart';

class SaveRequestedPointService {
  final SaveRequestedPointProvider api = Get.find();

  Future<ApiResponse> saveRequestedPoint(RequestedPointsModelSent model) =>
      api.saveRequestedPoint(model);

  Future<ApiResponse> getAllRequestedPoints() => api.getAllRequestedPoints();
}
