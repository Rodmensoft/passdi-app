import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:get/instance_manager.dart';
import 'package:passdi_app/app/constants/api_routes.dart';
import 'package:passdi_app/app/data/models/api_responde.dart';
import 'package:passdi_app/app/data/models/several_data/several_data.model.dart';

import '../../constants/catch_errors.dart';
import '../services/shared_preferences.service.dart';

class SeveralDataProvider {
  final Dio dio = Get.find();
  Future<ApiResponse> getSeveralData() async {
    try {
      final Response response = await dio.get(ApiRoutes.getSeveralData);
      if (response.statusCode == 200) {
        savePrefs(json.encode(response.data['data']));
        return ApiResponse(
          data: SeveralData.fromJson(response.data['data']),
          message: 'Éxito',
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

  void savePrefs(String data) {
    final Prefs prefs = Get.find();
    prefs.severalDataString = data;
  }
}
