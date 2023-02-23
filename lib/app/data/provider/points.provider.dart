import 'package:dio/dio.dart';
import 'package:get/instance_manager.dart';
import 'package:passdi_app/app/data/models/api_responde.dart';
import 'package:passdi_app/app/data/services/shared_preferences.service.dart';

import '../../constants/api_routes.dart';
import '../../constants/catch_errors.dart';

class PointsProvider {
  final Dio dio = Get.find();

  Future<ApiResponse> getPoints() async {
    try {
      final Response response = await dio.get(
        options: Options(
          headers: {
            'Accept': 'application/json',
            'Content-Type': 'application/json',
            'Authorization': 'Bearer ${Get.find<Prefs>().authData.accessToken}',
          },
        ),
        ApiRoutes.getPoints,
      );
      if (response.statusCode == 200) {
        savePrefs(response.data['data']['number_points'] as int);
        return ApiResponse(
          message: '',
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

  void savePrefs(int points) {
    final Prefs prefs = Get.find();
    prefs.userNumberPoints = points;
  }
}
