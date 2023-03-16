import 'package:dio/dio.dart';
import 'package:get/instance_manager.dart';

import '../../constants/api_routes.dart';
import '../../constants/catch_errors.dart';
import '../models/api_responde.dart';
import '../services/shared_preferences.service.dart';

class UpdateLocationProvider {
  final Dio dio = Get.find();
  Future<ApiResponse> updateLocationUser(Map<String, String> data) async {
    try {
      final Response response = await dio.post(
        options: Options(
          headers: {
            'Accept': 'application/json',
            'Content-Type': 'application/json',
            'Authorization': 'Bearer ${Get.find<Prefs>().authData.accessToken}'
          },
        ),
        ApiRoutes.updateLocationUser,
        data: data,
      );
      if (response.statusCode == 200) {
        return ApiResponse(
          data: response.data,
          message: 'Actualización exitosa',
          success: true,
        );
      }
      return ApiResponse(
        message: 'Hubo un error al actualizar la ubicación',
        success: false,
      );
    } on DioError catch (e) {
      return catchErrors(e);
    }
  }
}
