import 'package:dio/dio.dart';
import 'package:get/instance_manager.dart';

import '../../constants/api_routes.dart';
import '../../constants/catch_errors.dart';
import '../models/api_responde.dart';
import '../models/requested_point/requested_point.dart';
import '../services/shared_preferences.service.dart';

class SaveRequestedPointProvider {
  final Dio dio = Get.find();
  Future<ApiResponse> saveRequestedPoint(RequestedPointsModel model) async {
    try {
      final Map<String, dynamic> data = model.toJson();

      final Response response = await dio.post(
        options: Options(
          headers: {
            'Accept': 'application/json',
            'Content-Type': 'application/json',
            'Authorization': 'Bearer ${Get.find<Prefs>().authData.accessToken}'
          },
        ),
        ApiRoutes.saveRequestedPoint,
        data: data,
      );
      if (response.statusCode == 200) {
        return ApiResponse(
          message: '¡Éxito!',
          success: true,
        );
      }
      return ApiResponse(
        message: 'Failed',
        success: false,
      );
    } on DioError catch (e) {
      return catchErrors(e);
    }
  }
}
